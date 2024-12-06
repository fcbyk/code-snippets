package com.fcbyk.javase.grammar;

import org.junit.jupiter.api.Test;

public class Method {

    // #region def
    // java中没有全局函数,只有在类里面定义的方法
    public static int methodName(int a, int b){
        return (a + b);
    }
    // #endregion def

    // #region reload
    public static int add(int a, int b) { return a + b; }
    public static double add(double a, double b) { return a + b; }
    public static double add(int a, double b) { return a + b; }
    public static int add(int a, int b, int c) { return a + b + c; }

    @Test
    public void testAdd(){
        System.out.println(add(1, 2, 3) == 6);
        System.out.println(add(2.3,4.3) == 6.6);
    }
    // #endregion reload
}
