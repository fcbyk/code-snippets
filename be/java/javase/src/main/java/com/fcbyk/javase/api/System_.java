package com.fcbyk.javase.api;

// System包含了系统操作的一些常用的方法。比如获取当前时间所对应的毫秒值，再比如终止当前JVM等等
public class System_ {
    public static void staticAttribute(){

    }

    public static void staticMethod(){

        // 获取当前时间所对应的毫秒值
        System.out.println("当前时间所对应的毫秒值为：" + System.currentTimeMillis());

        // 获取到当前时间的毫秒值的意义：我们常常来需要统计某一段代码的执行时间。
        // 此时我们就可以在执行这段代码之前获取一次时间，在执行完毕以后再次获取一次系统时间，然后计算两个时间的差值

        // 终止JVM
        System.exit(0);
    }
}
