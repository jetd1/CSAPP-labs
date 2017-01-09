/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 *
 * Different strategies for 64x64, 61x67 uses block size 16 and others
 * with block size 8.
 * 32x32: 287
 * 64x64: 1165
 * 61x67: 1809
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    REQUIRES(M > 0);
    REQUIRES(N > 0);

    int x, y;
    int i, j;
    int cur_x, cur_y;
    int next_x, next_y;
    int next_xx, next_yy;
    int diag, diag_ind;

    if (M >= 64 && N >= 64)
    {
        for (y = 0; y < M; y += 8)
            for (x = 0; x < N; x += 8)
            {
                next_x = cur_x = y;
                next_y = cur_y = x;
                do
                {
                    next_y += 8;
                    if (next_y >= N)
                    {
                        next_x += 8;
                        next_y -= N;
                    }
                } while (y == next_y);

                next_xx = next_x;
                next_yy = next_y;
                do
                {
                    next_yy += 8;
                    if (next_yy >= N)
                    {
                        next_xx += 8;
                        next_yy -= N;
                    }
                } while (y == next_yy);
                if (next_x >= M)
                    for (i = 0; i < 8; i++)
                        for (j = 0; j < 8; j++)
                            B[cur_x + j][cur_y + i] = A[x + i][y + j];
                else
                {

                    for (i = 0; i < 4; i++)
                        for (j = 0; j < 8; j++)
                            B[next_x + i][next_y + j] = 
                                A[x + i][y + j];
                    for (i = 0; i < 4; i++)
                        for (j = 0; j < 8; j++)
                            B[next_xx + i][next_yy + j] = 
                                A[x + 4 + i][y + j];
                    for (i = 0; i < 4; i++)
                        for (j = 0; j < 4; j++)
                        {
                            B[cur_x + j][cur_y + i] = 
                                B[next_x + i][next_y + j];
                            B[cur_x + j][cur_y + 4 + i] = 
                                B[next_xx + i][next_yy + j];
                        }
                    for (i = 0; i < 4; i++)
                        for (j = 0; j < 4; j++)
                        {
                            B[cur_x + 4 + j][cur_y + i] = 
                                B[next_x + i][next_y + 4 + j];
                            B[cur_x + 4 + j][cur_y + 4 + i] = 
                                B[next_xx + i][next_yy + 4 + j];
                        }
                }
            }
        return;
    }
    else if (M == 61 && N == 67)
        cur_x = 16;
    else
        cur_x = 8;

    for (i = 0; i < M; i += cur_x)
        for (j = 0; j < N; j += cur_x)
            for (x = j; (x < N) && (x < j + cur_x); x++)
            {
                for (y = i; (y < M) && (y < i + cur_x); y++)
                    if (x == y)
                    {
                        diag = A[x][x];
                        diag_ind = x;
                    } else
                        B[y][x] = A[x][y];
                if (j == i)
                    B[diag_ind][diag_ind] = diag;
            }

    ENSURES(is_transpose(M, N, A, B));
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

