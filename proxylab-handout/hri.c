//
// Created by jet on 16-12-25.
//

#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "csapp.h"
#include "hri.h"

/* 初始化结构 */
void HRI_init(http_req_info_t* hri)
{
    hri->method[0] = '\0';
    hri->protocol[0] = '\0';
    hri->host_name[0] = '\0';
    hri->port_number[0] = '\0';
    hri->uri[0] = '\0';
    hri->protocol_version[0] = '\0';
}

/* 读入请求结构 */
void HRI_read(const char* reqbuf, http_req_info_t* hri)
{
    sscanf(reqbuf, "%s ", hri->method);
    size_t offset = strlen(hri->method) + 1;
    if (strcasecmp(hri->method, "GET") == 0)
    {
        sscanf(reqbuf + offset, "%[^:/]%*[:/]%[^:/]",
               hri->protocol, hri->host_name);
        offset += strlen(hri->protocol) + strlen(hri->host_name) + 3;

        assert(reqbuf[offset]);
        if (reqbuf[offset] == ':')
            sscanf(reqbuf + offset, "%*[:]%[^/]", hri->port_number),
                    offset += strlen(hri->port_number) + 1;
        else if (strcasecmp(hri->protocol, "https") == 0)
            strcpy(hri->port_number, "443");
        else
            strcpy(hri->port_number, "80");
        sscanf(reqbuf + offset, "%s %s", hri->uri, hri->protocol_version);
    }
    else
//    if (strcasecmp(hri->method, "CONNECT") == 0)
//    {
//        sscanf(reqbuf + offset, "%[^:/]%*[:]%[^/] %s",
//               hri->host_name, hri->port_number, hri->protocol_version);
//    }
//    else
        Pthread_exit(0);
}

/* 判断两个请求是否相同（用于Cache） */
int HRI_identical(const http_req_info_t* hri1, const http_req_info_t* hri2)
{
    return (strcasecmp(hri1->protocol, hri2->protocol) ||
            strcasecmp(hri1->host_name, hri2->host_name) ||
            strcasecmp(hri1->port_number, hri2->port_number)
            || strcasecmp(hri1->uri, hri2->uri)
            || strcasecmp(hri1->uri, hri2->uri)) == 0;
}