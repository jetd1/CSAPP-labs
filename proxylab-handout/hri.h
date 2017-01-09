//
// Created by jet on 16-12-25.
//

#ifndef PROXYLAB_HANDOUT_HRI_H
#define PROXYLAB_HANDOUT_HRI_H

/* 从客户端读入的请求结构 */
typedef struct
{
    char host_name[1024];
    char uri[1024];
    char method[10];
    char protocol[10];
    char port_number[6];
    char protocol_version[10];
}http_req_info_t;

/* 初始化结构 */
void HRI_init(http_req_info_t* hri);

/* 读入请求结构 */
void HRI_read(const char* reqbuf, http_req_info_t* hri);

/* 判断两个请求是否相同（用于Cache） */
int HRI_identical(const http_req_info_t* hri1, const http_req_info_t* hri2);

#endif //PROXYLAB_HANDOUT_HRI_H
