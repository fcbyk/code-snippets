package com.fcbyk.javase.api;

// Object类所在包是java.lang包。Object 是类层次结构的根，每个类都可以将 Object 作为超类。
// 所有类都直接或者间接的继承自该类；换句话说，该类所具备的方法，其他所有类都继承了。
// 但是一般情况下我们很少去主动的创建Object类的对象，调用其对应的方法。
// 更多的是创建Object类的某个子类对象，然后通过子类对象调用Object类中的方法
public class Object_ {

    // toString(): 返回该对象的字符串表示形式(可以看做是对象的内存地址值)
    public static void toStringMethod(){

        class Student {
            final String name;
            final int age;
            final String gender;

            public Student(String name, int age, String gender) {
                this.name = name;
                this.age = age;
                this.gender = gender;
            }
        }

        Student zhangsan = new Student("张三",18,"男");

        // 返回该对象的字符串表示形式(可以看做是对象的内存地址值)
        System.out.println(zhangsan.toString());

        // 重写toString方法
        Student lisi = new Student("李四",19,"男"){
            @Override
            public String toString() {
                return "{" +
                        "\"name\": \"" + this.name + "\", " +
                        "\"age\": " + this.age + ", " +
                        "\"gender\": \"" + this.gender + "\"" +
                        "}";
            }
        };

        System.out.println(lisi);
    }
}
