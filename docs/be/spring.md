---
layout: doc
outline: [2,3]
---

[官网](https://spring.io/)

## Spring

#### 坐标
<<< @/../code/java/spring/springframework/pom.xml#sp

### IOC
> Spring创建了一个容器用来存放所创建的对象，这个容器就叫IOC容器
#### 配置文件.xml
::: code-group
<<< @/../code/java/spring/springframework/src/main/resources/hello-oci.xml [bean]
<<< @/../code/java/spring/springframework/src/main/resources/applicationContext.xml#beanattr [属性]
:::
#### 注解
::: code-group
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/config/SpringConfig.java#index [配置类]
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/bean/ABook.java#index [bean]
:::
#### 获取容器与bean
::: code-group
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/api/ApplicationContext_.java#getioc [xml]
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/api/ApplicationContext_.java#aioc [class]
:::

### DI
#### 配置文件.xml
::: code-group
<<< @/../code/java/spring/springframework/src/main/resources/applicationContext.xml#di-setter [demo]
<<< @/../code/java/spring/springframework/src/main/resources/applicationContext.xml#di [其他注入]
<<< @/../code/java/spring/springframework/src/main/resources/applicationContext.xml#ds [管理第三方bean]
:::
#### 注解
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/bean/ADI.java#index
#### 使用
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/TestDI.java#index

## SpringMVC

### 配置
::: code-group
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/config/SpringMvcConfig.java#index [mvc]
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/config/ServletContainersInitConfig.java#index [servlet]
:::

### Controller
::: code-group
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/controller/UserController.java#index [demo]
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/controller/ParamController.java#index [接收数据]
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/controller/BookController.java#index [RESTful]
:::

## SpringBoot

### 配置
> Spring Boot 会自动加载位于默认位置的配置文件
::: code-group
<<< @/../code/java/spring/springboot/src/main/resources/application.properties#base [基础]
<<< @/../code/java/spring/springboot/src/main/resources/application.properties#db [数据库]
:::

### 启动
::: code-group
<<< @/../code/java/spring/springboot/src/main/java/com/fcbyk/springboot/Application.java#index [mian]
```sh [sh]
# Spring Boot 提供内嵌的 Tomcat、Jetty、Undertow 等服务器
java -jar myapp.jar

# 以指定的配置文件启动程序
java -jar myapp.jar --spring.config.name=myconfig

# ...
# 可根据需求，动态地写启动参数，覆盖配置文件
```
:::