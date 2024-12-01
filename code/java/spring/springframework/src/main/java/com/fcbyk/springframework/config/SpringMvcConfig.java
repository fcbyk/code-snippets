package com.fcbyk.springframework.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
// mvc配置类
@ComponentScan("com.fcbyk.springframework.controller")
public class SpringMvcConfig {

}
