#include "index.h"
#include <stdio.h>  //把头文件包含到本文件模块中

//数据类型-基本数据类型
//数据类型分基本数据类型、数组、结构体、共用体、枚举、空类型、指针、函数
void basicDataType(){
    /* 整型 */
    short a1=32767;
    int a2=2147483647;
    long a3=2147483647;

    /* 下面三行代码和上面三行代码时执行效果是一样的 */
    signed short b1=32767;
    signed int b2=2147483647;
    signed long b3=2147483647;
    /* signed关键字修饰，表示有符号数，默认为有符号数，所以可以不用加signed */

    unsigned short a4=65535;
    unsigned int a5=4294967295;
    unsigned long a6=4294967295;
    /* unsigned关键字修饰，表示无符号数，即不能存储负数 */

    /* 字符型 */
    char a7= "雨";

    /* 实型（浮点型） */
    float a8= 43243.4234;
    double a9= 34234.4234;
    long double a10= 43244324.32432434;

    /* c语言中基本类型没有布尔型！也没有String字符串 */
}

//数据类型-数组
void arr(){
    int arr1[5];
    /* 声明数组时需要设定数组大小 */

    int arr2[5]={1,2,3,4,5};
    /* 声明数组并初始化 */

    /* 遍历输出 */
    int i,u;
    for ( i = 0; i < 5; i++){
        printf("%d\n",arr2[i]);
    }

    /* 二维数组 */
    printf("-----------------------");
    int arr3[2][3]={9,8,7,6,5,4};
    for ( i = 0; i < 2; i++){
        for(u=0;u<3;u++){
            printf("%d\n",arr3[i][u]);
        }
    }
}

//数据类型-结构体
/**定义结构体
 * 格式1：
 * struct 结构名{
 *      类型名 结构成员1;
 *      类型名 结构成员2;
 *      .....
 *      类型名 结构成员n;
 * }
 *
 * 格式2：
 * struct 结构名{
 *      类型名 结构成员1;
 *      类型名 结构成员2;
 *      .....
 *      类型名 结构成员n;
 * }结构变量名表
 *
 * 格式3：
 * struct{
 *      类型名 结构成员1;
 *      类型名 结构成员2;
 *      .....
 *      类型名 结构成员n;
 * }结构变量名表
 */

/* 定义结构体 */
struct student
{
    int num;/* 学号 */
    char name[10];/* 姓名 */
    int computer,english,math;/* 3门课程成绩 */
    double average;/* 个人平均成绩 */
};

/* 定义结构体并声明结构变量 */
struct student2
{
    int num;
    char name[10];
    int computer,english,math;
    double average;
}a3,a4;

/**
 * 定义结构体并声明结构变量
 * 和上面不同，这个结构体没有名字
 * 在此语句后无法在定义这个类型的其他结构体变量
 */
struct{
    int num;
    char name[10];
    int computer,english,math;
    double average;
}a5,a6;


void stru(){
    struct student a1,a2;
    /* 定义结构体变量a1、a2，其数据类型都为struct student */

    struct student a7 = {101,"不乐",78,87,85};
    /* 结构体初始化 */

    a1.num=100;
    /* 结构体单独赋值 */

    printf("%s\n",a7.name);
    printf("%d\n",a1.num);
    /* 结构体输出 */
}

//数据类型-共用体
/**共用体类型同结构体类型一样，都属于构造类型
 * 它在定义上与结构体类型十分相似
 * 结构体(struct)和联合体(union)最大的区别在于内存利用
 * 格式1：
 * union 共用体名{
 *      类型名 成员1;
 *      类型名 成员2;
 *      .....
 *      类型名 成员n;
 * }
 * 格式2：
 * union 共用体名{
 *      类型名 成员1;
 *      类型名 成员2;
 *      .....
 *      类型名 成员n;
 * }共用体变量名表
 * 格式3：
 * union{
 *      类型名 成员1;
 *      类型名 成员2;
 *      .....
 *      类型名 成员n;
 * }共用体变量名表
 */
void uni(){

    /* 先定义共用体类型，再定义共用体变量 */
    union data{
        int m;
        float x;
        char c;
    };
    union data a1, a2;

    /* 定义共用体类型的同时定义共用体变量 */
    union data2{
        int m;
        float x;
        char c;
    }a3, a4;

    /* 直接定义共用体变量,后续不能再定义 */
    union {
        int m;
        float x;
        char c;
    }a5, a6;

    a6.m=10086;
    printf("%d\n",a6.m);
}

//数据类型-枚举
/**
 * 如果一个变量只有几种可能的值，则可以定义为"枚举类型"
 * 所谓"枚举"就是把可能的值一一的列举出来，变量的值只限于列举出来的值的范围
 *
 * 格式：
 * enum 枚举类型{
 *    枚举成员列表(以逗号分隔)
 * }
 *
 */
enum Spectrum{
    red,black,yellow,blue,white
}i1;

void enu(){
    i1 = black;

    switch (i1)
    {
        case red:printf("red");break;
        case black:printf("black");break;
        case yellow:printf("yellow");break;
        default:printf("blue");
    }
}


//数据类型-指针
/**
 * 存放地址的变量为指针变量
 * 声明格式：类型名 *指针变量标识符
 */
void pointer(){
    int i=100;
    int *p;/* 定义一个指针变量 */
    p = &i;/* &为地址运算符，把i变量的地址赋值给指针变量p */

    printf("%d\n%d\n",i,*p);
    /**
     * 上面i和*p，输出的值是一样的
     * "*"除了用于定义指针变量外，还被用于访问指针所指向的变量
     * 它也称为间接访问运算符
     */
    printf("%p\n",p);

    struct student
    {
        int num;
        char name[10];
        int computer,english,math;
        double average;
    };

    struct student stu = {101,"zhang",78,87,85},*pa;
    pa=&stu;

    /* 下面三条语句，效果一样 */
    stu.num =200;
    (*pa).num = 200;
    pa->num = 200;
    /* ->为指向运算符，访问指针指向的结构成员或共用体成员 */

    printf("%d\n", stu.num);


    /* 指针数组：是一个数组，数据元素为指针 */
    long* pe[10];
    long pi[10] = { 1,2,3,4,5,6,7,8,9,10 };
    for (int w = 0; w < 10; w++)
    {
        pe[w] = &pi[w];
        printf("%p\n", pe[w]);
    }

    printf("-------------------------------------\n");
    /* 数组指针：是一个指针，指向数组的指针 */

    //一维数组
    int app[5] = { 1, 2, 3, 4, 5 };
    //步长为5的数组指针，即数组里有5个元素
    int(*ppp)[5];
    //把数组app的地址赋给ppp，则ppp为数组app的地址，则*ppp表示数组a本身
    ppp = &app;

    printf("%p\n", *ppp); //*ppp表示数组app本身，一般用数组的首元素地址来标识一个数组
    printf("%p\n", &app[0]); //数组首元素的地址

    //下面两行代码效果一样
    printf("%d\n", *ppp[0]);    /* 通过间接访问运算符去访问指针指向的数组元素 */
    printf("%d\n", app[0]);
}


