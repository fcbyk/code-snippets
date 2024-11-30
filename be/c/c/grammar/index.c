#include "index.h"
#include <stdio.h>
#define PI 3.1415   //定义符号常量
#define E 2.71

//关键字
//auto
//break
//case char const continue
//default do double
//else enum extern
//float for
//goto
//if int
//long
//register return
//short signed signed sizeof static struct switch
//typedef
//union unsigned
//void volatile
//while

//常量和变量
void var(){
    /**
     * 常量的定义有两种
     * 1、预处理中用#define指令定义符号常量
     * 2、使用const关键字定义常变量,常变量不能被重新赋值
     */
    const int y = 2022;
    printf("%d\n",y);

    /**
     * 变量包括声明和赋值（初始化）两部分
     * 这里不赘述，看下面的数据类型
     */
}