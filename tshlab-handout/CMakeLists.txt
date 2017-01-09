cmake_minimum_required(VERSION 3.6)
project(tsh_clion)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
    tsh.c)

add_executable(tsh_clion ${SOURCE_FILES})