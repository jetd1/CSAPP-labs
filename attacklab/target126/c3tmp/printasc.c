#include <stdio.h>

int main()
{
    char c;
    while (c = getchar())
        printf("%2x ", c);
}