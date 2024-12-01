package com.fcbyk.javaee.web.dao;

import com.fcbyk.javaee.web.dao.mapper.StudentMapper;
import com.fcbyk.javaee.web.pojo.Student;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class MyBatis {

    public static SqlSessionFactory getFactory() throws IOException{
        // 加载 mybatis的核心配置文件，获取 SqlSessionFactory 并return出去
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        return new SqlSessionFactoryBuilder().build(inputStream);
    }

    // MyBatis初体验
    public static void addListPrint() throws IOException {

        // 获取SqlSession对象，用它来执行sql
        SqlSession sqlSession = getFactory().openSession();

        // 执行sql
        // 参数是一个字符串，该字符串必须是映射配置文件的namespace.id
        List<Student> stu = sqlSession.selectList("com.fcbyk.javaee.web.dao.mapper.StudentMapper.selectAll");
        System.out.println(stu);

        // 释放资源
        sqlSession.close();
    }

    // Mapper代理开发
    public static void mapperDev() throws IOException {

        SqlSession sqlSession = getFactory().openSession();

        // 执行sql
        // 获取 StudentMapper接口的代理对象
        StudentMapper stuMapper = sqlSession.getMapper(StudentMapper.class);
        List<Student> stu = stuMapper.selectAll();

        System.out.println("Mapper代理开发");
        System.out.println(stu);

        sqlSession.close();
    }

    // 使用 Mybatis 的注解开发
    public static void annotationDev() throws IOException {

        SqlSession sqlSession = getFactory().openSession();

        StudentMapper stuMapper = sqlSession.getMapper(StudentMapper.class);
        Student stu = stuMapper.select(201215125);

        System.out.println("使用 Mybatis 的注解开发");
        System.out.println(stu);

        sqlSession.close();
    }
}

