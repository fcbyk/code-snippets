/**
 * 在 JS 中函数也是对象,可以用变量接收
 * 函数是Function构造函数创建的实例
 */
function funObj(){
    let functionObject = new Function("text", "console.log(text)");
    functionObject('在 JS 中函数也是对象');
    console.log(typeof functionObject); //function
}

/**
 * 函数的定义
 */
function definition() {

    // 函数的普通定义
    function fun1() { }

    // 使用变量接收函数
    let fun2 = function () { }

    // 立即执行匿名函数
    // 立即执行函数指函数定义时立即执行
    (function(){})()
}

/**
 * 函数参数的数量
 * JavaScript的形参和实参数量可以不对应
 */
function numberOfParams(){

    function getSum(num1, num2) { console.log(num1 + num2); }

    // 正常输出结果
    getSum(1, 2);   

    // 形参数量大于实参时
    // 未传值的形参为undefined，最终的结果就是 NaN
    getSum(1); 

    // 实参数量大于形参时，多于的实参将忽略并不会报错
    getSum(1, 2, 3);
}

/**
 * 默认参数(ES6)
 * ES6 允许给函数参数设置默认值，当调用函数时不给实参，则使用参数默认值
 * 具有默认值的形参，一般要靠后
 */
function defaultParams(){
    function getSum(num1, num2 = 10) { console.log(num1 + num2); }
    getSumDef(10);  //20
    getSumDef(10,100);  //110
}

/**
 * 函数的返回值
 * 函数没有 return ，返回的值是 undefined
 */
function funReturn() {
    function getSum() { }
    console.log(getSum());
}

/**
 * 箭头函数
 * ES6 允许使用箭头=>定义函数
 * 箭头函数是函数声明的简写形式
 * 在使用递归调用、构造函数、事件处理器时不建议使用箭头函数
 */
function arrowFun(){

    // 用箭头函数写上面的 getSum() 函数
    let getSum = (num1, num2 = 10) => { console.log(num1 + num2) }

    // 无参数时使用空扩号即可
    let sum = () => { return 1 + 3 }

    // 函数体只有一条语句可以省略{}
    // 没有{}，需要省略return，系统会自动返回表达式计算结果
    getSum = (num1, num2=20) => console.log(num1 + num2);
    sum = () => 1 + 3;

    //只有一个参数时可以省略括号
    let doubleNum = num => num*2;
}

/**
 * 函数提升
 * 在 JavaScript 中，函数声明会被提升到其所在作用域的顶部，这意味着你可以在函数定义之前调用这个函数。
 * 这与大多数其他编程语言中的行为有所不同，因为通常函数必须先定义后调用。
 */
function funLift(){
    hello()
    function hello(){console.log("hello world")}
}

/**
 * 函数对象和高阶函数
 * 在 JavaScript 中，函数是一等公民，可以像其他对象一样被传递、赋值和作为参数传递给其他函数，或者作为函数的返回值。
 * 这种特性使得 JavaScript 支持高阶函数的编程风格，即能够接受函数作为参数或返回函数的函数。
 * 高阶函数是指能够接受其他函数作为参数，或者将函数作为返回值输出的函数。
 */
function higherOrderFunction(){

    // 接受函数作为参数
    // 这种情况下，高阶函数可以根据传入的函数来改变自身的行为或处理数据
    (()=>{
        function operate(func, a, b) {
            return func(a, b);
        }
        
        function add(x, y) {
            return x + y;
        }
        
        function subtract(x, y) {
            return x - y;
        }
        
        console.log(operate(add, 5, 3)); // 输出 8
        console.log(operate(subtract, 5, 3)); // 输出 2
    })()

    // 返回函数作为结果
    // 这种情况下，高阶函数可以根据条件或输入的不同返回不同的函数，从而延迟计算或实现某种特定的行为。
    (() => {
        function multiplier(factor) {
            return function(num) {
                return num * factor;
            };
        }
        
        let double = multiplier(2);
        console.log(double(5)); // 输出 10
        
        let triple = multiplier(3);
        console.log(triple(5)); // 输出 15
    })();
}
