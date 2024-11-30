#include "index.h"
using namespace std;
// 函数:将一段经常使用的代码封装起来，减少重复代码
// 一个较大的程序，一般分为若干个程序块，每个模块实现特定的功能

// 函数定义
// 返回值类型 ：一个函数可以返回一个值。在函数定义中
// 函数名：给函数起个名称
// 形参列表：使用该函数时，传入的数据
// 函数体语句：花括号内的代码，函数内需要执行的语句
// return表达式： 和返回值类型挂钩，函数执行完后，返回相应的数据
int defFun(int num1, int num2)     //返回值类型 函数名 （形参）
{
    int sum = num1 + num2;      // 函数体语句
    return sum;                 // return表达式
}

// 函数的调用
// 函数定义里小括号内称为形参，函数调用时传入的参数称为实参
void callFun(){
    // 语法：函数名（实参）
    defFun(1,2);
}

// 值传递
// 所谓值传递，就是函数调用时实参将数值传入给形参
// 值传递时，如果形参发生，并不会影响实参
void passByValue(int num1, int num2)
{
    cout << "交换前：" << endl;
    cout << "num1 = " << num1 << endl;
    cout << "num2 = " << num2 << endl;

    int temp = num1;
    num1 = num2;
    num2 = temp;

    cout << "交换后：" << endl;
    cout << "num1 = " << num1 << endl;
    cout << "num2 = " << num2 << endl;

    // return ; 当函数声明时候，不需要返回值，可以不写return
}
void callPassByValue(){
    int a = 10;
    int b = 20;

    passByValue(a, b);

    cout << "callPassByValue中的 a = " << a << endl;
    cout << "callPassByValue中的 b = " << b << endl;

    system("pause");
}

// 常见的函数样式有4种：无参无返、有参无返、无参有返、有参有返
// 无参无返
void funType_1()
{
    //void a = 10; //无类型不可以创建变量,原因无法分配内存
    cout << "this is test01" << endl;
}
// 有参无返
void funType_2(int a)
{
    cout << "this is test02" << endl;
    cout << "a = " << a << endl;
}
// 无参有返
int funType_3()
{
    cout << "this is test03 " << endl;
    return 10;
}
// 有参有返
int funType_4(int a, int b)
{
    cout << "this is test04 " << endl;
    int sum = a + b;
    return sum;
}

// 函数的声明
// 告诉编译器函数名称及如何调用函数,函数的实际主体可以单独定义
// 函数的声明可以多次，但是函数的定义只能有一次
//声明可以多次，定义只能一次
int funDeclar(int a, int b);//声明
int funDeclar(int a, int b);
int funDeclar(int a, int b)//定义
{
    return a > b ? a : b;
}

// 函数的分文件编写:让代码结构更加清晰
// 创建后缀名为.h的头文件: 写函数的声明
// 创建后缀名为.cpp的源文件: 写函数的定义
