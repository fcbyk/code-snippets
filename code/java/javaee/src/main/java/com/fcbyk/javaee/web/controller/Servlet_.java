package com.fcbyk.javaee.web.controller;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;

// Servlet是JavaEE规范之一，它实际上是一个接口。我们需要定义Servlet类来实现Servlet接口，并由web服务器来运行Servlet。

// Servlet实现类由web服务器创建，并且其实现方法由web服务器在需要时进行调用。

/*
* 生命周期
* Servlet运行在Servlet容器（即web服务器）中，其生命周期由容器来管理，分为4个阶段：
* 1. 加载和实例化：当首次访问Servlet时，容器会创建Servlet对象。
* 2. 初始化：在Servlet实例化后，容器将调用Servlet的init()方法一次，用于初始化对象，完成一些如加载配置文件、创建连接等初始化的工作。
*    该阶段仅在Servlet第一次被请求时发生。
* 3. 请求处理：每次请求Servlet时，容器都会调用Servlet的service()方法来处理请求。
* 4. 服务终止：当需要释放内存或者容器关闭时，容器会调用Servlet实例的destroy()方法完成资源的释放。
*    在destroy()方法调用之后，容器会释放该Servlet实例，随后会被Java的垃圾收集器回收。
* */

// 这是 Servlet 3.0 引入的注解，用于将 Servlet 映射到指定的 URL 路径。在这个例子中，Servlet 将会处理 /hello 路径的请求
@WebServlet("/hello")
public class Servlet_ implements Servlet {

    // 这是 Servlet 接口中定义的方法，用于处理客户端的请求。在这里，可以编写业务逻辑来处理请求，并生成响应
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws IOException {

        System.out.println("hello servlet~");

        // 设置响应内容类型为HTML
        servletResponse.setContentType("text/html");

        // 获取输出流
        PrintWriter out = servletResponse.getWriter();

        // 输出HTML内容
        out.println("<html>");
        out.println("<head><title>Hello Servlet</title></head>");
        out.println("<body>");
        out.println("<h1>Hello Servlet~</h1>");
        out.println("</body>");
        out.println("</html>");
    }

    // 用于在 Servlet 实例被创建后进行初始化。你可以在这个方法中进行一些初始化操作，例如读取配置文件或者建立数据库连接
    public void init(ServletConfig servletConfig) {
    }

    // 获取 Servlet 配置信息
    public ServletConfig getServletConfig() {
        return null;
    }

    // 获取 Servlet 描述信息
    public String getServletInfo() {
        return null;
    }

    // 用于在 Servlet 实例被销毁前进行清理工作。在这个方法中，你可以释放资源、关闭数据库连接等。
    public void destroy() { }
}
