---
layout: doc
outline: [2,3]
---

# Java

[Java 全栈知识体系](https://pdai.tech/)<span style="margin-right: 10px;"></span>

## 语法

<!-- ### Hello World
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/Application.java#hello -->

### 变量与常量
::: code-group
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Variables.java#var [变量]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Variables.java#const [常量]
:::

### 数据类型
- 8种基本数据类型
::: code-group
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#int [整型]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#float [浮点型]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#char [字符型]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#bol [布尔型]
:::
- 引用数据类型
::: code-group
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#string [字符串]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#array [数组]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#class [类]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#interface [接口]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#enum [枚举]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/DataType.java#w-class [包装类]
:::

### 运算符
::: code-group
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Operator.java#arithmetic [算术]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Operator.java#logic [逻辑]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Operator.java#comparison [比较]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Operator.java#assignment [赋值]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Operator.java#ternary [条件]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Operator.java#bitwise [位]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Operator.java#unary [一元]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Operator.java#instanceOf [instanceof]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Operator.java#nullCoalescing [null]
::: 

### 控制语句
::: code-group
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Control.java#if [分支]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Control.java#while [循环]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Control.java#return [跳转]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Control.java#labeled [标签]
::: 

### 方法（函数）
::: code-group
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Method.java#def [定义]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/grammar/Method.java#reload [重载]
::: 

<!-- ### 类

### 接口

### 泛型

### 注解 -->

## 集合 API
::: code-group

``` text [关系]
- Collection (接口)
  - List (接口)
    - ArrayList (实现类)
    - LinkedList (实现类)
  - Set (接口)
    - HashSet (实现类)
    - TreeSet (实现类)
  - Queue (接口)
    - LinkedList (实现类)
    - PriorityQueue (实现类)
  
- Map (接口)
  - HashMap (实现类)
  - TreeMap (实现类)
  - LinkedHashMap (实现类)
  - Hashtable (实现类)
```
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/Collection/Collection_.java#arraylist [ArrayList]
<<< @/../code/java/javase/src/main/java/com/fcbyk/javase/Collection/Map_.java#map [Map]
:::

## Servlet API
::: code-group
``` text [关系]
- javax.servlet (包)
  - Servlet (接口)
    - GenericServlet (抽象类)
    - HttpServlet (抽象类)
  - ServletRequest (接口)
    - HttpServletRequest (接口)
  - ServletResponse (接口)
    - HttpServletResponse (接口)
  - ServletConfig (接口)
  - ServletContext (接口)
  - Filter (接口)
    - GenericFilter (抽象类)
  - Listener (接口)
    - ServletContextListener (接口)
    - HttpSessionListener (接口)
    - ServletRequestListener (接口)
    - ServletContextAttributeListener (接口)
    - HttpSessionAttributeListener (接口)
  - RequestDispatcher (接口)
  - FilterConfig (接口)
```
<<< @/../code/java/javaee/src/main/java/com/fcbyk/javaee/web/controller/Servlet_.java#servlet [Servlet]
<<< @/../code/java/javaee/src/main/java/com/fcbyk/javaee/web/controller/HttpServlet_.java#http-servlet [HttpServlet]
:::

## JDBC API
::: code-group
``` text [关系]
JDBC
├── java.sql.Connection
│   ├── java.sql.DriverManager
│   └── javax.sql.DataSource
│       ├── com.mysql.cj.jdbc.MysqlDataSource        (MySQL)
│       └── org.postgresql.ds.PGSimpleDataSource     (PostgreSQL)
├── java.sql.Statement
│   ├── java.sql.PreparedStatement
│   ├── java.sql.CallableStatement
│   └── com.mysql.cj.jdbc.StatementImpl            (MySQL)
├── java.sql.ResultSet
│   └── com.mysql.cj.jdbc.result.ResultSetImpl      (MySQL)
├── java.sql.Driver
│   └── com.mysql.cj.jdbc.Driver                    (MySQL)
├── java.sql.SQLException
└── javax.sql.ConnectionPoolDataSource
    └── com.mysql.cj.jdbc.MysqlConnectionPoolDataSource (MySQL)
```
<<< @/../code/java/javaee/src/main/java/com/fcbyk/javaee/web/dao/JDBC.java#connection [Connection]
<<< @/../code/java/javaee/src/main/java/com/fcbyk/javaee/web/dao/JDBC.java#statement [Statement]
<<< @/../code/java/javaee/src/main/java/com/fcbyk/javaee/web/dao/JDBC.java#resultSet [ResultSet]
:::