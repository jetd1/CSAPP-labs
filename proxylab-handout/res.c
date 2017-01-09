//
// Created by jet on 16-12-25.
//

#include "csapp.h"
#include "res.h"

/* 由远程服务器返回内容生成response */
void gen_response(int proxyfd, res_t* res)
{
    rio_t rio;
    Rio_readinitb(&rio, proxyfd);

    res->content_length = 0;
    char rdbuf[MAXLINE] = "";
    res->header[0] = '\0';

    while (Rio_readlineb(&rio, rdbuf, MAXLINE))
    {
        if (strcmp(rdbuf, "\r\n") == 0)
            break;
        strcat(res->header, rdbuf);

        rdbuf[15] = '\0';
        if (strcasecmp(rdbuf, "Content-Length:") == 0)
            sscanf(rdbuf + 16, "%lu", &(res->content_length));
    }

    strcat(res->header, "\r\n");

    if (res->content_length != 0)
    {
        res->content = (char*) Malloc(res->content_length + 1);
        Rio_readnb(&rio, res->content, res->content_length);
        res->content[res->content_length] = '\0';
    }
    else
    {
        char resrdbuf[1048576] = "";
        char* resbuf = (char*) Malloc(50000000);
        while (Rio_readlineb(&rio, resrdbuf, MAXLINE) > 0)
            strcat(resbuf, resrdbuf);
        res->content_length = strlen(resbuf);
        res->content = (char*) Malloc(res->content_length + 1);
        strcpy(res->content, resbuf);
        Free(resbuf);
    }
};