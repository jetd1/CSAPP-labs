cmake_minimum_required(VERSION 3.6)
project(malloclab_handout)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
        config.h
        memlib.c
        memlib.h
        mm.c
        mm.seg.c
        mm.h
        main.c)

add_executable(malloclab_handout ${SOURCE_FILES})