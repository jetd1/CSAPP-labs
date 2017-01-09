cmake_minimum_required(VERSION 3.6)
project(proxylab_handout)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
    csapp.c
    csapp.h
    proxy.c
    proxy.h cache.c cache.h defs.h hri.c hri.h res.c res.h)

add_executable(proxylab_handout ${SOURCE_FILES})
target_link_libraries(proxylab_handout pthread)