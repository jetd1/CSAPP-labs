/*
 * - csim.c
 *
 * Cache, in the way it should be.
 * Cache Simulator Pro(R) 1.1
 * 
 *   The new Cache Simulator Pro(R) combines the fundamentals of a 
 * cache simulator with amazingly powerful debug performance.
 *
 *
 * - Debug like never before.
 *
 *   With our newly designed debug mode, it's extremely easy for you to
 * debug every instruction just inside your terminal. Simply call our
 * new Cache Simulator Pro(R) with '-d', and every load, every store and
 * every modification to your cache will appear on you screen.
 *
 * - Verbosity, the new sexy.
 *
 *   Use command line argument -v in our new Cache Simulator Pro(R) to
 * enable verbose mode, which is very much verbose as is named. With 
 * incredibly beautiful and elegant display, you can see every detail
 * of each instruments in a way you'd never seen before.
 *
 *
 * Redefine the Cache.
 *              By Jet🛪
 *
 * Last Modified 11.13 05:06 UTC+8
 */
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include <stdbool.h>
#include "cachelab.h"

bool verbose_mode = false;
bool debug_mode = false;

int cache_s = -1;
int cache_E = -1;
int cache_b = -1;
long cache_S = -1;
FILE *trace_file = NULL;
char *trace_file_path = NULL;

bool s_fetched = false;
bool E_fetched = false;
bool b_fetched = false;
bool path_fetched = false;

int hits = 0;
int misses = 0;
int evictions = 0;

unsigned long MASK = (unsigned long) -1;
unsigned long MASK_TAG;
unsigned long MASK_SET;
unsigned long MASK_OFFSET;

typedef struct
{
    int valid;
    int uptime;
    long tag;
}line_t;

typedef line_t *set_t;
typedef set_t *cache_t;

cache_t cache;

void print_help();

void print_cache();

void cache_init();

void cache_sim();

/*
 * Read all the command line arguments,
 * set global variables, then initialize
 * and call the simulator.
 */
int main(int argc, char **argv)
{
    int c;

    /* Parse the command line arguments */
    while ((c = getopt(argc, argv, "hvds:E:b:t:")) != -1)
    {
        switch (c)
        {
            case 'h':
                print_help();
                exit(0);
            case 'v':
                verbose_mode = true;
                break;
            case 'd':
                debug_mode = true;
                break;
            case 's':
                cache_s = atoi(optarg);
                s_fetched = true;
                break;
            case 'E':
                cache_E = atoi(optarg);
                E_fetched = true;
                break;
            case 'b':
                cache_b = atoi(optarg);
                b_fetched = true;
                break;
            case 't':
                trace_file_path = optarg;
                path_fetched = true;
                break;
            case '?':
                printf("\n");
                print_help();
                exit(1);
            default:
                printf("Invalid option '%c'\n", c);
                print_help();
                exit(2);
        }
    }

    /* Do we have everything we need? */
    if (!s_fetched)
    {
        printf("No cache 's' provided!\n");
        exit(3);
    }

    if (!E_fetched)
    {
        printf("No cache 'E' provided!\n");
        exit(4);
    }

    if (!b_fetched)
    {
        printf("No cache 'b' provided!\n");
        exit(5);
    }

    if (!path_fetched)
    {
        printf("No trace file provided!\n");
        exit(6);
    }

    /* Do we have too many arguments? */
    if (optind < argc)
    {
        printf("Too many command line arguments:");
        for (int i = optind; i < argc; i++)
            printf(" %s", argv[i]);
        printf("\n");
    }

    cache_init();
    cache_sim();
    printSummary(hits, misses, evictions);

    for (int i = 0; i < cache_S; i++)
        free(cache[i]);
    free(cache);
}

/* To print help */
void print_help()
{
    printf("csim - A Cache Simulator written by Jet.\n");
    printf("\n");
    printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
    printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
    printf("Options:\n");
    printf("  -h         Print this help message.\n");
    printf("  -v         Optional verbose flag.\n");
    printf("  -s <num>   Number of set index bits.\n");
    printf("  -E <num>   Number of lines per set.\n");
    printf("  -b <num>   Number of block offset bits.\n");
    printf("  -t <file>  Trace file.\n");
    printf("\n");
    printf("Examples:\n");
    printf("  linux>  ./csim -s 4 -E 1 -b 4 -t traces/yi.trace\n");
    printf("  linux>  ./csim -v -s 8 -E 2 -b 4 -t traces/yi.trace\n");
}

/* To check all the arguments read,
 * open trace file, set MASKs and
 * initialize the memory used in
 * cache.
 */
void cache_init()
{
    if (cache_s <= 0)
    {
        printf("Invalid cache s = %d\n", cache_s);
        exit(7);
    }

    if (cache_E <= 0)
    {
        printf("Invalid cache E = %d\n", cache_E);
        exit(8);
    }

    if (cache_b <= 0)
    {
        printf("Invalid cache b = %d\n", cache_b);
        exit(9);
    }

    if (!trace_file_path)
    {
        printf("Invalid trace file path!\n");
        exit(10);
    }

    trace_file = fopen(trace_file_path, "r");
    if (!trace_file)
    {
        fprintf(stderr, "Couldn't read trace file from %s\n", trace_file_path);
        exit(11);
    }

    MASK_TAG = MASK << (cache_s + cache_b);
    MASK_SET = (MASK << cache_b) - MASK_TAG;
    MASK_OFFSET = MASK - MASK_TAG - MASK_SET;
    cache_S = (1 << cache_s);

    cache = (cache_t) malloc((1 << cache_s) * sizeof(set_t));
    for (int i = 0; i < cache_S; i++)
    {
        size_t set_size = cache_E * sizeof(line_t);
        cache[i] = (set_t) malloc(set_size);
        memset(cache[i], 0, set_size);
    }
}

/* Get tag of an address */
long get_tag(long address)
{
    return (address & MASK_TAG) >> (cache_s + cache_b);
}

/* Get set_id of an address */
long get_set_id(long address)
{
    return (address & MASK_SET) >> cache_b;
}

/* Compare function to support
 * cache writing and eviction.
 */
int line_cmp(const void *line1, const void *line2)
{
    if (((line_t *) line1)->valid && ((line_t *) line2)->valid)
        return ((line_t *) line2)->uptime - ((line_t *) line1)->uptime;
    return ((line_t *) line1)->valid ? 1 : -1;
}

/* To sort cache lines in all the sets */
void cache_sort()
{
    for (int i = 0; i < cache_S; i++)
        qsort(cache[i], cache_E, sizeof(line_t), line_cmp);
}

/* The main logic to simulate the cache */
void cache_sim()
{
    char ins = 0;
    int line_num = 0;
    unsigned long address = 0;
    if (debug_mode)
        print_cache();
    while ((ins = fgetc(trace_file)) != EOF)
    {
        line_num++;

        if (ins == 'I')
        {
            fscanf(trace_file, "%*[^\n]%*c");
            printf("Line %d:\tI\n", line_num);
            continue;
        }

        ins = fgetc(trace_file);
        if (ins != 'L' && ins != 'S' && ins != 'M')
        {
            fprintf(stderr, "Invalid trace file!\nExiting!\n");
            exit(12);
        }

        fscanf(trace_file, "%lx%*[^\n]%*c", &address);
        long tag = get_tag(address);
        long set_id = get_set_id(address);

        set_t curSet = cache[set_id];
        bool cache_hit = false;
        bool cache_evicted = false;
        long evicted_tag = 0;
        for (int i = 0; i < cache_E; i++)
        {
            line_t *curLine = curSet + i;
            if (!(curLine->valid))
                continue;
            (curLine->uptime)++;
            if (curLine->tag == tag)
            {
                cache_hit = true;
                curLine->uptime = 0;
                continue;
            }
        }

        if (!cache_hit)
        {
            if (curSet[0].valid)
            {
                cache_evicted = true;
                evicted_tag = curSet[0].tag;
                curSet[0].valid = true;
            }
            curSet[0].valid = true;
            curSet[0].tag = tag;
            curSet[0].uptime = 0;
        }

        if (verbose_mode)
        {
            printf("Line  %d:\t%c\t%16lx\t%16lx\t%16lx\t", line_num, ins, address, set_id, tag);
            if (cache_hit)
                printf("hit\t");
            else
                printf("miss\t");
            if (cache_evicted)
                printf("evicted(%16lx)", evicted_tag);
            if (ins == 'M')
                printf("\t\t\tS\t%16lx\thit", address);
            printf("\n");
        }

        hits += cache_hit + (ins == 'M');
        misses += !cache_hit;
        evictions += cache_evicted;

        cache_sort();
        if (debug_mode)
            print_cache();
    }
}

/* Print all the caches.
 * Used in debug mode.
 */
void print_cache()
{
    printf("\n");
    for (int i = 0; i < cache_S; i++)
    {
        printf("Set %d:\n", i);
        for (int j = 0; j < cache_E; j++)
        {
            printf("Line %d: %d, %lx, %d\n",
                   j, cache[i][j].valid, cache[i][j].tag, cache[i][j].uptime);
        }
    }
}
