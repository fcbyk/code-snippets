package com.fcbyk.javaee.web.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet的体系结构
// Servlet: Servlet体系根接口
// GenericServlet: Servlet抽象实现类
// HttpServlet：对 HTTP协议封装的 Servlet实现类

// urlPattern: 一个Servlet可以配置多个访问路径
// #region http-servlet
@WebServlet(urlPatterns = {"/demo2","/demo02"})
public class HttpServlet_ extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){
        // Get 请求方式处理逻辑
        System.out.println("get...");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){
        // Post 请求方式处理逻辑
        System.out.println("post...");
    }
}
// #endregion http-servlet
