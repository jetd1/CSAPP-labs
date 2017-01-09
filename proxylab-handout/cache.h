//
// Created by jet on 16-12-25.
//

#ifndef PROXYLAB_HANDOUT_CACHE_H
#define PROXYLAB_HANDOUT_CACHE_H

#include "hri.h"
#include "res.h"

/* 每个cache项目的字数 */
typedef struct CACHE_ITEM_T
{
    http_req_info_t req_info;
    res_t res;
    time_t recent_use_time;
    struct CACHE_ITEM_T* next;
} cache_item_t;

/* 全局唯一的cache信息 */
typedef struct
{
    cache_item_t* first;
    size_t total_size;
}cache_info;

/* cache初始化 */
void cache_init();

/* 从cache中取数据（无符合条件数据返回NULL） */
res_t* cache_get(const http_req_info_t* hri);

/* 从cache中取数据 */
void cache_write(const http_req_info_t* hri, const res_t* res);

#endif //PROXYLAB_HANDOUT_CACHE_H
