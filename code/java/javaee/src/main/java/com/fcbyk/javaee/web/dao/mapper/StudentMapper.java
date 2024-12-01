package com.fcbyk.javaee.web.dao.mapper;

import com.fcbyk.javaee.web.pojo.Student;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/*
 * 使用 Mapper代理方式，必须满足以下要求：
 * 定义与SQL映射文件同名的Mapper接口，并且将Mapper接口和SQL映射文件放置在同一目录下。
 * 设置SQL映射文件的namespace属性为Mapper接口全限定名
 * 在 Mapper 接口中定义方法，方法名就是SQL映射文件中sql语句的id，并保持参数类型和返回值类型一致
 * */

public interface StudentMapper {

    List<Student> selectAll();

    // 使用 Mybatis 的注解开发
    @Select("select * from Student where Sno = #{sno}")
    Student select(int sno);
}

