#include "mm.h"

int main()
{
    mm_init();
    CHECKHEAP;
    void* m = malloc(100);
    CHECKHEAP;
    void* c = calloc(10, 8);
    CHECKHEAP;
    void* r = realloc(m, 1000);
    CHECKHEAP;
    printf("%lu\n%lu\n%lu", (unsigned long)m, (unsigned long)c, (unsigned long)r);
    free(c);
    CHECKHEAP;
    free(r);
    CHECKHEAP;
}