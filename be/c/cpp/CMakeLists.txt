cmake_minimum_required(VERSION 3.17)
project(cpp)

set(CMAKE_CXX_STANDARD 14)

add_executable(cpp main.cpp grammar/index.cpp grammar/index.h grammar/type.cpp grammar/function.cpp grammar/operator.cpp)