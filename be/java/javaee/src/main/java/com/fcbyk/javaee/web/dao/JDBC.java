package com.fcbyk.javaee.web.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.fcbyk.javaee.web.pojo.Student;

/*
 * JDBC   就是使用Java语言操作关系型数据库的一套API
 * 全称：( Java DataBase Connectivity ) Java 数据库连接
 * */

/*
 * JDBC API详解
 * DriverManager 驱动管理类
 * Connection 数据库连接对象
 * Statement 用于执行SQL语句
 * PreparedStatement 预编译SQL语句并执行，预防SQL注入问题
 * ResultSet 结果集对象
 * */

public class JDBC {

    public static Connection getconn() throws SQLException {
        // 注册驱动，MySQL5之后的驱动包不用写
        // Class.forName("com.mysql.jdbc.Driver");

        // 获取连接：如果连接的是本机mysql并且端口是默认的 3306 可以简化书写
        return DriverManager.getConnection(
                "jdbc:mysql:///javaee?useSSL=false",
                "root",
                "123456"
        );
    }

    public static void testConnect() throws Exception {

        // 获取连接对象
        Connection conn = getconn();

        // 获取执行sql的对象 Statement
        Statement stmt = conn.createStatement();

        try {
            // ============开启事务==========
            conn.setAutoCommit(false);

            // 执行sql，返回受影响行数
            int count = stmt.executeUpdate(
                    "update student set sname = '张立' where sno = 201215125"
            );
            System.out.println(count);

            // ============提交事务==========
            //程序运行到此处，说明没有出现任何问题，则需求提交事务
            conn.commit();

        } catch (Exception e) {
            // ============回滚事务==========
            //程序在出现异常时会执行到这个地方，此时就需要回滚事务
            conn.rollback();
            e.printStackTrace();
        }

        // 释放资源
        stmt.close();
        conn.close();
    }

    // sql查询
    public static void selectPrint() throws Exception {
        Connection conn = getconn();
        Statement stmt = conn.createStatement();

        // 执行sql
        ResultSet rs = stmt.executeQuery("select * from student");

        // 处理结果， 遍历rs中的所有数据
        // 光标向下移动一行，并且判断当前行是否有数据
        while (rs.next()) {
            // 获取与打印数据  getXxx()
            System.out.print(rs.getInt("Sno") + "\t");
            System.out.print(rs.getString("Sname") + "\t");
            System.out.print(rs.getString("Sex") + "\n");
        }

        // 释放资源
        rs.close();
        stmt.close();
        conn.close();
    }

    // sql查询,把结果放集合里面
    public static void addListPrint() throws Exception {
        Connection conn = getconn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from student");
        List<Student> list = new ArrayList<>();

        while (rs.next()) {
            list.add(new Student(
                    rs.getInt("Sno"),
                    rs.getString("Sname"),
                    rs.getString("Sex")
            ));
        }

        System.out.println(list);

        rs.close();
        stmt.close();
        conn.close();
    }

    // 模拟SQL注入问题
    // 下面代码是将用户名和密码拼接到sql语句中，拼接后的sql语句如下
    // select * from tb_user where username = 'sjdljfld' and password = ''or '1' = '1'
    public static void test04() throws Exception {

        Connection conn = getconn();
        Statement stmt = conn.createStatement();

        // 接收用户输入 用户名和密码
        String name = "sjdljfld";
        String pwd = "' or '1' = '1";
        String sql = "select * from tb_user where username = '" + name + "' and password = '" + pwd + "'";

        // 执行sql
        ResultSet rs = stmt.executeQuery(sql);

        // 判断登录是否成功
        if (rs.next()) {
            System.out.println("登录成功~");
        } else {
            System.out.println("登录失败~");
        }

        rs.close();
        stmt.close();
        conn.close();
    }

    // 使用 PreparedStatement 对象预编译SQL语句并执行, 预防SQL注入问题
    // PreparedStatement的原理是将敏感字符进行转义
    public static void test05() throws Exception {

        Connection conn = getconn();

        // 接收用户输入 用户名和密码
        String name = "sjdljfld";
        String pwd = "' or '1' = '1";
        String sql = "select * from tb_user where username = ? and password = ? ";

        // 获取pstmt对象
        PreparedStatement pstmt = conn.prepareStatement(sql);
        // 设置 ？的值
        pstmt.setString(1,name);
        pstmt.setString(2,pwd);
        // 执行sql
        ResultSet rs = pstmt.executeQuery();

        // 判断登录是否成功
        if (rs.next()) {
            System.out.println("登录成功~");
        } else {
            System.out.println("登录失败~");
        }

        rs.close();
        pstmt.close();
        conn.close();
    }
}


