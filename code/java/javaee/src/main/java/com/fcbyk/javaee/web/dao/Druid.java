package com.fcbyk.javaee.web.dao;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import javax.sql.DataSource;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

/*
 * 数据库连接池简介
 * 数据库连接池是个容器，负责分配、管理数据库连接(Connection)
 * 它允许应用程序重复使用一个现有的数据库连接，而不是再重新建立一个；
 * 释放空闲时间超过最大空闲时间的数据库连接来避免因为没有释放数据库连接而引起的数据库连接遗漏
 * */

/*
 * 数据库连接池实现
 * 标准接口：DataSource
 * 官方(SUN) 提供的数据库连接池标准接口，由第三方组织实现此接口。该接口提供了获取连接的功能
 * */

/*
 * 以后就不需要通过 DriverManager 对象获取 Connection 对象
 * 而是通过连接池（DataSource）获取 Connection 对象
 * */

/*
 * Druid（德鲁伊）连接池是阿里巴巴开源的数据库连接池项目
 * 功能强大，性能优秀，是Java语言最好的数据库连接池之一
 * */

public class Druid {

    public static void getUserDir(){
        // 打印当前路径
        System.out.println(System.getProperty("user.dir"));
    }

    public static Connection getconn() throws Exception {

        // 加载配置文件
        Properties prop = new Properties();

        // main方法运行路径，带模块名
        // prop.load(new FileInputStream("web/src/main/resources/druid.properties"));

        // 单元测试路径，不带模块名
        prop.load(new FileInputStream("src/main/resources/druid.properties"));

        // 获取连接池对象
        DataSource dataSource = DruidDataSourceFactory.createDataSource(prop);

        // 获取并返回数据库连接对象
        return dataSource.getConnection();
    }

    // 测试连接
    public static void selectStudent() throws Exception {
        Connection conn = getconn();
        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery("select * from student");

        while (rs.next()) {
            // 获取与打印数据  getXxx()
            System.out.print(rs.getInt("Sno") + "\t");
            System.out.print(rs.getString("Sname") + "\t");
            System.out.print(rs.getString("Sex") + "\n");
        }

        rs.close();
        stmt.close();
    }
}

