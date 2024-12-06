package com.fcbyk.javase.grammar;

public class Operator {

    // 算术运算符（Arithmetic Operators）
    public void arithmeticOP() {
        // #region arithmetic
        int a = 10, b = 5;
        int c = (100 * (a + b - 10) / 6) % 2;
        // #endregion arithmetic
    }

    // 逻辑运算符（Logical Operators）
    public void logicOP() {
        // #region logic
        boolean x = true, y = false;
        boolean z = !(x || y) && false;
        // #endregion logic
    }

    // 比较运算符（Comparison Operators）
    public void comparisonOP() {
        // #region comparison
        int a = 10, b = 5;
        System.out.println("a == b: " + (a == b)); // 输出 false
        System.out.println("a != b: " + (a != b)); // 输出 true
        System.out.println("a > b: " + (a > b));   // 输出 true
        System.out.println("a < b: " + (a < b));   // 输出 false
        System.out.println("a >= b: " + (a >= b)); // 输出 true
        System.out.println("a <= b: " + (a <= b)); // 输出 false
        // #endregion comparison
    }

    // 赋值运算符（Assignment Operators）
    public void assignmentOP() {
        // #region assignment
        int x = 10;
        x += 5; // x = x + 5
        System.out.println("x += 5: " + x); // 输出 15
        x -= 3; // x = x - 3
        System.out.println("x -= 3: " + x); // 输出 12
        x *= 2; // x = x * 2
        System.out.println("x *= 2: " + x); // 输出 24
        x /= 4; // x = x / 4
        System.out.println("x /= 4: " + x); // 输出 6
        x %= 3; // x = x % 3
        System.out.println("x %= 3: " + x); // 输出 0
        // #endregion assignment
    }

    // 条件运算符（三元运算符）
    public void ternaryOP() {
        // #region ternary
        int a = 5, b = 10;
        int max = (a > b) ? a : b; // 如果 a > b 返回 a，否则返回 b
        System.out.println("max = " + max); // 输出 10
        // #endregion ternary
    }

    // 位运算符（Bitwise Operators）
    public void bitwiseOP() {
        // #region bitwise
        int a = 5; // 二进制 0101
        int b = 3; // 二进制 0011
        System.out.println("a & b = " + (a & b)); // 输出 1 (0101 & 0011 = 0001)
        System.out.println("a | b = " + (a | b)); // 输出 7 (0101 | 0011 = 0111)
        System.out.println("a ^ b = " + (a ^ b)); // 输出 6 (0101 ^ 0011 = 0110)
        System.out.println("~a = " + (~a));       // 输出 -6 (~0101 = 1010)
        System.out.println("a << 1 = " + (a << 1)); // 输出 10 (左移一位 0101 -> 1010)
        System.out.println("a >> 1 = " + (a >> 1)); // 输出 2 (右移一位 0101 -> 0010)
        System.out.println("a >>> 1 = " + (a >>> 1)); // 输出 2 (无符号右移)
        // #endregion bitwise
    }

    // 一元运算符（Unary Operators）
    public void unaryOP() {
        // #region unary
        int a = 5;
        System.out.println("++a: " + (++a)); // 输出 6 (先加后输出)
        System.out.println("a++: " + (a++)); // 输出 6 (先输出后加)
        System.out.println("a: " + a);       // 输出 7 (上面加法后)
        System.out.println("--a: " + (--a)); // 输出 6 (先减后输出)
        System.out.println("a--: " + (a--)); // 输出 6 (先输出后减)
        System.out.println("a: " + a);       // 输出 5 (减法后)
        // #endregion unary
    }

    //  instanceof 运算符
    public void instanceOfOP() {
        // #region instanceOf
        String str = "Hello";
        System.out.println("str instanceof String: " + (str instanceof String)); // 输出 true
        // #endregion instanceOf
    }

    // null 运算符（Null Coalescing）
    public void nullCoalescingOP() {
        // #region nullCoalescing
        String name = null;
        String result = (name != null) ? name : "Default Name";
        System.out.println("Result: " + result); // 输出 Default Name
        // #endregion nullCoalescing
    }

}

