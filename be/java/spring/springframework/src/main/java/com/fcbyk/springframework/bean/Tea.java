package com.fcbyk.springframework.bean;

import org.springframework.stereotype.Component;

@Component("tea")
public class Tea {

    // 测试方法
    public void test() {
        System.out.println("茶test方法执行");
    }
}
