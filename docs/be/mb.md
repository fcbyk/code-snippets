---
layout: doc
outline: [2,3]
---

## MyBatis
[官方文档](https://mybatis.org/mybatis-3/zh_CN/index.html)

### 起步
::: code-group
```xml [坐标]
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis</artifactId>
    <version>3.5.5</version>
</dependency>
```
```text 关系
org.apache.ibatis
├── session
│   ├── SqlSession
│   │   ├── DefaultSqlSession
│   ├── SqlSessionFactory
│   │   ├── DefaultSqlSessionFactory
│   ├── Configuration
├── executor
│   ├── Executor (接口)
│   │   ├── BaseExecutor (抽象类)
│   │   │   ├── SimpleExecutor
│   │   │   ├── ReuseExecutor
│   │   │   ├── BatchExecutor
│   ├── ResultExtractor
├── mapping
│   ├── MappedStatement
│   ├── BoundSql
│   ├── ParameterMap
│   ├── ResultMap
│   ├── SqlSource (接口)
│   │   ├── StaticSqlSource
│   │   ├── DynamicSqlSource
│   │   ├── RawSqlSource
├── builder
│   ├── BaseBuilder (抽象类)
│   │   ├── XmlConfigBuilder
│   │   ├── MapperBuilderAssistant
│   ├── SqlSourceBuilder
├── datasource
│   ├── DataSourceFactory (接口)
│   │   ├── PooledDataSourceFactory
│   │   ├── UnpooledDataSourceFactory
│   │   ├── JndiDataSourceFactory
├── transaction
│   ├── Transaction (接口)
│   │   ├── JdbcTransaction
│   │   ├── ManagedTransaction
│   ├── TransactionFactory (接口)
│   │   ├── JdbcTransactionFactory
│   │   ├── ManagedTransactionFactory
├── type
│   ├── TypeHandler (接口)
│   │   ├── BaseTypeHandler (抽象类)
│   │   │   ├── IntegerTypeHandler
│   │   │   ├── StringTypeHandler
│   │   │   ├── DateTypeHandler
```
:::

### 配置

::: code-group
<<< @/../code/java/javaee/src/main/resources/mybatis-config.xml [xml]
<<< @/../code/java/javaee/src/main/java/com/fcbyk/javaee/web/dao/MyBatis.java#config [配置类]
:::

### Mapper

::: code-group
<<< @/../code/java/javaee/src/main/resources/com/fcbyk/javaee/web/dao/mapper/StudentMapper.xml [xml]
<<< @/../code/java/javaee/src/main/java/com/fcbyk/javaee/web/dao/mapper/StudentMapper.java#index [接口]
:::

### 使用
::: code-group
<<< @/../code/java/javaee/src/main/java/com/fcbyk/javaee/web/dao/MyBatis.java#conf [加载配置]
<<< @/../code/java/javaee/src/main/java/com/fcbyk/javaee/web/dao/MyBatis.java#use [执行sql]
:::

## MyBatisPlus

[baomidou.com](https://baomidou.com/)<span style="margin-right: 10px;"></span>
[mybatis.plus](https://mybatis.plus)

### 起步

::: code-group
```xml [坐标]
<dependency>
    <groupId>com.baomidou</groupId>
    <artifactId>mybatis-plus</artifactId>
    <version>3.5.9</version>
</dependency>
```
```text 关系
MyBatisPlus
├── base
│   ├── BaseMapper
│   ├── BaseRepository
│   ├── BaseService
│   ├── BaseServiceImpl
│   ├── BaseWrapper
│   ├── IPage
│   ├── Page
│   ├── Pageable
│   ├── QueryWrapper
│   ├── Wrapper
├── config
│   ├── MybatisPlusConfig
│   ├── SqlSessionFactoryBuilder
│   ├── SqlSessionFactory
├── generator
│   ├── AutoGenerator
│   ├── DataSourceConfig
│   ├── GlobalConfig
│   ├── JavaConfig
│   ├── MybatisGenerator
│   ├── StrategyConfig
├── mapper
│   ├── Mapper
│   ├── MapperFactory
│   ├── SqlSessionTemplate
├── meta
│   ├── MetaObjectHandler
│   ├── PropertyHandler
├── plugin
│   ├── Interceptor
│   ├── PageInterceptor
│   ├── Plugin
│   ├── PaginationPlugin
│   ├── PerformanceInterceptor
├── util
│   ├── BeanUtils
│   ├── DateUtil
│   ├── ReflectionUtil
│   ├── StringUtils
```
:::

### 基本使用
> in Spring Boot，已配置数据源
::: code-group
<<< @/../code/java/spring/springboot/src/main/java/com/fcbyk/springboot/entity/User.java#index [实体类]
<<< @/../code/java/spring/springboot/src/main/java/com/fcbyk/springboot/mapper/UserMapper.java#index [mapper]
<<< @/../code/java/spring/springboot/src/test/java/com/fcbyk/springboot/SpringbootApplicationTests.java#index [使用]
:::