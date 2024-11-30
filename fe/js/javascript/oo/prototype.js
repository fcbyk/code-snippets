/**
 * JavaScript原型与原型链
 * 原型（prototype）：每个对象都有一个原型对象，它作为对象的模板，对象可以从原型对象继承属性和方法。
 * 原型链（prototype chain）：对象之间通过原型链连接，形成一个继承链，允许对象从其他对象继承属性和方法。
 * 
 * 对比其他语言的类
 * JavaScript 是基于原型的编程语言，而 Java 是基于类的编程语言。在 Java 中，类是对象的蓝图，对象通过实例化类来创建；而在 JavaScript 中，对象直接从原型继承属性和方法。
 * JavaScript 的原型是动态的，可以在运行时修改和扩展，而 Java 的类在编译时已经确定，通常不能动态修改。
 * 在 JavaScript 中，对象可以通过多种方式创建，并且可以在创建后动态修改其原型链关系；而 Java 中，类必须先定义，然后通过关键字 new 实例化。
 */

/**
 * 显式原型（explicit prototype）
 * 显式原型是通过构造函数的 prototype 属性显式设置的对象
 * 在构造函数中，可以通过将方法和属性直接赋值给构造函数的 prototype 属性来定义这些方法和属性
 */
function explicitPrototype(){
    function Person(name) {
        this.name = name;
    }
    
    Person.prototype.sayHello = function() {
        console.log('Hello, my name is ' + this.name);
    };
    
    let person1 = new Person('Alice');
    let person2 = new Person('Bob');
    
    person1.sayHello(); // 输出 "Hello, my name is Alice"
    person2.sayHello(); // 输出 "Hello, my name is Bob"
}

/**
 * 隐式原型（Implicit Prototype）
 * 隐式原型（也称为 __proto__）是每个 JavaScript 对象都具有的一个属性，它指向该对象的原型。
 * 
 * 在 JavaScript 中，通常是通过显式原型去修改和定义对象的原型，而不是直接操作隐式原型。
 * 这是因为隐式原型 __proto__ 是作为对象的内部属性存在的，并不推荐直接访问或修改它，因为它可以直接影响到整个原型链的结构和继承关系，可能导致意料之外的行为。
 * __proto__ 是非标准的访问方式，在一些 JavaScript 引擎或环境中可能不被完全支持或存在兼容性问题。
 */
function implicitPrototype(){

    function Person(name) {
        this.name = name;
    }

    let zhangsan = new Person("张三");

    console.log(Person.prototype === zhangsan.__proto__);  // true

    Person.prototype.age = 10                   // 推荐使用显示原型进行访问及修改
    zhangsan.__proto__.school = "青青草原"      // 不推荐使用隐式原型进行访问及修改
}

/**
 * 构造函数(constructor)
 * JavaScript中每个原型对象都有一个constructor属性，指向构造函数
 */
function constructor_(){
    function Person(name) {
        this.name = name;
    }
    
    let person1 = new Person('Alice');
    
    console.log(person1.constructor === Person); // true
    console.log(Person.prototype.constructor === Person); // true

}

/**
 * 静态属性与方法
 * JavaScript 中的静态属性和方法指的是添加到构造函数本身的属性和方法
 * 这些静态属性和方法可以通过构造函数本身直接访问，而不需要先创建实例对象
 * 静态属性和方法属于构造函数本身，与实例对象无关。这意味着它们不会被实例继承，也不能通过实例访问
 * 静态属性和方法对所有使用该构造函数创建的实例都是共享和公用的，因此它们适合用于定义那些不依赖于特定实例状态的功能
 * 静态属性和方法也常用作命名空间，组织相关的功能或常量，使代码更加清晰和模块化
 */
function static_(){
    function MyClass() {}

    MyClass.staticProperty = 'static value';
    MyClass.staticMethod = function() {
        return 'Hello, this is a static method';
    };
    
    console.log(MyClass.staticMethod());
    console.log(MyClass.staticProperty);
}