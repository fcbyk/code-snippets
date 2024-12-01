#include "index.h"
using namespace std;
// 数据类型
// C++规定在创建一个变量或者常量时，必须要指定出相应的数据类型，否则无法给变量分配内存

// 整型:整型变量表示的是整数类型的数据
// C++中能够表示整型的类型有4种，区别在于所占内存空间不同：short(短整型)、int(整型)、long(长整形)、long long(长长整形)
void integer(){

    // 利用sizeof关键字可以统计数据类型所占内存大小
    // sizeof( 数据类型 / 变量)
    cout << "short 类型所占内存空间为： " << sizeof(short) << endl;
    cout << "int 类型所占内存空间为： " << sizeof(int) << endl;
    cout << "long 类型所占内存空间为： " << sizeof(long) << endl;
    cout << "long long 类型所占内存空间为： " << sizeof(long long) << endl;
}



