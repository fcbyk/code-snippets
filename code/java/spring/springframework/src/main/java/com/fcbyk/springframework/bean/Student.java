package com.fcbyk.springframework.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Component("student")
// 等于xml配置的<bean id="student" class="当前类"/>
// 对于@Component注解，还衍生出了其他三个注解@Controller、@Service、@Repository
// 这三个注解和@Component注解的作用是一样的，用于区分出这个类是属于表现层、业务层还是数据层的类
// @Component注解不可以添加在接口上，因为接口是无法创建对象的
// @Component注解如果不起名称，会有一个默认值就是当前类名首字母小写，所以也可以按照名称获取

@Scope("prototype")
// 等于xml配置的<bean scope="prototype"/>
// @Scope设置bean的作用范围

@PropertySource("jdbc.properties")
// 加载properties配置文件

public class Student {

    @Autowired
    // 按照类型自动注入
    private Tea tea;

    @Value("中国移动")
    // 注入简单类型数据
    private String name;

    @Value("10086")
    private int phone;

    @Value("${jdbc.password}")
    // 读取配置文件中的内容
    private String password;

    @Value("${jdbc.url}")
    private String url;

    public void setterDI(){
        this.tea.test();
        System.out.println(this.name);
        System.out.println(this.phone);
        System.out.println(this.url);
        System.out.println(this.password);
    }

    // 测试方法
    public void test() {
        System.out.println("学生test方法执行");
    }

    @PostConstruct
    // 生命周期方法，表示bean初始化对应的操作
    public void init(){
        System.out.println("学生bean初始化");
    }

    @PreDestroy
    // 生命周期方法，表示bean销毁前对应的操作
    public void destroy(){
        System.out.println("学生bean销毁");
    }

    @Bean("mybook")
    // 设置该方法的返回值作为spring管理的bean
    // 代替了xml配置里的工厂函数属性
    public Book getBook(){
        return new Book("三国");
    }
}
