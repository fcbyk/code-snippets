package com.fcbyk.javase.grammar;

// #region base
public class OOP {

    // 属性
    private String name;

    // 方法
    public String getName(){
        return this.name;
    }
    
}
// #endregion base

// #region attr
class Attr {

    // 访问控制修饰符
    int num;
    private String name;
    public int age;
    protected boolean bol;

    // 非访问修饰符
    final int id = 9527;
    static String hello;
    transient int transientField;
    volatile int volatileField;
}
// #endregion attr

// #region meth
class Meth{

    // 访问控制修饰符
    public void publicMethod() { }
    protected void protectedMethod() {}
    void defaultMethod() { }
    private void privateMethod() { }

    // 行为特性修饰符
    static void staticMethod(){}
    final void finalMethod() {}
    // abstract void abstractMethod();  抽象方法
    synchronized void synchronizedMethod(){}
    native void nativeMethod();
    strictfp void strictfpMethod(){};

}
// #endregion meth

// #region cmeth
class Student {
    public String name;
    private int age;

    // 构造方法不用写返回值，方法名 = 类名

    // 无参构造方法，默认就存在，可以不写
    public Student() {}

    // 因存在重载机制，可有多个构造方法
    public Student(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public Student(String name) {
        this.name = name;
    }
}
// #endregion cmeth


class NewStudent {

    String example(){

        // #region new
        // new = 在堆内存中为新实例分配一块存储空间并存储
        // 返回堆中分配对象的地址引用，保存在栈内存中的变量中
        Student student1 = new Student();
        Student student2 = new Student("John", 23);
        Student student3 = new Student("Mary");

        // #endregion new

        return student3.name;
    }

}
