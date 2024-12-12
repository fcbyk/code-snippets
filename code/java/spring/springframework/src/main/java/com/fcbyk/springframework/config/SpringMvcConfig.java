package com.fcbyk.springframework.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// #region index
// mvc配置类
@Configuration
@EnableWebMvc
@ComponentScan("com.fcbyk.springframework.controller")
public class SpringMvcConfig implements WebMvcConfigurer {
    // 配置视图解析器、拦截器等
}
// #endregion index