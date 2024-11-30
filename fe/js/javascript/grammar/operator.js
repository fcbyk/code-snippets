export const operator = {

    // 算术运算符
    arithmetic,

    // 赋值运算符
    assignment:{
        base:assignment,
        Destructuring:{
            forArray:arrayDestructuringAssignment,
            forObject:objectDestructuringAssignment,
            forParameter:parameterDestructuringAssignment,
        }
    },

    // 一元运算符
    unary,

    // 比较运算符
    comparison,

    // 逻辑运算符
    logical,

    // 三元运算符
    ternary,

    // 指数运算符
    exponent,

    // typeof运算符
    testTypeof,

    // void运算符
    textVoid
}

/**
 * 算术运算符
 * 加减乘除，取余
 */
function arithmetic(a = 5, b = 3) {
    console.log(a + b); //8
    console.log(a - b); //2
    console.log(a * b); //15
    console.log(a / b); //1.6666666666666667
    console.log(a % b); //2
};

/**
 * 赋值运算符
 * 等号赋值（=）：将右侧表达式的值赋给左侧的变量
 * 复合赋值运算符：结合赋值和其他运算，例如加法、减法、乘法等(+=、-=、*=、/=、%=)
 * 解构赋值：从数组或对象中提取值，然后对变量进行赋值
 */
function assignment(a = 5, b = 3) {
    console.log(a += b); // 等价于a=a+b
    console.log(a -= b); // 等价于a=a-b
    console.log(a *= b); // 等价于a=a*b
    console.log(a /= b); // 等价于a=a/b
    console.log(a %= b); // 等价于a=a%b
}

/**
 * 解构赋值（Destructuring Assignment）是ES6（ECMAScript 2015）引入的一种语法，允许我们从数组或对象中提取值，然后对变量进行赋值。
 * 这样可以更简洁和直观地写出赋值语句。
 */
function arrayDestructuringAssignment() {
    // 数组解构赋值
    // 数组解构赋值允许我们按照数组元素的位置将其值赋给变量。
    let [a, b] = [1, 2];
    console.log(a); // 输出: 1
    console.log(b); // 输出: 2

    // 跳过某些元素
    let [c, , d] = [3, 4, 5];
    console.log(c); // 输出: 3
    console.log(d); // 输出: 5

    // 剩余元素
    let [e, ...rest] = [6, 7, 8, 9];
    console.log(e);    // 输出: 6
    console.log(rest); // 输出: [7, 8, 9]

    // 默认值
    let [f, g = 10] = [7];
    console.log(f); // 输出: 7
    console.log(g); // 输出: 10 （因为没有给 g 提供值，所以使用默认值 10）

    let [...arr] = [2, 8, 3, 5];
    console.log(arr);
}

function objectDestructuringAssignment() {
    // 对象解构赋值
    // 对象解构赋值允许我们从对象的属性中提取值并赋给变量
    // 基本用法
    let { name, age } = { name: 'Alice', age: 25 };
    console.log(name); // 输出: Alice
    console.log(age);  // 输出: 25

    // 更改变量名
    let { name: userName, age: userAge } = { name: 'Bob', age: 30 };
    console.log(userName); // 输出: Bob
    console.log(userAge);  // 输出: 30

    // 默认值
    let { country = 'China', city } = { city: 'Beijing' };
    console.log(country); // 输出: China
    console.log(city);    // 输出: Beijing

    // 嵌套解构
    let person = {
        pName: 'Charlie',
        pAddress: {
            street: '123 Main St',
            city: 'Wonderland'
        }
    };
    let { pName, pAddress: { street, city: pCity } } = person;
    console.log(pName);   // 输出: Charlie
    console.log(street);  // 输出: 123 Main St
    console.log(pCity);   // 输出: Wonderland
}

function parameterDestructuringAssignment() {

    // 函数参数中的解构赋值
    // 解构赋值还可以用于函数参数，使得函数能够直接处理对象或数组的属性

    // 数组参数解构
    // 等价于 let [x, y] = [1, 2]
    function sum([x, y]) {
        return x + y;
    }
    console.log(sum([1, 2])); // 输出: 3

    // 对象参数解构
    // 等价于 let { name, age } = { name: 'Dave', age: 40 };
    function greet({ name, age }) {
        console.log(`Hello, my name is ${name} and I am ${age} years old.`);
    }
    greet({ name: 'Dave', age: 40 }); // 输出: Hello, my name is Dave and I am 40 years old.

}

/**
 * 一元运算符
 * ++、--
 */
function unary() {

    //前置操作
    let n = 1;
    ++n     //等价于n=n+1 
    console.log(n); //2
    --n     //等价于n=n-1 
    console.log(n); //1

    //后置操作
    n++     //等价于n=n+1 
    console.log(n); //2

    //前置操作与后置操作的区别
    //前置操作会在表达式最先执行，后置操作会在表达式最后执行
    let num = 2;
    let sum = 30 + ++num;
    console.log(sum);    //33

    num = 2;
    sum = 30 + num++;
    console.log(sum);    //32

    a = 1;
    b = a++ + 2;
    console.log(b);     //3

}


/**
 * 比较运算符
 * >、<、>=、<=
 * ==	强制类型转换比较
 * ===	不强制类型转换比较
 */
function comparison(a = 1, b = 2, c = "1") {
    console.log(a < b); //true
    console.log(a == b); //false
    console.log(a == c); //true
    console.log(a === c); //false
    console.log(a == true); //true
    console.log(a === true); //false
}


/**
 * 逻辑运算符
 */
function logical() {

    //逻辑与
    //使用 && 符号表示逻辑与，指符号两端都为 true 时表达式结果为 true
    a = true;
    b = true;
    if (a && b) {
        console.log('表达式成立');
    }

    //逻辑或
    //使用 || 符号表示逻辑或，指符号左右两端有一方为 true，表达式即成立
    a = true;
    b = false;
    if (a || b) {
        console.log('表达式成立');
    }

    //逻辑非
    //使用 ! 符号表示逻辑非，即原来是 true 转变为 false，反之亦然
    a = true;
    b = false;
    if (a && !b) {
        console.log('表达式成立');
    }

    //优先级
    //下列中因为 && 的优先级高所以结果是 true
    console.log(true || false && false);
    //可以使用 () 来提高优先级
    console.log((true || false) && false);

    //短路运算（逻辑中断）
    //js中，逻辑运算的返回值不是布尔值，而是返回变量的值
    //短路运算的原理：当有多个表达式（值）时,左边的表达式值可以确定结果时,就不再继续运算右边的表达式的值

    //逻辑与
    //语法：表达式1 && 表达式2
    //特点：一假为假，
    //所以表达式1为假，就直接返回表达式1。
    //如果表达式1为真，那么结果取决于表达式2，所以返回表达式2
    console.log(123 && 456); // 456
    console.log(0 && 456); //  0
    console.log(0 && 1 + 2 && 456 * 56789); // 0
    console.log('' && 1 + 2 && 456 * 56789); // ''

    //逻辑或
    //语法： 表达式1 || 表达式2
    //特点：一真为真
    //所以表达式1为真，就直接返回表达式1。
    //如果表达式1为假，那么结果取决于表达式2，所以返回表达式2
    console.log(123 || 456); // 123
    console.log(123 || 456 || 456 + 123); // 123
    console.log(0 || 456 || 456 + 123); // 456

    // 逻辑中断很重要 它会影响我们程序运行结果
    num = 0;
    console.log(123 || num++);  //123
    console.log(num); // 0

}

/**
 * 三元运算符
 * 三元运算符是针对 if 判断的简写形式
 */
function ternary() {
    n = true ? 1 : 2;
    console.log(n); //1

    let f = true ? (1 == true ? 'yes' : 'no') : 3;
    console.log(f); // yes
}

/**
 * 指数运算符(ES7)
 * 在 ES7 中引入指数运算符 **，用来实现幂运算
 * 功能与 Math.pow(a, b) 结果相同
 */
function exponent() {
    console.log(2 ** 10);	// 1024
    console.log(Math.pow(2, 10));
}

/**
 * typeof运算符
 * typeof运算符的语法格式： typeof 变量名
 * typeof运算符的运算结果是以下6个字符串之一：注意字符串都是全部小写
 * undefined、 number、string、boolean、object、function
 */
function testTypeof() {
    n = 100
    let type = typeof n
    console.log(typeof type)
    console.log(type)
}

/**
 * void运算符
 * 格式：void(表达式)
 * 什么都不返回，好像是返回undefined
 * 常用于a标签
 * <a href="javascript:void(0)">单击此处什么也不会发生</a>
 */
function textVoid() {
    n = 'str'
    n = void (1 + 1)
    console.log(n) //undefined
    console.log(typeof n) //undefined

    let empty = void (0)
    console.log(empty) //undefined
    console.log(typeof empty) //undefined 
}