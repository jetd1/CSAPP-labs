/* 
 * Proxy Lab的主程序
 * 包含程序的入口点以及各工作线程的
 * 目前该代理程序能正常处理所有HTTP GET请求（包括GET 
 * https协议的网页），但无法处理CONNECT等其他请求。
 * 另外，处理chunked编码网页时也有一定概率出现问题。
 *
 */
#include <stdio.h>
#include <time.h>
#include "csapp.h"
#include "proxy.h"
#include "defs.h"
#include "hri.h"
#include "res.h"
#include "cache.h"

/* UA定义 */
char* jet_useragent = "Mozilla/5.0 (X11; Linux x86_64) " \
        "AppleWebKit/537.36 (KHTML, like Gecko) JProxy/1.0 Safari/537.360;";

/* 
 * 程序的入口点, 第一个参数为要监听的端口 
 *
 * 在进入监听循环前忽略SIGPIPE信号，并初始化代理缓存，
 * 初始化监听套接字及其描述符，开始监听客户端请求。
 *
 */
int main(int argc, char** argv)
{
    long listenfd, connfd;
    socklen_t clientlen;
    struct sockaddr_storage clientaddr;
    char client_hostname[MAXLINE], client_port[MAXLINE];

    Signal(SIGPIPE, SIG_IGN);
    srand((unsigned) time(NULL));
    cache_init();

    listenfd = Open_listenfd(argv[1]);

    while (1)
    {
        clientlen = sizeof(struct sockaddr_storage);
        connfd = Accept(listenfd, (SA*) &clientaddr, &clientlen);

        Getnameinfo((SA*) &clientaddr, clientlen,
                    client_hostname, MAXLINE, client_port, MAXLINE, 0);

        printf("Connected to (%s, %s)\n", client_hostname, client_port);

        /* 建立子线程处理代理请求 */
        pthread_t worker;
        Pthread_create(&worker, NULL, (void*) routine, (void*) connfd);
    }
}

/* 子线程工作函数 */
void routine(int connfd)
{
    /* 先detach自己，免得main操心 */
    Pthread_detach(Pthread_self());

    /* 读入来自客户端的代理请求 */
    char req[MAXLINE] = "";
    read_req(connfd, req);
    puts(req);

    /* 解析代理请求的信息 */
    http_req_info_t req_info;
    HRI_init(&req_info);
    HRI_read(req, &req_info);

    /* 检查cache中是否有已缓存的内容 */
    int cache_hit = 1;
    res_t* res = cache_get(&req_info);

    /* 如果缓存不命中 */
    if (res == NULL)
    {
        cache_hit = 0;
        res = (res_t*) Malloc(sizeof(res_t));
        int proxyfd = 0;

        /* 调用curl处理https请求（tricky，非lab要求范围） */
        if (strcasecmp(req_info.protocol, "https") == 0)
        {
            char cmd[MAXLINE] = "curl -v -i https://";
            strcat(cmd, req_info.host_name);
            strcat(cmd, req_info.uri);
            strcat(cmd, " > ");
            char fn[MAXLINE] = "./.proxytmp";
            char num[13];
            sprintf(num, "%d", rand());
            strcat(fn, num);
            strcat(cmd, fn);
            system(cmd);
            proxyfd = Open(fn, O_RDONLY, 0);
        }
        else /* 非https请求直接按解析的信息连接 */
            proxyfd = Open_clientfd(req_info.host_name, req_info.port_number);
        
        /* 未正常连接到请求的服务器，放弃 */
        if (proxyfd < 0)
        {
            Close(connfd);
            pthread_exit(0);
        }

        /* 根据客户端请求向远程服务器发送GET请求 */
        char proxy_req[MAXLINE] = "";
        sprintf(proxy_req, "%s %s HTTP/1.0\r\nHost: %s\r\nUser-Agent: %s\r\n"
                        "Connection: close\r\nProxy-Connection: close\r\n\r\n"
                ,req_info.method, req_info.uri,
                req_info.host_name, jet_useragent);

        Rio_writen(proxyfd, proxy_req, strlen(proxy_req));

        /* 生成返回给客户端的请求，关闭连接 */
        gen_response(proxyfd, res);
        Close(proxyfd);

        /* 写入cache */
        cache_write(&req_info, res);
    }
    else /* cache hit */
        printf("Cache Hit: %s:%s%s\n\n", req_info.host_name,
               req_info.port_number, req_info.uri);

    /* 返回响应给客户端 */
    Rio_writen(connfd, res->header, strlen(res->header));
    Rio_writen(connfd, res->content, res->content_length);
    Close(connfd);

    /* 返回非cache内容时，清理res */
    if (!cache_hit)
        Free(res);
}

/* 读客户端请求辅助函数 */
void read_req(int connfd, char* req)
{
    rio_t rio;
    char rdbuf[MAXLINE];
    Rio_readinitb(&rio, connfd);
    while (Rio_readlineb(&rio, rdbuf, MAXLINE))
    {
        strcat(req, rdbuf);
        if (strcmp(rdbuf, "\r\n") == 0)
            break;
    }
}
