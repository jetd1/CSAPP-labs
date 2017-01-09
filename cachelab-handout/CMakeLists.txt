cmake_minimum_required(VERSION 3.6)
project(cachelab_handout)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Wall -Werror -std=c99")

set(SOURCE_FILES
    cachelab.c
    cachelab.h
    csim.c)

add_executable(cachelab_handout ${SOURCE_FILES})