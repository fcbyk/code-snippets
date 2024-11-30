## 概述
<a href="https://maven.apache.org/" style="margin-right: 5px;">官网</a>

Apache Maven 是一个项目管理和构建工具，它基于项目对象模型(POM)的概念，通过一小段描述信息来管理项目的构建、报告和文档。

Maven专门用于管理和构建Java项目，它的主要功能有：
提供了一套标准化的项目结构
提供了一套标准化的构建流程（编译，测试，打包，发布……）
提供了一套依赖管理机制

**标准化的项目结构：**

项目结构我们都知道，每一个开发工具（IDE）都有自己不同的项目结构，它们互相之间不通用。我再eclipse中创建的目录，无法在idea中进行使用，这就造成了很大的不方便

而Maven提供了一套标准化的项目结构，所有的IDE使用Maven构建的项目完全一样，所以IDE创建的Maven项目可以通用。

**Maven构建的项目结构**

```txt
maven-project 项目名称
	-src 源代码和测试代码目录
		-mian 源代码目录
			-java 源代码Java文件目录
			-resources 源代码配置文件目录
			-webapp web项目核心目录
		-test 测试代码目录
			-java 测试代码Java文件目录
			-resources 测试代码配置文件目录
	-pom.xml 项目核心配置文件
```

**依赖管理**

Maven使用标准的 坐标 配置来管理各种依赖，只需要简单的配置就可以完成依赖管理

