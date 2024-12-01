package com.fcbyk.springframework.bean;

import java.util.*;

public class DI {

    // 简单类型
    private final String addr;
    private final int age;
    public DI(String addr, int age) {
        this.addr = addr;
        this.age = age;
    }

    // 通过构造方法注入
    public void constructorDI(){
        System.out.println(this.addr);
        System.out.println(this.age);
    }

    // 引用类型
    private Book book;
    private MyOrder order;

    // 简单类型
    private String name;
    private int phone;

    // 提供setter方法
    public void setBook(Book book) {
        this.book = book;
    }
    public void setOrder(MyOrder order) {
        this.order = order;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPhone(int phone) {
        this.phone = phone;
    }

    // 通过setter注入
    public void setterDI(){
        this.book.test();
        this.order.test();
        System.out.println(this.name);
        System.out.println(this.phone);
    }

    // 集合
    // 集合中既可以装简单数据类型也可以装引用数据类型
    private int[] array;
    private List<String> list;
    private Set<String> set;
    private Map<String,String> map;
    private Properties properties;
    public void setArray(int[] array) {
        this.array = array;
    }
    public void setList(List<String> list) {
        this.list = list;
    }
    public void setSet(Set<String> set) {
        this.set = set;
    }
    public void setMap(Map<String, String> map) {
        this.map = map;
    }
    public void setProperties(Properties properties) {
        this.properties = properties;
    }

    public void setterArraysDI() {
        System.out.println("遍历数组:" + Arrays.toString(array));
        System.out.println("遍历List" + list);
        System.out.println("遍历Set" + set);
        System.out.println("遍历Map" + map);
        System.out.println("遍历Properties" + properties);
    }
}
