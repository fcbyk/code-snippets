package com.fcbyk.springboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.fcbyk.springboot.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

// #region index
public interface UserMapper extends BaseMapper<User> {

    // MyBatis-Plus 提供了许多开箱即用的方法

    @Select("SELECT 'Hello, World!'")
    String helloWorld();

    // 如果使用注解和 XML 都无法满足需求，可以手动实现 Mapper 接口的方法。
}
// #endregion index
