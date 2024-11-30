/**
 * 为了和其他语言继承形态一致，JS提供了class 关键词用于模拟传统的class 
 * 但底层实现机制依然是原型继承
 * class 只是语法糖为了让类的声明与继承更加简洁清晰
 */

function definition(){
    
    // 类的两种创建方式
    class User {}
    let Article = class {};
    
    // 函数
    function Usera(){ }
    
    console.log(new Article());
    console.log(new User());
    console.log(new Usera());

    // 类其实是函数
    console.log(typeof User); //function
    console.log(typeof Usera); //function
}

class User {
    
    // 构造函数（不支持重载）
    // 如不些构造函数，系统默认的构造函数为-> constructor(...args) { super(...args) }
    constructor(name) {

        // 这里声明的属性和方法都在实例对象上
        this.name = name;
        this.show = function() {};

        // 原型链的构造函数是一样的
        console.log(User == User.prototype.constructor) //true
    }

    // 实例属性不在原型上，在实例上，静态属性在构造方法上
    instanceAttribute = "实例属性"
    static staticAttribute = '静态属性'

    // 实例方法在原型对象上
    getName() { return this.name; }
    show() { console.log("super hello") }

    // 静态方法在构造函数上
    static fun() { console.log("我是静态方法") }

    // 私有属性和方法
    // private 私有属性和Java一样，只在当前类可以访问到，并且不允许继承使用
    // JavaScript中为属性或方法名前加 # 为声明为私有属性
    // 私有属性只能在声明的类中使用
    #privateAttr = 123456
    #privateMethod(){ console.log("私有方法") }
}

// 使用 extends 关键字实现继承
// Student 类的原型 (Student.prototype) 会被设为 User 类的一个实例
class Student extends User{

    constructor(name) {
        // 继承时必须在子类构造函数中调用 super() 执行父类构造函数
        super(name);

        //使用super 可以执行父类方法
        super.show();
    }

    // 方法覆盖
    show(){ console.log("sub show") }
}