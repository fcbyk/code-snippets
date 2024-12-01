package com.fcbyk.javaee.web;
import org.junit.Test;
import com.fcbyk.javaee.web.dao.JDBC;

public class TestJDBC {
    @Test
    // 数据库连接成功则返回 1
    public void test01() throws Exception {
        JDBC.testConnect();
    }

    @Test
    // 获取与打印 Student表数据
    public void test02() throws Exception {
        JDBC.selectPrint();
    }

    @Test
    // 查询,把结果放集合里面,打印输出
    public void test03() throws Exception {
        JDBC.addListPrint();
    }
}
