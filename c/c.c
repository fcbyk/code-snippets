// Hello World
#include <stdio.h>

int main() {
    printf("Hello, World!");
    getchar();
    return 0;
}

// 基础数据类型
void type(){
    short s = 32767;
    int i = 2147483647;
    long l = 2147483647;

    signed int si = 2147483647;
    unsigned int ui = 4294967295;

    char c = "雨";

    float f = 43243.4234;
    double d = 34234.4234;
    long double ld = 43244324.32432434;
}

// 数组
void array(){
    int arrA[5];
    int arrB[3] = {1,2,3};
    int arrC[2][3] = {9,8,7,6,5,4};
    arrB[2] = 5
}

// 结构体
struct student
{
    int num;
    char name[10];
    int computer,english,math;
    double average;
};

struct{
    int num;
    char name[10];
}anonymity;

void __struct__() {
    struct student stu = {101,"不乐",78,87,85};
    stu.num=100;
    anonymity.name = "匿名结构体"
    return 0;
}

// 枚举
enum Spectrum {
    red, black, yellow, blue, white
};

void enu(enum Spectrum e) {
    switch (e) {
        case red:    printf("red");    break;
        case black:  printf("black");  break;
        case yellow: printf("yellow"); break;
        case blue:   printf("blue");   break;
        case white:  printf("white");  break;
        default:     printf("Unknown"); 
    }
}

int __enum__() {
    enu(blue);
    return 0;
}

// 指针
void pointer(){
    int i=100;
    int *p;
    p = &i;
    printf("%d\n%d\n",i,*p);
    printf("%p\n",p);
}

// 结构体指针
void structPointer(){
    struct student{ /* ... */ };
    struct student stu = {101,"zhang",78,87,85},*pa;
    pa=&stu;

    stu.num =200;
    (*pa).num = 200;
    pa->num = 200;
}