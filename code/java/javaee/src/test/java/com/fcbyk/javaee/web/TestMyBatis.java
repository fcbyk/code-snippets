package com.fcbyk.javaee.web;

// 运行测试前请配置 mybatis-config.xml
// 更改数据库连接信息

import com.fcbyk.javaee.web.dao.MyBatis;
import org.junit.Test;

import java.io.IOException;

public class TestMyBatis {

    @Test
    // 查询,把结果放集合里面,打印输出
    public void test01() throws IOException {
        MyBatis.addListPrint();
    }

    @Test
    // 查询,把结果放集合里面,打印输出
    public void test02() throws IOException {
//        MyBatis.mapperDev();
    }

    @Test
    // 查询一行数据,打印输出
    public void test03() throws IOException {
//        MyBatis.annotationDev();
    }
}

