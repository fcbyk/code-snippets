---
layout: doc
outline: [2,3]
---

# MySql

[社区版下载](https://downloads.mysql.com/archives/community/)

### 模式
<<< @/../code/mysql/databases.sql

### 表
::: code-group
<<< @/../code/mysql/table.sql#create [CREATE]
<<< @/../code/mysql/table.sql#insert [INSERT]
<<< @/../code/mysql/table.sql#update [UPDATE]
<<< @/../code/mysql/table.sql#delete [DELETE]
<<< @/../code/mysql/table.sql#alter [ALTER]
<<< @/../code/mysql/table.sql#drop [...]
:::

### 约束
::: code-group
<<< @/../code/mysql/constraint.sql#l [列级约束]
<<< @/../code/mysql/constraint.sql#t [表级约束]
<<< @/../code/mysql/constraint.sql#alter [修改]
<<< @/../code/mysql/constraint.sql#del [删除]
:::

### 查询
::: code-group
<<< @/../code/mysql/select.sql#0 [基本]
<<< @/../code/mysql/select.sql#1 [条件]
<<< @/../code/mysql/select.sql#2 [排序]
<<< @/../code/mysql/select.sql#3 [聚合函数]
<<< @/../code/mysql/select.sql#4 [分组]
<<< @/../code/mysql/select.sql#5 [分页]
:::

### 视图
<<< @/../code/mysql/view.sql

### 触发器
<<< @/../code/mysql/trigger.sql#index

### 存储过程
<<< @/../code/mysql/procedure.sql

### 权限管理
::: code-group
<<< @/../code/mysql/user.sql#0 [用户管理]
<<< @/../code/mysql/user.sql#1 [密码策略]
:::

<!-- ### 事务 -->

<!-- ### 数据类型 -->