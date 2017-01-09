//
// Created by jet on 16-12-25.
//
#include <time.h>
#include <limits.h>
#include <assert.h>
#include "cache.h"
#include "defs.h"
#include "res.h"

/* 全局cache信息结构及其互斥锁 */
cache_info proxy_cache;
pthread_mutex_t cache_lock;

/* 每个cache项目的字数 */
void cache_init()
{
    pthread_mutex_init(&cache_lock, NULL);
    proxy_cache.first = NULL;
    proxy_cache.total_size = 0;
}

/* 从cache中取数据（无符合条件数据返回NULL） */
res_t* cache_get(const http_req_info_t* hri)
{
    pthread_mutex_lock(&cache_lock);
    cache_item_t* p = proxy_cache.first;
    while (p != NULL)
    {
        if (HRI_identical(&(p->req_info), hri))
            break;
        p = p->next;
    }
    res_t* ret = NULL;
    if (p != NULL)
    {
        p->recent_use_time = time(NULL);
        ret = &(p->res);
    }
    pthread_mutex_unlock(&cache_lock);

    return ret;
}

/* 从数据中驱逐最老的一项 */
/* 此时必在已锁状态 */
static void cache_evict()
{
    cache_item_t* p = proxy_cache.first;
    cache_item_t* pprev = proxy_cache.first;
    time_t longest_time = LONG_MAX;
    cache_item_t* oldest = NULL;
    cache_item_t* oldestprev = NULL;
    while (p != NULL)
    {
        if (p->recent_use_time < longest_time)
        {
            longest_time = p->recent_use_time;
            oldest = p;
            oldestprev = pprev;
        }
        pprev = p;
        p = p->next;
    }

    if (oldestprev == proxy_cache.first)
        proxy_cache.first = oldest->next;
    else
        oldestprev->next = oldest->next;
    proxy_cache.total_size -= oldest->res.content_length;
    Free(oldest);
}

/* 从cache中取数据 */
void cache_write(const http_req_info_t* hri, const res_t* res)
{
    if (res->content_length > MAX_OBJECT_SIZE)
        return;

    cache_item_t* new_item = (cache_item_t*) Malloc(sizeof(cache_item_t));
    new_item->req_info = *hri;
    new_item->res = *res;
    new_item->recent_use_time = time(NULL);

    pthread_mutex_lock(&cache_lock);
    while (proxy_cache.total_size + res->content_length > MAX_CACHE_SIZE)
        cache_evict();
    new_item->next = proxy_cache.first;
    proxy_cache.first = new_item;
    proxy_cache.total_size += new_item->res.content_length;
    pthread_mutex_unlock(&cache_lock);

}
