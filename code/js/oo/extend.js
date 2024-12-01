export const extend_ = {
    instanceof_,
    printPrototypeChain
}

/**
 * 在 JavaScript 中，继承是通过原型链来实现的，而不是像传统面向对象语言（如Java、C++）中的类继承
 * 在 JavaScript 中，对象可以通过指定另一个对象作为其原型来继承属性和方法。这就是原型链的概念。
 * 如果访问一个对象的属性或方法时，该对象本身没有这个属性或方法，JavaScript 引擎会沿着原型链向上查找，直到找到对应的属性或方法或者到达 Object.prototype，如果还找不到则返回 undefined。
 * 
 * 继承的特点和注意事项
 * 单继承：JavaScript 中的对象只能有一个原型对象，因此只支持单继承。
 * 构造函数继承：通过在子类构造函数中调用父类构造函数，可以实现属性的继承。
 * 原型链继承：通过设置子类的原型对象为父类的实例，实现方法和原型属性的继承。
 * ES6 的 class 语法：ES6 引入了 class 和 extends 关键字，提供了更清晰和直观的语法来实现继承，但本质上仍然是基于原型链的继承机制。
 */

/**
 * 原型链
 * 我们知道, 可以通过 PersonI.prototype = {}的方式来重写原型对象
 * 假如, 我们后面赋值的不是一个{}, 而是另外一个类型的实例, 结果会是怎么样呢
 * 显然，此时的原型对象将包含一个指向另一个原型的指针，相应地，另一个原型中也包含着一个指向另一个构造函数的指针
 * 假如另一个原型又是另一个类型的实例，那么上述关系依然成立，如此层层递进，就构成了实例与原型的链条。这就是所谓原型链的基本概念
 */
function getObj(){

    // 创建Animal的构造函数
    function Animal() {
        this.animalProperty = '动物';
    }

    // 给Animal的原型中添加一个方法
    Animal.prototype.animalFunction = function () {
        console.log(this.animalProperty);
    };

    // 创建Dog的构造函数
    function Dog() {
        this.dogProperty = '狗';
    }

    // 给Dog的原型对象重新赋值
    Dog.prototype = new Animal();

    // 给Dog添加属于自己的方法
    Dog.prototype.dogFunction = function () {
        console.log(this.dogProperty);
    };

    // 创建Dog的实例
    let dog = new Dog();
    dog.animalFunction(); //动物
    dog.dogFunction(); //狗

    /**
     * 创建 dog 对象, dog 对象会有自己的属性, dogProperty
     * 另外, dog 对象有一个 proto 指向 Dog 的原型
     * Dog 的原型是谁呢? 就是我们之前的 new Animal(Animal 的一个实例), 所以会指向它
     */

    // constructor 问题
    console.log(dog)
    console.log(dog.constructor) //构造器为 Animal, 在原型链上搜索constructor

    // 在Dog的新原型对象上添加构造器属性
    Object.defineProperty(Dog.prototype,'constructor', {
        enumerable: false,
        value: Dog,
    });

    console.log(dog)
    console.log(dog.constructor) //Dog

    return { Animal, Dog , dog }
}

/**
 * 原型和实例的关系
 * 如果我们希望确定原型和实例之间的关系, 有两种方式
 * instanceof 操作符和isPrototypeOf()方法
 */
function instanceof_(){

    let { Animal, Dog , dog } = getObj();

    // instanceof 操作符
    // 只要用这个操作符来测试实例的原型链中出现过的构造函数，结果就会返回 true
    console.log(dog instanceof Object); // true
    console.log(dog instanceof Animal); // true
    console.log(dog instanceof Dog); // true

    // isPrototypeOf()方法
    // 只要是原型链中出现过的原型，都可以说是该原型链所派生的实例的原型
    // 因此 isPrototypeOf()方法也会返回 true
    console.log(Object.prototype.isPrototypeOf(dog)); // true
    console.log(Animal.prototype.isPrototypeOf(dog)); // true
    console.log(Dog.prototype.isPrototypeOf(dog)); // true
}

/**
 * 打印原型链
 * 关于原型链,在谷歌浏览器控制台查看
 * [[Prototype]] 为内部属性，观察[[Prototype]]即可得到完整的原型链
 * 到最后会发现到object原型对象没有 [[Prototype]] 属性，即为null
 * [[Prototype]] 为内部属性不可访问，我们访问的是__proto__属性，而__proto__属性保存在了最后的object原型对象上
 */
function printPrototypeChain(){

    let { Animal, Dog , dog } = getObj();

    // 查看原型链
    console.log(dog)                                           // Dog{}
    console.log(dog.__proto__)                                 // Animal{}
    console.log(dog.__proto__.__proto__)                       // {}    注: object对象前面没有名字
    console.log(dog.__proto__.__proto__.__proto__)             // {}
    console.log(dog.__proto__.__proto__.__proto__.__proto__)   // null

    // or
    console.log(dog)
    console.log(Dog.prototype)     
    console.log(Dog.prototype.__proto__)
    console.log(Dog.prototype.__proto__.__proto__)
    console.log(Dog.prototype.__proto__.__proto__.__proto__)

    // 狗实例 -> 动物实例(狗的原型) -> object实例(动物的原型) -> object原型 -> null

    // 查看一下浏览器内置的原型链
    console.log(window)                                                         // Window{}
    console.log(window.__proto__)                                               // Window{}
    console.log(window.__proto__.__proto__)                                     // WindowProperties{} 
    console.log(window.__proto__.__proto__.__proto__)                           // EventTarget{}
    console.log(window.__proto__.__proto__.__proto__.__proto__)                 // {}
    console.log(window.__proto__.__proto__.__proto__.__proto__.__proto__)       // null

    console.log(document)                                          
    console.log(document.__proto__)
    console.log(document.__proto__.__proto__)
    console.log(document.__proto__.__proto__.__proto__)
    console.log(document.__proto__.__proto__.__proto__.__proto__)
    console.log(document.__proto__.__proto__.__proto__.__proto__.__proto__)
    console.log(document.__proto__.__proto__.__proto__.__proto__.__proto__.__proto__)
}

/**
 * 原型链存在的问题
 * 原型链存在最大的问题是关于引用类型的属性.
 * 通过上面的原型实现了继承后, 子类的 Dog 对象继承了(可以访问)Animal 实例中的属性(animalProperty).
 * 但是如果这个属性是一个引用类型(比如数组或者其他引用类型), 就会出现问题.
 */
function issue(){
    // 引用类型的问题代码:
    // 1.定义Animal的构造函数
    function Animal() {
        this.colors = ['red', 'green'];
    }

    // 2.给Animal添加方法
    Animal.prototype.animalFunction = function () {
        alert(this.colors);
    };

    // 3.定义Dog的构造函数
    function Dog() {
        this.dogProperty = 'Dog';
    }

    // 4.给Dog赋值新的原型对象
    Dog.prototype = new Animal();

    // 5.给Dog添加方法
    Dog.prototype.personFunction = function () {
        alert(this.dogProperty);
    };

    // 6.创建Dog对象, 并且调用方法
    let dog2 = new Dog();
    let dog3 = new Dog();

    console.log(dog2.colors); // red,green
    console.log(dog3.colors); // red,green

    dog2.colors.push('blue');

    console.log(dog2.colors); // red,green,blue
    console.log(dog3.colors); // red,green,blue

    // 修改了 dog2 中的 colors 属性, 添加了一个新的颜色 blue
    // 再次查看两个对象的 colors 属性, 会发现 dog3 的 colors 属性也发生了变化
    // 两个实例应该是相互独立的, 这样的变化如果我们不制止将会在代码中引发一些列问题.

    // 原型链的其他问题
    // 在创建子类型的实例时，不能向父类型的构造函数中传递参数
    // 实际上，应该说是没有办法在不影响所有对象实例的情况下，给父类型的构造函数传递参数
    // 从而可以修改父类型中属性的值, 在创建构造函数的时候就确定一个值
}

/**
 * 经典继承
 * 为了解决原型链继承中存在的问题, 开发人员提供了一种新的技术: constructor stealing
 * (有很多名称: 借用构造函数或经典继承或伪造对象), steal 是偷窃的意思, 但是这里可以翻译成借用
 * 经典继承的做法非常简单: 在子类型构造函数的内部调用父类型构造函数
 */
function constructorStealing(){
    // 创建Animal的构造函数
    function Animal(age) {
        this.colors = ['red', 'green'];
        this.age = age;
    }

    // 创建Dog的构造函数
    function Dog(age) {
        // 继承Animal的属性
        // 也可以传递参数
        Animal.call(this, age);

        // 给自己的属性赋值
        this.name = 'ZHANG';
    }

    // 创建Dog对象
    let dog4 = new Dog();
    let dog5 = new Dog(10);

    console.log(dog4.colors);   // red,green
    console.log(dog5.colors);   // red,green
    dog4.colors.push('blue');
    console.log(dog4.colors);   // red,green,blue
    console.log(dog5.colors);   // red,green
    console.log(dog5.age);      // 10

    // 我们通过在 Dog 构造函数中, 使用 call 函数, 将 this 传递进去
    // 这个时候, 当 Animal 中有相关属性初始化时, 就会在 this 对象上进行初始化操作
    // 这样就实现了类似于继承 Animal 属性的效果

    // 经典继承的问题
    // 对于经典继承理解比较深入, 你已经能发现: 经典继承只有属性的继承, 无法实现方法的继承
    // 因为调用 call 函数, 将 this 传递进去, 只能将父构造函数中的属性初始化到 this 中
    // 但是如果函数存在于父构造函数的原型对象中, this 中是不会有对应的方法的
}

/**
 * 组合继承
 * 如果你认识清楚了上面两种实现继承的方式存在的问题, 就可以很好的理解组合继承了
 * 组合继承(combination inheritance, 有时候也称为伪经典继承)
 * 组合继承就是发挥原型链和经典继承各自的优点来完成继承的实现
 * 使用原型链实现对原型属性和方法的继承
 * 通过经典继承实现对实例属性的继承, 以及可以在构造函数中传递参数
 */
function combinationInheritance(){
    // 1.创建构造函数的阶段
    // 1.1.创建Animal的构造函数
    function Animal(age) {
        this.age = age;
        this.colors = ['red', 'green'];
    }

    // 1.2.给Animal添加方法
    Animal.prototype.AnimalFunction = function () {
        console.log('Hello Animal');
    };

    // 1.3.创建Dog的构造函数
    function Dog(name, age) {
        Animal.call(this, age);
        this.name = name;
    }

    // 1.4.给Dog的原型对象重新赋值
    Dog.prototype = new Animal(0);

    // 1.5.给Dog添加方法
    Dog.prototype.DogFunction = function () {
        console.log('Hello Dog');
    };

    // 2.验证和使用的代码
    // 2.1.创建Dog对象
    let dog6 = new Dog('zcoder', 18);
    let dog7 = new Dog('www', 38);

    // 2.2.验证属性
    console.log(dog6.name + '-' + dog6.age); // zcoder-18
    console.log(dog7.name + '-' + dog7.age); // www-38

    // 2.3.验证方法的调用
    dog6.AnimalFunction(); // Hello Animal
    dog6.DogFunction(); // Hello Dog

    // 2.4.验证引用属性的问题
    dog6.colors.push('blue');
    console.log(dog6.colors); // red,green,blue
    console.log(dog7.colors); // red,green

    // 组合继承是 JavaScript 最常用的继承模式之一
    // 如果你理解到这里, 点到为止, 那么组合来实现继承只能说问题不大, 但是它依然不是很完美

    // 组合继承最大的问题就是无论在什么情况下, 都会调用两次父类构造函数.
    // 一次在创建子类原型的时候
    // 另一次在子类构造函数内部(也就是每次创建子类实例的时候)
    // 另外, 值得注意的是, 所有的子类实例事实上会拥有两份父类的属性
    // 一份在当前的实例自己里面(也就是 dog6 本身的), 另一份在子类对应的原型对象中(也就是 dog6.proto里面)
    // 当然, 这两份属性我们无需担心访问出现问题, 因为默认一定是访问实例本身这一部分的
}

/**
 * 原型式继承
 * 原型式继承的思想和渊源
 * 这种模式要从道格拉斯·克罗克福德（Douglas Crockford, 著名的前端大师, JSON 的创立者）在 2006 年写的一篇文章说起: Prototypal Inheritance in JavaScript(在 JS 中使用原型式继承)
 * 在这篇文章中, 它介绍了一种继承方法, 而且这种继承方法不是通过构造函数来实现的.
 * 为了理解这种方式, 我们先再次回顾一下 JavaScript 想实现继承的目的: 重复利用另外一个对象的属性和方法
 */
function prototypalInheritance(){
    // 原型式继承的核心函数
    // 封装objectA()函数
    function objectA(o) {
        function F() {}
        F.prototype = o;
        return new F();
    }
    // 在 object()函数内部, 先创建一个临时的构造函数
    // 然后将传递的对象作为这个构造函数的原型
    // 最后返回了这个临时类型的一个新的实例
    // 事实上, object()对传入的对象执行了一次浅复制（注意不是浅拷贝）
    // 理解为创建了一个o类型的空实例对象，空实例对象可以用o对象的属性和方法

    // 原型式继承的使用
    // 使用原生式继承
    let dog8 = {
        name: '小明',
        colors: ['red', 'green'],
    };

    // 通过dog8去创建另外一个对象
    let dog9 = objectA(dog8);
    dog9.name = '小小明';
    dog9.colors.push('blue');

    console.log(dog8.name); // 小明
    console.log(dog8.colors); // red,green,blue

    console.log(dog9.name); // 小小明
    console.log(dog9.colors); // red,green,blue

    console.log(dog8); 
    console.log(dog9);

    // 这种方式和我们传统意义上理解的继承有些不同. 它做的事情是通过一个对象去创建另外一个对象.(利用 dog8 去创建 dog9)
    // 当然, dog9 中继承过来的属性是放在了自己的原型对象中的.
    // 也可以给 dog9 自己再次添加 name 属性, 这个时候 name 才是在实例本身中.
    // 但是如果是修改或者添加引用类型的内容, 还是会引起连锁反应.
    // 可能暂时你看不到这些代码的意义, 但是这些代码是我们后续最终方案的前提思想, 所以先看看和练习一下这些代码.

    // 针对这种思想, ES5 中新增了 Object.create()方法来规范化了原型式继承
    // create是Object构造函数对象的一个属性，这个属性也是一个函数对象，所以可以调用
    // 也就是上面的代码可以修改成这样(只是将 object 函数修改成了 Object.create)
    let dog10 = {
        name: '小明',
        colors: ['red', 'green'],
    };

    let dog11 = Object.create(dog10);
    dog11.name = '小小明';
    dog11.colors.push('blue');

    console.log(dog10.name); // 小明
    console.log(dog10.colors); // red,green,blue

    console.log(dog11.name); // 小小明
    console.log(dog11.colors); // red,green,blue

    console.log(dog10); 
    console.log(dog11);

    // Object.create()还可以传入第二个参数
    // 第二个参数用于每个属性的自定义描述
    let dog12 = Object.create(dog10,{
        name:{
            value:"语雀"
        }
    })
    console.log(dog12); 

    // 原型式继承的的优点和缺点
    // 如果我们只是希望一个对象和另一个对象保持类似的情况下, 原型式继承完全可以胜任, 这是它的优势.
    // 但是, 原型式继承依然存在属性共享的问题, 就像使用原型链一样
}

/**
 * 寄生式继承
 * 寄生式继承的思想
 * 寄生式(Parasitic)继承是与原型式继承紧密相关的一种思想, 并且同样由道格拉斯·克罗克福德(Douglas Crockford)提出和推广的
 * 寄生式继承的思路是结合原型类继承和工厂模式的一种方式
 * 即创建一个封装继承过程的函数, 该函数在内部以某种方式来增强对象, 最后再将这个对象返回
 */
function Parasitic() {
    // 寄生式函数多增加了一个核心函数
    // 封装objectB函数
    function objectB(o) {
        function F() { }
        F.prototype = o;
        return new F();
    }

    // 封装创建新对象的函数
    function createAnother(original) {
        let clone = objectB(original);
        clone.sayHello = function () {
            console.log('Hello JavaScript');
        };
        return clone;
    }

    // 我们来使用一下寄生式继承
    // person17对象
    let person17 = {
        name: 'zcoder',
        colors: ['red', 'green'],
    };

    // 新的对象
    let person18 = createAnother(person17);
    person18.sayHello();

    console.log(person17)
    console.log(person18)

    // 我们基于 person 对象, 创建了另外一个对象 person1
    // 在最新的 person1 对象中, 不仅会拥有 person 的属性和方法, 而且还有自己定义的方法

    // 寄生式继承存在的问题:
    // 寄生式继承和原型式继承存在一样的问题, 引用类型会共享 (因为是在原型式继承基础上的一种封装)
    // 另外寄生式继承还存在函数无法复用的问题, 因为每次 createAnother 一个新的对象, 都需要重新定义新的函数(和之前的工厂函数一样)
}

/**
 * 寄生组合式继承
 * 现在我们来回顾一下之前提出的比较理想的组合继承
 * 组合继承是比较理想的继承方式, 但是存在两个问题
 * 问题一: 构造函数会被调用两次: 一次在创建子类型原型对象的时候, 一次在创建子类型实例的时候
 * 问题二: 父类型中的属性会有两份: 一份在原型对象中, 一份在子类型实例中
 * 
 * 事实上, 我们现在可以利用寄生式继承将这两个问题给解决掉
 * 你需要先明确一点: 当我们在子类型的构造函数中调用父类型.call(this, 参数)这个函数的时候, 就会将父类型中的属性和方法复制一份到了子类型中. 所以父类型本身里面的内容, 我们不再需要
 * 这个时候, 我们还需要获取到一份父类型的原型对象中的属性和方法
 * 能不能直接让子类型的原型对象 = 父类型的原型对象呢?
 * 不要这么做, 因为这么做意味着以后修改了子类型原型对象的某个引用类型的时候, 父类型原生对象的引用类型也会被修改.
 * 我们使用前面的寄生式思想就可以了.
 */
function combinationParasitic(){

    // 寄生组合式的核心代码
    // 定义object函数
    function objectC(o) {
        function F() {}
        F.prototype = o;
        return new F();
    }

    // 定义寄生式核心函数
    function inhreitPrototype(subType, superType) {
        // let prototype = objectC(superType.prototype);
        // 可以使用create函数代替
        let prototype = Object.create(superType.prototype);
        prototype.constructor = subType;
        subType.prototype = prototype;
    }

    // 定义AnimalE构造函数
    function AnimalE(age) {
        this.age = age;
        this.colors = ['red', 'green'];
    }

    // 给AnimalE添加方法
    AnimalE.prototype.AnimalEFunction = function () {
        alert('Hello AnimalE');
    };

    // 定义DogE构造函数
    function DogE(name, age) {
        AnimalE.call(this, age);
        this.name = name;
    }

    // 使用寄生组合式核心函数
    inhreitPrototype(DogE, AnimalE);

    // 给DogE添加方法
    DogE.prototype.DogEFunction = function () {
        console.log('Hello DogE');
    };

    let dog13 = new DogE("张三疯",18);
    console.log(dog13)
    console.log(dog13.__proto__)

    // 这种方式的高效体现在现在它只调用了一次 Animal 的构造函数
    // 并且也避免了在原型上面多出的多余属性, 而且原型之间不会产生任何的干扰(子类型原型和父类型原型之间)
    // 在 ES5 中, 普遍认为寄生组合式继承是最理想的继承范式
}