/*
 * mm.c
 *
 * By Jet Zhang (张孝帅 1500010716)
 * A naive implementation of malloc using segregated list and
 * best fit strategy.
 *
 * There are 10 lists:
 *      0~2 double word size
 *      ~4
 *      ~8
 *      ~16
 *      ~32
 *      ~64
 *      ~128
 *      ~256
 *      ~512
 *      512~
 *
 * Ref. glibc implementation.
 *
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>

#include "mm.h"
#include "memlib.h"

/* If you want debugging output, use the following macro.  When you hand
 * in, remove the #define DEBUG line. */
#undef DEBUG
#ifdef DEBUG
#define dbg_printf(...) printf(__VA_ARGS__)
#else
#define dbg_printf(...)
#endif

/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(p) (((size_t)(p) + (ALIGNMENT - 1)) & ~0x7)

/* Jet's Macro */
/* Basic constants and macros */

#define WSIZE       4               /* Word and header/footer size (bytes) */
#define DSIZE       8               /* Double word size (bytes) */
#define INITSIZE    (14 * WSIZE)    /* Initial size of heap */
#define CHUNKSIZE   (1 << 9)        /* Extend heap by this amount (bytes) */
#define SEGLISTNUM  10

#define MAX(x, y) ((x) > (y) ? (x) : (y))

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc) ((size) | (alloc))

/* Read and write a word at address p */
#define GET(p)              (*(unsigned int *)(p))
#define PUT(p, val)         (*(unsigned int *)(p) = (val))
#define GET_NEXT(p)         (*((unsigned int *)(p) + 1))

/* Read header information from address p */
#define GET_SIZE(p)         (GET(p) & ~0x7)
#define GET_ALLOC(p)        (GET(p) & 0x1)
#define GET_PREV_ALLOC(p)   (GET(p) & 0x2)
#define GET_TAIL(p)         (GET(p) & 0x4)

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp)            ((char *)(bp) - WSIZE)
#define FTRP(bp)            ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

#define ALLOC(bp)           (*HDRP(bp) |= 0x2)
#define FREE(bp)            (*HDRP(bp) &= ~0x2)
#define TAIL(bp)            (*HDRP(bp) |= 0x4)

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp)       ((char *)(bp) + GET_SIZE(((char *)(bp) - WSIZE)))
#define PREV_BLKP(bp)       ((char *)(bp) - GET_SIZE(((char *)(bp) - DSIZE)))

#define PREV_BLKP_O(bp) (GETADDR(GET_NEXT(bp)))
#define NEXT_BLKP_O(bp) (GETADDR(GET(bp)))

#define SIZE_T_SIZE         (ALIGN(sizeof(size_t)))
#define SIZE_PTR(p)         ((size_t*)(((char*)(p)) - SIZE_T_SIZE))
#define LIST(list_number)   (ptr)(heap_listp + (list_number * WSIZE))

#define GETOFFSET(bp)       ((unsigned int)((long)bp - (long)heap_start_addr))
#define GETADDR(offset)     ((ptr)((long)heap_start_addr + (long)offset))

typedef void* ptr;
typedef unsigned long ulong;
typedef char* byte_ptr;

/* Private global variables */
static byte_ptr heap_listp;  /* Pointer to first block */
static byte_ptr heap_last_block;
static ulong heap_start_addr;

/* Private functions */
static void list_add_block(ptr bp);

static void list_remove_block(ptr bp);

static ptr extend_heap(size_t size);

static ptr get_best_fit(size_t size);

static ptr traverse_list(ptr start, size_t size);

static ptr get_list(size_t size);

static ptr coalesce(ptr bp);

static void set_block(ptr bp, size_t asize);

static void check_freelist();


/*
 * Initialize: return -1 on error, 0 on success.
 * initialize the heap and the seg list pointers.
 */
int mm_init(void)
{
    /* 创建堆并分配空间 */
    heap_listp = mem_sbrk(INITSIZE);
    if (heap_listp == (ptr) -1)
        return -1;

    /* alignment,  prolog\epilog */
    PUT(heap_listp, 0);
    PUT(heap_listp + WSIZE, PACK(6 * DSIZE, 1));
    PUT(heap_listp + 12 * WSIZE, PACK(6 * DSIZE, 1));
    PUT(heap_listp + 13 * WSIZE, PACK(0, 3));

    heap_start_addr = (ulong) heap_listp;
    heap_listp += 2 * WSIZE;
    heap_last_block = heap_listp + (12 * WSIZE);

    /* Initialize seg list pointers */
    for (int i = 0; i < SEGLISTNUM; i++)
        PUT(heap_listp + (i * WSIZE), 0);


    /* Extend the heap for CHUNCKSIZE */
    if (extend_heap(CHUNKSIZE) == NULL)
        return -1;

    return 0;
}

/*
 * malloc
 * the malloc funtion, allocate the block
 * first get_best_fit free block and then set_block
 * if no free block availible then extend_heap
 */
void* malloc(size_t size)
{
    if (size == 0)
        return NULL;

    //保证分配最小值及对齐
    if (size <= DSIZE)
        size = 2 * DSIZE;
    else
        size = DSIZE * ((size + (WSIZE) + (DSIZE - 1)) / DSIZE);


    //调用函数取得最佳空闲块位置
    ptr bp;
    if ((bp = get_best_fit(size)) != NULL)
    {
        //设置block头部尾部，更新seglist
        set_block(bp, size);

        return bp;
    }

    //没有合适的块，需要扩充堆空间
    if ((bp = extend_heap(size)) == NULL)
        return NULL;
    set_block(bp, size);

    return bp;
}

/*
 * free
 * free allocated blocks
 * set block header, footer
 * and coalecse free blocks
 */
void free(void* bp)
{
    if (bp == 0)
        return;

    if (heap_listp == 0)
        mm_init();

    size_t size = GET_SIZE(HDRP(bp));
    PUT(HDRP(bp), PACK(size, GET_PREV_ALLOC(HDRP(bp))));
    PUT(FTRP(bp), PACK(size, 0));
    coalesce(bp);
}

/*
 * realloc - you may want to look at mm-naive.c
 * Remain unchanged
 */
void* realloc(void* oldptr, size_t size)
{
    /* If size == 0 then this is just free, and we return NULL. */
    if (size == 0)
    {
        free(oldptr);
        return NULL;
    }

    /* If oldptr is NULL, then this is just malloc. */
    if (oldptr == NULL)
        return malloc(size);

    ptr newptr = malloc(size);

    /* If realloc() fails the original block is left untouched  */
    if (!newptr)
        return NULL;

    /* Copy the old data. */
    size_t oldsize = *SIZE_PTR(oldptr);
    if (size < oldsize)
        oldsize = size;
    memcpy(newptr, oldptr, oldsize);

    /* Free the old block. */
    free(oldptr);

    return newptr;
}

/*
 * calloc - you may want to look at mm-naive.c
 * This function is not tested by mdriver, but it is
 * needed to run the traces.
 */
void* calloc(size_t nmemb, size_t size)
{
    size_t msize = nmemb * size;
    ptr bp = malloc(msize);
    memset(bp, 0, msize);
    return bp;
}

/*
 * Return whether the pointer is in the heap.
 * May be useful for debugging.
 */
static int in_heap(const void* p)
{
    return p <= mem_heap_hi() && p >= mem_heap_lo();
}

/*
 * Return whether the pointer is aligned.
 * May be useful for debugging.
 */
static int aligned(const void* p)
{
    return (size_t) ALIGN(p) == (size_t) p;
}

/*
 * Jet's private functions
 */


/*
 * extend_heap - extend heap by at least
 * size bytes
 */
static ptr extend_heap(size_t size)
{
    if (size < CHUNKSIZE)
        size = CHUNKSIZE;
    size_t words = (size + (WSIZE - 1)) / WSIZE;
    size = (((words + 1) / 2) * 2) * WSIZE;

    ptr bp = mem_sbrk((int) size);
    if ((long) bp == -1)
        return NULL;

    int prev_alloc = GET_PREV_ALLOC(HDRP(heap_last_block));
    PUT(HDRP(bp), PACK(size, prev_alloc));
    PUT(FTRP(bp), PACK(size, 0));

    heap_last_block = NEXT_BLKP(bp);
    PUT(HDRP(heap_last_block), PACK(0, 1));

    return coalesce(bp);
}

/*
 * coalesce - coalesce free blocks
 * Nearly unchanged
 */
static ptr coalesce(ptr bp)
{
    size_t prev_alloc = GET_PREV_ALLOC(HDRP(bp));
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
    size_t size = GET_SIZE(HDRP(bp));

    if (prev_alloc && next_alloc)       /* Case 1 */
    {
        PUT(HDRP(bp), PACK(size, 2));
        PUT(FTRP(bp), PACK(size, 0));
        FREE(NEXT_BLKP(bp));
    }
    else if (prev_alloc && !next_alloc) /* Case 2 */
    {
        list_remove_block(NEXT_BLKP(bp));
        size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
        PUT(HDRP(bp), PACK(size, 2));
        PUT(FTRP(bp), PACK(size, 0));
    }
    else if (!prev_alloc && next_alloc) /* Case 3 */
    {
        list_remove_block(PREV_BLKP(bp));
        size += GET_SIZE(HDRP(PREV_BLKP(bp)));
        PUT(FTRP(bp), PACK(size, 0));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 2));
        FREE(NEXT_BLKP(bp));
        bp = PREV_BLKP(bp);
    }
    else                                /* Case 4 */
    {
        list_remove_block(PREV_BLKP(bp));
        list_remove_block(NEXT_BLKP(bp));
        size += GET_SIZE(HDRP(PREV_BLKP(bp))) +
                GET_SIZE(HDRP(NEXT_BLKP(bp)));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 2));
        PUT(FTRP(PREV_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }

    list_add_block(bp);

#ifdef DEBUG
    mm_checkheap(0);
#endif

    return bp;

}

/*
 * get_best_fit - traverse seg lists
 * to get a best fit block
 * (Best fit strategy)
 */
static ptr get_best_fit(size_t size)
{
    ptr list = get_list(size);
    ptr fit_bp = traverse_list(list, size);

    while (fit_bp == NULL)
    {
        list += WSIZE;
        if (list >= LIST(10))
            return NULL;
        fit_bp = traverse_list(list, size);
    }

    return fit_bp;
}

/*
 * traverse_list - traverse a seg list
 * to get a best fit block
 * (Inner routine of get_best_fit)
 */
static ptr traverse_list(ptr start, size_t size)
{
    if (GET(start) == 0)
        return NULL;

    ptr choice = NULL;
    size_t choice_size = (size_t) -1;
    for (ptr bp = NEXT_BLKP_O(start); GETOFFSET(bp); bp = NEXT_BLKP_O(bp))
    {
        size_t cur_size = GET_SIZE(HDRP(bp));
        if (cur_size == size)
            return bp;
        else if ((cur_size > size) && (cur_size < choice_size))
            choice = bp, choice_size = cur_size;
    }
    return choice;
}

/*
 * get_list - given a size, return the seg
 * list address maintain the free blocks sized
 * properly
 */
static inline ptr get_list(size_t size)
{
    size_t key = (size + DSIZE - 1) / DSIZE;

    if (key <= 2)
        return LIST(0);
    if (key <= 4)
        return LIST(1);
    if (key <= 8)
        return LIST(2);
    if (key <= 16)
        return LIST(3);
    if (key <= 32)
        return LIST(4);
    if (key <= 64)
        return LIST(5);
    if (key <= 128)
        return LIST(6);
    if (key <= 256)
        return LIST(7);
    if (key <= 512)
        return LIST(8);

    return LIST(9);
}


/*
 * list_add_block - add a block to
 * seg list
 */
static void list_add_block(ptr bp)
{
    ptr list_ptr = get_list(GET_SIZE(HDRP(bp)));
    if (GET(list_ptr) == 0)
    {
        PUT(list_ptr, GETOFFSET(bp));
        PUT(bp, 0);
        PUT(bp + WSIZE, GETOFFSET(list_ptr));
        TAIL(bp);
    }
    else
    {
        PUT(bp + WSIZE, GETOFFSET(list_ptr));
        PUT(bp, GETOFFSET((ptr) NEXT_BLKP_O(list_ptr)));
        PUT(NEXT_BLKP_O(bp) + WSIZE, GETOFFSET(bp));
        PUT(list_ptr, GETOFFSET(bp));
    }
}

/*
 * set_block - namely place function in naive
 * implementation. Place block sized asize at bp
 * Nearly unchanged
 */
static void set_block(void* bp, size_t asize)
{
    size_t csize = GET_SIZE(HDRP(bp));

    if ((csize - asize) >= (2 * DSIZE))
    {
        list_remove_block(bp);
        PUT(HDRP(bp), PACK(asize, 3));
        bp = NEXT_BLKP(bp);
        PUT(HDRP(bp), PACK(csize - asize, 2));
        PUT(FTRP(bp), PACK(csize - asize, 0));
        list_add_block(bp);
    }
    else
    {
        PUT(HDRP(bp), PACK(csize, 3));
        ALLOC(NEXT_BLKP(bp));
        list_remove_block(bp);
    }

#ifdef DEBUG
    mm_checkheap(0);
#endif

    return;
}

/*
 * list_remove_block - remove a block from
 * sig list
 */
static void list_remove_block(void* bp)
{
    if (GET_TAIL(HDRP(bp)))
        PUT(PREV_BLKP_O(bp), 0);
    else
    {
        PUT(PREV_BLKP_O(bp), GET(bp));
        PUT(NEXT_BLKP_O(bp) + WSIZE, GET_NEXT(bp));
    }
}

void mm_checkheap(int ign)
{
    /* 让gcc开心 */
    ign = ign;
#ifdef DEBUG

    /* Check prologue */
    if (GET_SIZE(HDRP(heap_listp)) != 6 * DSIZE)
        dbg_printf("Warning: Prologue header - size error\n");

    if (!GET_ALLOC(HDRP(heap_listp)))
        dbg_printf("Warning: Prologue header - allocate error\n");

    if ((GET_SIZE(FTRP(heap_listp)) != 6 * DSIZE))
        dbg_printf("Warning: Prologue footer - size error\n");

    if (!GET_ALLOC(FTRP(heap_listp)))
        dbg_printf("Warning: Prologue footer - allocate error\n");

    /* Check blocks */
    ptr bp;
    for (bp = heap_listp + 12 * WSIZE;
         GET_SIZE(HDRP(bp)) != 0; bp = NEXT_BLKP(bp))
    {
        if (!aligned(bp))
            dbg_printf("Warning: %p is not aligned\n", bp);

        if (!GET_ALLOC(HDRP(bp)) && GET_SIZE(HDRP(bp)) != GET_SIZE(FTRP(bp)))
            dbg_printf("Warning: Header does not match footer at %p\n", bp);
    }

    /* Check epilogue */
    if (GET_SIZE(HDRP(bp)) != 0)
        dbg_printf("Bad epilogue header: size error\n");

    if (!GET_ALLOC(HDRP(bp)))
        dbg_printf("Bad epilogue header: allocate error\n");


    /* Check seg list */
    for (int j = 0; j < SEGLISTNUM; j++)
        for (bp = heap_listp + j * WSIZE;
             (GET(bp) != 0) && (!GET_TAIL(HDRP(bp))); bp = NEXT_BLKP_O(bp))
        {
            if (!in_heap(bp))
                    dbg_printf("Seg list out of heap!!!\n");

            if ((GET_ALLOC(HDRP(NEXT_BLKP_O(bp))) == 1) &&
                NEXT_BLKP_O(bp) != heap_last_block)
                    dbg_printf("Bad seg list pointer %p\n", bp);

            if ((GET_ALLOC(HDRP(PREV_BLKP_O(bp))) == 1) &&
                PREV_BLKP_O(bp) != heap_listp + j * WSIZE)
                    dbg_printf("Bad previous pointer %p\n", bp);
        }
#endif
}

