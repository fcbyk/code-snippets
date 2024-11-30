package com.fcbyk.springframework.bean;

// 如果不在xml配置生命周期对应的函数，也可以通过类实现InitializingBean与DisposableBean接口
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class MyOrder implements InitializingBean, DisposableBean{

    public MyOrder() {
        System.out.println("订单对象已被创建");
    }

    // 测试方法
    public void test() {
        System.out.println("订单test方法执行");
    }

    // 生命周期方法，表示bean初始化对应的操作
    public void destroy() throws Exception {
        System.out.println("订单bean初始化");
    }

    // 生命周期方法，在注入后销毁
    public void afterPropertiesSet() throws Exception {
        System.out.println("订单bean销毁");
    }
}
