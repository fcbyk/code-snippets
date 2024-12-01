package com.fcbyk.javaee.web;

import com.fcbyk.javaee.web.dao.Druid;
import org.junit.Test;

// 不通过测试，无法进行打包操作

// 运行测试前需要修改 druid.properties 配置文件
// 更改数据库连接信息

public class TestDruid {

    @Test
    public void test01() throws Exception {
        // 获取与打印 Student表数据
        Druid.selectStudent();
    }
}

