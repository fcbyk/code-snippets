#include "index.h"
using namespace std;
// 运算符用于执行数据的运算


// 算术运算符
// 用于处理四则运算
void arithmetic(){

    int a1 = 10;
    int b1 = 3;

    // 加减乘除
    cout << a1 + b1 << endl;
    cout << a1 - b1 << endl;
    cout << a1 * b1 << endl;
    cout << a1 / b1 << endl;  //两个整数相除结果依然是整数

    int a2 = 10;
    int b2 = 0;
    //cout << a3 / b3 << endl; //报错，除数不可以为0


    // 取模
    cout << a1 % b1 << endl;

    //两个小数不可以取模
    // 只有整型变量可以进行取模运算
    double d1 = 3.14;
    double d2 = 1.1;
    //cout << d1 % d2 << endl;

    // 递增
    //后置递增
    int a = 10;
    a++; //等价于a = a + 1
    cout << a << endl; // 11

    //前置递增
    int b = 10;
    ++b;
    cout << b << endl; // 11

    //区别
    //前置递增先对变量进行++，再计算表达式
    int a3 = 10;
    int b3 = ++a3 * 10;
    cout << b3 << endl;

    //后置递增先计算表达式，后对变量进行++
    int a4 = 10;
    int b4 = a4++ * 10;
    cout << b4 << endl;
}
