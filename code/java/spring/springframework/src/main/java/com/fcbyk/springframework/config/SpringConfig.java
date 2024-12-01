package com.fcbyk.springframework.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
// 标识为一个配置类,代替applicationContext.xml

@ComponentScan("com.fcbyk.springframework")
// 包扫描配置
// 代替<context:component-scan base-package="com.fcbyk.springframework.bean"/>
public class SpringConfig {

}
