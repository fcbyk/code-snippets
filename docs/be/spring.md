---
layout: doc
outline: [2,3]
---

[官网](https://spring.io/)

## Spring

### 坐标
<<< @/../code/java/spring/springframework/pom.xml#sp

### OCI
> Spring创建了一个容器用来存放所创建的对象，这个容器就叫IOC容器
#### 配置文件.xml
::: code-group
<<< @/../code/java/spring/springframework/src/main/resources/hello-oci.xml [bean]
<<< @/../code/java/spring/springframework/src/main/resources/applicationContext.xml#beanattr [属性]
:::
#### 获取容器与bean
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/api/ApplicationContext_.java#getioc

### DI
#### 配置文件.xml
::: code-group
<<< @/../code/java/spring/springframework/src/main/resources/applicationContext.xml#di-setter [demo]
<<< @/../code/java/spring/springframework/src/main/resources/applicationContext.xml#di [其他注入]
<<< @/../code/java/spring/springframework/src/main/resources/applicationContext.xml#ds [管理第三方bean]
:::
#### 使用
<<< @/../code/java/spring/springframework/src/main/java/com/fcbyk/springframework/TestDI.java#index