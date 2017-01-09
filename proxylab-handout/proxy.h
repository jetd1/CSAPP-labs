//
// Created by jet on 16-12-24.
//

#ifndef PROXYLAB_HANDOUT_PROXY_H

/* 子线程工作函数 */
void routine(int connfd);

/* 读客户端请求辅助函数 */
void read_req(int connfd, char* req);

#define PROXYLAB_HANDOUT_PROXY_H

#endif //PROXYLAB_HANDOUT_PROXY_H
