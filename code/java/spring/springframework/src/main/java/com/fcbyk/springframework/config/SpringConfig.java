package com.fcbyk.springframework.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
// #region index
// 标识为一个配置类,代替applicationContext.xml
@Configuration

// 包扫描配置
// 代替<context:component-scan base-package="com.fcbyk.springframework.bean"/>
@ComponentScan("com.fcbyk.springframework")
public class SpringConfig {

}
// #endregion index
