# 1 用户管理  
## 1.1 登录MySQL服务器  
启动MySQL服务后，可以通过mysql命令来登录MySQL服务器，命令如下：  
```shell
 mysql –h hostname|hostIP –P port –u username –p DatabaseName –e "SQL语句"  
```
 下面详细介绍命令中的参数：  

-  -h参数 后面接主机名或者主机IP，hostname为主机，hostIP为主机IP。 
- -P参数 后面接MySQL服务的端口，通过该参数连接到指定的端口。MySQL服务的默认端口是3306， 不使用该参数时自动连接到3306端口，port为连接的端口号。 
- -u参数 后面接用户名，username为用户名。 
- -p参数 会提示输入密码。
-  DatabaseName参数 指明登录到哪一个数据库中。如果没有该参数，就会直接登录到MySQL数据库 中，然后可以使用USE命令来选择数据库。 
- -e参数 后面可以直接加SQL语句。登录MySQL服务器以后即可执行这个SQL语句，然后退出MySQL 服务器。  

 举例：  
```shell
mysql -uroot -p -hlocalhost -P3306 mysql -e "select host,user from user"
```
##  1.2 创建用户 
 CREATE USER语句的基本语法形式如下：  
```plsql
CREATE USER 用户名 [IDENTIFIED BY '密码'][,用户名 [IDENTIFIED BY '密码']];
```

-  用户名参数表示新建用户的账户，由 用户（User） 和 主机名（Host） 构成；
-  “[ ]”表示可选，也就是说，可以指定用户登录时需要密码验证，也可以不指定密码验证，这样用户 可以直接登录。不过，不指定密码的方式不安全，不推荐使用。如果指定密码值，这里需要使用 IDENTIFIED BY指定明文密码值。
-  CREATE USER语句可以同时创建多个用户。  

 举例：  
```plsql
  CREATE USER zhang3 IDENTIFIED BY '123123'; -- 默认host是 %
  CREATE USER 'kangshifu'@'localhost' IDENTIFIED BY '123456';
```
##  1.3 修改用户
 修改用户名：    
```plsql
UPDATE mysql.user SET USER='li4' WHERE USER='wang5';
FLUSH PRIVILEGES;
```
##  1.4 删除用户
** 方式1：使用DROP方式删除（推荐）  **
 使用DROP USER语句来删除用户时，必须用于DROP USER权限。DROP USER语句的基本语法形式如下：  
```plsql
DROP USER user[,user]…;
```
 举例：  
```plsql
DROP USER li4 ; -- 默认删除host为%的用户
DROP USER 'kangshifu'@'localhost';
```
** 方式2：使用DELETE方式删除  **
```plsql
DELETE FROM mysql.user WHERE Host=’hostname’ AND User=’username’;
```
 执行完DELETE命令后要使用FLUSH命令来使用户生效，命令如下：  
```plsql
FLUSH PRIVILEGES;
```
 举例：  
```plsql
DELETE FROM mysql.user WHERE Host='localhost' AND User='Emily';
FLUSH PRIVILEGES;
```
> 注意：不推荐通过 DELETE FROM USER u WHERE USER='li4' 进行删除，系统会有残留信息保 留。而drop user命令会删除用户以及对应的权限，执行命令后你会发现mysql.user表和mysql.db表 的相应记录都消失了。  

##  1.5 设置当前用户密码 
 旧的写法如下 ：  
```plsql
-- 修改当前用户的密码：（MySQL5.7测试有效）
SET PASSWORD = PASSWORD('123456');
```
 这里介绍 推荐的写法 ：  

1. **使用ALTER USER命令来修改当前用户密码** 用户可以使用ALTER命令来修改自身密码，如下语句代表修
改当前登录用户的密码。基本语法如下：
```plsql
ALTER USER USER() IDENTIFIED BY 'new_password';
```

2.  **使用SET语句来修改当前用户密码** 使用root用户登录MySQL后，可以使用SET语句来修改密码，具体 SQL语句如下：  
```plsql
SET PASSWORD='new_password';
```
 该语句会自动将密码加密后再赋给当前用户。  
##  1.6 修改其它用户密码  

1. **使用ALTER语句来修改普通用户的密码 **可以使用ALTER USER语句来修改普通用户的密码。基本语法形
式如下：
```plsql
ALTER USER user [IDENTIFIED BY '新密码']
[,user[IDENTIFIED BY '新密码']]…;
```

2. **使用SET命令来修改普通用户的密码 **使用root用户登录到MySQL服务器后，可以使用SET语句来修改普 通用户的密码。SET语句的代码如下：  
```plsql
SET PASSWORD FOR 'username'@'hostname'='new_password';
```

3. **使用UPDATE语句修改普通用户的密码（不推荐） **
```plsql
UPDATE MySQL.user SET authentication_string=PASSWORD("123456")
WHERE User = "username" AND Host = "hostname";
```
##  1.7 密码策略
### 1.7.1 密码过期策略

   - 在MySQL中，数据库管理员可以 手动设置 账号密码过期，也可以建立一个 自动 密码过期策略。 
   - 过期策略可以是 全局的 ，也可以为 每个账号 设置单独的过期策略。  
```plsql
ALTER USER user PASSWORD EXPIRE;
```
 练习：  
```plsql
ALTER USER 'kangshifu'@'localhost' PASSWORD EXPIRE
```

- ** 方式①：使用SQL语句更改该变量的值并持久化  **
```plsql
SET PERSIST default_password_lifetime = 180;
-- 建立全局策略，设置密码每隔180天过期
```

- ** 方式②：配置文件my.cnf中进行维护  **
```shell
[mysqld]
default_password_lifetime=180 #建立全局策略，设置密码每隔180天过期
```
** 手动设置指定时间过期方式2：单独设置 **
 每个账号既可延用全局密码过期策略，也可单独设置策略。在 CREATE USER 和 ALTER USER 语句上加 入 PASSWORD EXPIRE 选项可实现单独设置策略。下面是一些语句示例。  
```plsql
-- 设置kangshifu账号密码每90天过期：
CREATE USER 'kangshifu'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;
ALTER USER 'kangshifu'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;
-- 设置密码永不过期：
CREATE USER 'kangshifu'@'localhost' PASSWORD EXPIRE NEVER;
ALTER USER 'kangshifu'@'localhost' PASSWORD EXPIRE NEVER;
-- 延用全局密码过期策略：
CREATE USER 'kangshifu'@'localhost' PASSWORD EXPIRE DEFAULT;
ALTER USER 'kangshifu'@'localhost' PASSWORD EXPIRE DEFAULT;
```
### 1.7.2 密码重用策略 

-  **手动设置密码重用方式1：全局  **
   - ** 方式①：使用SQL  **
```plsql
SET PERSIST password_history = 6; -- 设置不能选择最近使用过的6个密码
SET PERSIST password_reuse_interval = 365; -- 设置不能选择最近一年内的密码
```

   - **方式②：my.cnf配置文件  	**
```shell
[mysqld]
password_history=6
password_reuse_interval=365
```
** 手动设置密码重用方式2：单独设置  **
```plsql
-- 不能使用最近5个密码：
CREATE USER 'kangshifu'@'localhost' PASSWORD HISTORY 5;
ALTER USER 'kangshifu'@'localhost' PASSWORD HISTORY 5;

-- 不能使用最近365天内的密码：
CREATE USER 'kangshifu'@'localhost' PASSWORD REUSE INTERVAL 365 DAY;
ALTER USER 'kangshifu'@'localhost' PASSWORD REUSE INTERVAL 365 DAY;

-- 既不能使用最近5个密码，也不能使用365天内的密码
CREATE USER 'kangshifu'@'localhost'
PASSWORD HISTORY 5
PASSWORD REUSE INTERVAL 365 DAY;
ALTER USER 'kangshifu'@'localhost'
PASSWORD HISTORY 5
PASSWORD REUSE INTERVAL 365 DAY;
```
### 1.7.3 有效密码策略
查看 mysql 初始的密码策略
```plsql
SHOW VARIABLES LIKE 'validate_password%';
```
设置密码的验证强度等级
```plsql
set global validate_password.policy=LOW;
```
设置密码最小长度
```plsql
set global validate_password.length=6;
```
关于 mysql 密码策略相关参数；

- validate_password.length  固定密码的总长度；
- validate_password.dictionary_file 指定密码验证的文件路径；
- validate_password.mixed_case_count  整个密码中至少要包含大/小写字母的总个数；
- validate_password.number_count  整个密码中至少要包含阿拉伯数字的个数；
- validate_password.policy 指定密码的强度验证等级，默认为 MEDIUM；
   - 关于 validate_password.policy 的取值：
      - LOW：只验证长度；
      - MEDIUM：验证长度、数字、大小写、特殊字符；
      - STRONG：验证长度、数字、大小写、特殊字符、字典文件；
- validate_password.special_char_count 整个密码中至少要包含特殊字符的个数；	
# 2 权限管理
##  2.1 权限列表  
 MySQL到底都有哪些权限呢？  
```plsql
show privileges;
```

1. **CREATE和DROP权限 **，可以创建新的数据库和表，或删除（移掉）已有的数据库和表。如果将 MySQL数据库中的DROP权限授予某用户，用户就可以删除MySQL访问权限保存的数据库。 
2. **SELECT、INSERT、UPDATE和DELETE权限** 允许在一个数据库现有的表上实施操作。 
3. **SELECT权限 **只有在它们真正从一个表中检索行时才被用到。 
4. **INDEX权限** 允许创建或删除索引，INDEX适用于已 有的表。如果具有某个表的CREATE权限，就可以在CREATE TABLE语句中包括索引定义。 
5. **ALTER权 限 **可以使用ALTER TABLE来更改表的结构和重新命名表。
6. **CREATE ROUTINE权限** 用来创建保存的 程序（函数和程序），ALTER ROUTINE权限用来更改和删除保存的程序， EXECUTE权限 用来执行保存的 程序。 
7. **GRANT权限** 允许授权给其他用户，可用于数据库、表和保存的程序。 
8. **FILE权限 **使用 户可以使用LOAD DATA INFILE和SELECT ... INTO OUTFILE语句读或写服务器上的文件，任何被授予FILE权 限的用户都能读或写MySQL服务器上的任何文件（说明用户可以读任何数据库目录下的文件，因为服务 器可以访问这些文件）。  
##  2.2 授予权限的原则  
 权限控制主要是出于安全因素，因此需要遵循以下几个 **经验原则** ： 

1. 只授予能 **满足需要的最小权限** ，防止用户干坏事。比如用户只是需要查询，那就只给select权限就可 以了，不要给用户赋予update、insert或者delete权限。 
2. 创建用户的时候 **限制用户的登录主机** ，一般是限制成指定IP或者内网IP段。 
3. 为每个用户 **设置满足密码复杂度的密码 **。 
4. **定期清理不需要的用户** ，回收权限或者删除用户。  
##  2.3 授予权限
 给用户授权的方式有 2 种，分别是通过把 **角色赋予用户给用户授权** 和 **直接给用户授权** 。用户是数据库的 使用者，我们可以通过给用户授予访问数据库中资源的权限，来控制使用者对数据库的访问，消除安全 隐患。 
授权命令：  
```plsql
GRANT 权限1,权限2,…权限n ON 数据库名称.表名称 TO 用户名@用户地址 [IDENTIFIED BY ‘密码口令’];
```

- 该权限如果发现没有该用户，则会直接新建一个用户。  

 比如：  

- 给li4用户用本地命令行方式，授予atguigudb这个库下的所有表的插删改查的权限。
```plsql
GRANT SELECT,INSERT,DELETE,UPDATE ON atguigudb.* TO li4@localhost ;
```

-  授予通过网络方式登录的joe用户 ，对所有库所有表的全部权限，密码设为123。注意这里唯独不包 括grant的权限  
```plsql
GRANT ALL PRIVILEGES ON *.* TO joe@'%' IDENTIFIED BY '123';
```
> 我们在开发应用的时候，经常会遇到一种需求，就是要根据用户的不同，对数据进行横向和纵向的 分组。 
> - 所谓横向的分组，就是指用户可以接触到的数据的范围，比如可以看到哪些表的数据； 
> - 所谓纵向的分组，就是指用户对接触到的数据能访问到什么程度，比如能看、能改，甚至是 删除。  

##  2.4 查看权限

- 查看当前用户权限 
```plsql
SHOW GRANTS;
# 或
SHOW GRANTS FOR CURRENT_USER;
# 或
SHOW GRANTS FOR CURRENT_USER();
```

- 查看某用户的全局权限 
```plsql
SHOW GRANTS FOR 'user'@'主机地址' ;
```
##  2.5 收回权限
 收回权限就是取消已经赋予用户的某些权限。**收回用户不必要的权限可以在一定程度上保证系统的安全 性**。MySQL中使用 **REVOKE语句** 取消用户的某些权限。使用REVOKE收回权限之后，用户账户的记录将从 db、host、tables_priv和columns_priv表中删除，但是用户账户记录仍然在user表中保存（删除user表中 的账户记录使用DROP USER语句）。  
** 注意：在将用户账户从user表删除之前，应该收回相应用户的所有权限。  **

- 收回权限命令  
```plsql
REVOKE 权限1,权限2,…权限n ON 数据库名称.表名称 FROM 用户名@用户地址;
```

-  举例
```plsql
-- 收回全库全表的所有权限
REVOKE ALL PRIVILEGES ON *.* FROM joe@'%';
-- 收回mysql库下的所有表的插删改查权限
REVOKE SELECT,INSERT,UPDATE,DELETE ON mysql.* FROM joe@localhost;
```

- 注意： 须用户重新登录后才能生效 
# 3 权限表
##  3.1 user表  
 user表是MySQL中最重要的一个权限表， **记录用户账号和权限信息** ，有51个字段。
 这些字段可以分成4类，分别是范围列（或用户列）、权限列、安全列和资源控制列。  

1. **范围列（或用户列）  **
-  host ： 表示连接类型  
   - ** % **表示所有远程通过 TCP方式的连接  
   - ** IP 地址** 如 (192.168.1.2、127.0.0.1) 通过制定ip地址进行的TCP方式的连接  
   - ** 机器名 **通过制定网络中的机器名进行的TCP方式的连接  
   -  **::1** IPv6的本地ip地址，等同于IPv4的 127.0.0.1  
   -  **localhost **本地方式通过命令行方式的连接 ，比如mysql -u xxx -p xxx 方式的连接。  
- user ： 表示用户名，同一用户通过不同方式链接的权限是不一样的。  
-  password ： 密码  
   -  所有密码串通过 password(明文字符串) 生成的密文字符串。MySQL 8.0 在用户管理方面增加了 角色管理，默认的密码加密方式也做了调整，由之前的 SHA1 改为了 SHA2 ，不可逆 。同时 加上 MySQL 5.7 的禁用用户和用户过期的功能，MySQL 在用户管理方面的功能和安全性都较之 前版本大大的增强了。  
   -  mysql 5.7 及之后版本的密码保存到 authentication_string 字段中不再使用password 字 段。  
2. **权限列**
-  Grant_priv字段 
   - 表示是否拥有GRANT权限 
- Shutdown_priv字段 
   - 表示是否拥有停止MySQL服务的权限 
- Super_priv字段 
   - 表示是否拥有超级权限 
- Execute_priv字段 
   - 表示是否拥有EXECUTE权限。拥有EXECUTE权限，可以执行存储过程和函数。 
- Select_priv , Insert_priv等 
   - 为该用户所拥有的权限。  
3. **安全列 **

安全列只有6个字段，其中两个是ssl相关的（ssl_type、ssl_cipher），用于 加密 ；两个是x509
相关的（x509_issuer、x509_subject），用于 标识用户 ；另外两个Plugin字段用于 验证用户身份 的插件，
该字段不能为空。如果该字段为空，服务器就使用内建授权验证机制验证用户身份。

4. **资源控制列  **

 资源控制列的字段用来 限制用户使用的资源 ，包含4个字段，分别为：  

- max_questions，用户每小时允许执行的查询操作次数；
- max_updates，用户每小时允许执行的更新 操作次数； 
- max_connections，用户每小时允许执行的连接操作次数； 
- max_user_connections，用户 允许同时建立的连接次数。  

 查看字段：  
```plsql
DESC mysql.user;
```
 查看用户, 以列的方式显示数据：  
```plsql
SELECT * FROM mysql.user \G;
```
 查询特定字段：  
```plsql
SELECT host,user,authentication_string,select_priv,insert_priv,drop_priv
FROM mysql.user;
```
## 3.2 db表
 使用DESCRIBE查看db表的基本结构：  
```plsql
DESCRIBE mysql.db;
```

1. **用户列 **

db表用户列有3个字段，分别是Host、User、Db。这3个字段分别表示主机名、用户名和数据库
名。表示从某个主机连接某个用户对某个数据库的操作权限，这3个字段的组合构成了db表的主键。

2. **权限列  **

 Create_routine_priv和Alter_routine_priv这两个字段决定用户是否具有创建和修改存储过程的权限。  
##  3.3 tables_priv表和columns_priv表  
tables_priv表用来 **对表设置操作权限** ，columns_priv表用来对表的** 某一列设置权限** 。tables_priv表和 columns_priv表的结构分别如图：  
```plsql
desc mysql.tables_priv;
```
tables_priv表有8个字段，分别是Host、Db、User、Table_name、Grantor、Timestamp、Table_priv和 Column_priv，各个字段说明如下：  

- Host 、 Db 、 User 和 Table_name 四个字段分别表示主机名、数据库名、用户名和表名。  
- Grantor表示修改该记录的用户。 
- Timestamp表示修改该记录的时间。 
- Table_priv 表示对象的操作权限。包括Select、Insert、Update、Delete、Create、Drop、Grant、 References、Index和Alter。 
- Column_priv字段表示对表中的列的操作权限，包括Select、Insert、Update和References。  
```plsql
desc mysql.columns_priv;
```
## 3.4 procs_priv表  
procs_priv表可以对 存储过程和存储函数设置操作权限 ，表结构如图：  
```plsql
desc mysql.procs_priv;
```