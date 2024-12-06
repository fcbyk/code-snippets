package com.fcbyk.javase.grammar;

public class DataType {
    public void intType() {
        // #region int
        byte a = 10;
        short b = 20;
        int c = 30;
        long d = 123456789123456789L;
        // #endregion int
    }

    public void floatType() {
        // #region float
        float e = 10.1F;
        double f = 20.3;
        // #endregion float
    }

    public void charType() {
        // #region char
        char g = 'a';
        // #endregion char
    }

    public void booleanType() {
        // #region bol
        boolean b = true;
        boolean c = false;
        // #endregion bol
    }

    public void stringType() {
        // #region string
        String str = "hello";
        str = str.toUpperCase();
        str = str + "world!";
        // #endregion string
    }

    public void arrayType() {
        // #region array
        int arr[]; // 可行，但不推荐

        int[] arr00 = new int[5];
        int[][] arr01 = new int[2][3];
        arr00[0] = 1;
        arr01[1][1] = 100;

        int[] arr02 = {1, 2, 3, 4};
        int[][] arr03 = {
                {1, 2, 3},
                {4, 5, 6}
        };
        // #endregion array
    }

    public void classType() {
        // #region class
        class Person {
            String name;
            int age;
        }

        Person p = new Person();
        p.name = "John";
        p.age = 25;
        // #endregion class
    }

    public void interfaceType() {
        // #region interface
        interface Animal {
            void sound();
        }

        class Dog implements Animal {
            public void sound() {
                System.out.println("Bark");
            }
        }

        Animal dog = new Dog();
        // #endregion interface
    }
    public void enumType() {
        // #region enum
        enum Day {
            MONDAY, TUESDAY, WEDNESDAY;
        }

        Day today = Day.MONDAY;
        // #endregion enum
    }

    public void WrapperClassesType() {
        // #region w-class
        // 包装类是引用类型，存储在堆内存中
        // 自动装箱，基本类型 int 自动转换为 Integer 对象
        Integer intObj = 10;
        Double doubleObj = 3.14;

        // 自动拆箱，Integer 对象自动转换为基本类型 int
        int intValue = intObj;
        double doubleValue = doubleObj;
        // #endregion w-class
    }
}
