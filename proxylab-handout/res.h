//
// Created by jet on 16-12-25.
//

#include <stddef.h>
#include "csapp.h"

#ifndef PROXYLAB_HANDOUT_RES_H

/* response 结构 */
typedef struct
{
    char header[MAXLINE];
    size_t content_length;
    char* content;
}res_t;

/* 由远程服务器返回内容生成response */
void gen_response(int proxyfd, res_t* res);

#define PROXYLAB_HANDOUT_RES_H

#endif //PROXYLAB_HANDOUT_RES_H
