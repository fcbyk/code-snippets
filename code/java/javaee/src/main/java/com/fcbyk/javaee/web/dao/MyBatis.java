package com.fcbyk.javaee.web.dao;

import com.alibaba.druid.pool.DruidAbstractDataSource;
import com.alibaba.druid.pool.DruidDataSource;
import com.fcbyk.javaee.web.dao.mapper.StudentMapper;
import com.fcbyk.javaee.web.pojo.Student;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class MyBatis {

    // #region conf
    public static SqlSessionFactory getFactory() throws IOException{
        // 加载 mybatis的核心配置文件，获取 SqlSessionFactory 并return出去
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        return new SqlSessionFactoryBuilder().build(inputStream);
    }
    // #endregion conf

    // #region use
    public static void addListPrint() throws IOException {

        // 获取SqlSession对象，用它来执行sql
        SqlSession sqlSession = getFactory().openSession();

        List<Student> studentList_0 = sqlSession.selectList("com.fcbyk.javaee.web.dao.mapper.StudentMapper.selectAll");

        StudentMapper stuMapper_2 = sqlSession.getMapper(StudentMapper.class);
        List<Student> studentList_1 = stuMapper_2.selectAll();
        Student stu = stuMapper_2.select(201215125);

        System.out.println(studentList_0.get(1)==studentList_1.get(1));

        // 释放资源
        sqlSession.close();
    }
    // #endregion use

    // #region config
    public static SqlSessionFactory getSqlSessionFactory() {
        // 数据源配置
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql:///javaee?useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("123456");

        // 配置 MyBatis
        Configuration configuration = new Configuration();
        configuration.addMapper(StudentMapper.class); // 注册 Mapper 接口

        // 构建 SqlSessionFactory
        return new SqlSessionFactoryBuilder().build(configuration);
    }
    // #endregion config
}

