cmake_minimum_required(VERSION 3.17)
project(c C)

set(CMAKE_C_STANDARD 99)

add_executable(c main.c grammar/index.h grammar/index.c grammar/function.c grammar/type.c grammar/index.c)