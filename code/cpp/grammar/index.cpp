#include "index.h"

// 注释：编译器在编译代码时，会忽略注释的内容
// 单行注释：通常放在一行代码的上方，或者一条语句的末尾，对该行代码说明
/* 多行注释：通常放在一段代码的上方，对该段代码做整体说明 */

// 变量：给一段指定的内存空间起名，方便操作这段内存
void var(){

    //变量的定义
    //语法：数据类型  变量名 = 初始值
    //C++在创建变量时，必须给变量一个初始值，否则会报错
    int a = 10;
}

// 常量:用于记录程序中不可更改的数据
// C++定义常量两种方式: 宏常量、const
void constant(){

    // 宏常量：通常在文件上方定义，表示一个常量
    // #define 常量名 常量值

    // const修饰的变量: 通常在变量定义前加关键字const，修饰该变量为常量，不可修改
    // const 数据类型 常量名 = 常量值
    const int month = 12;
}

// 关键字:关键字是C++中预先保留的单词
// 在定义变量或者常量时候，不要用关键字

// 标识符
// 标识符不能是关键字
// 标识符只能由字母、数字、下划线组成
// 第一个字符必须为字母或下划线
// 标识符中字母区分大小写