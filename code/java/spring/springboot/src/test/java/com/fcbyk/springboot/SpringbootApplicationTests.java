package com.fcbyk.springboot;

import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.fcbyk.springboot.entity.User;
import com.fcbyk.springboot.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class SpringbootApplicationTests {

    // #region index
    @Autowired
    private UserMapper userMapper;

    @Test
    public void testSelect() {
        List<User> userList = userMapper.selectList(null);
        Assert.isTrue(5 == userList.size(), "");
        userList.forEach(System.out::println);
    }
    // #endregion index


    @Test
    void contextLoads() {
    }

}
