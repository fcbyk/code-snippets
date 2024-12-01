-- 创建表
-- CREATE TABLE [IF NOT EXISTS] 表名(
--   字段1 数据类型 [约束条件] [默认值],
--   字段2 数据类型 [约束条件] [默认值],
--   ……
--   [表约束条件]
-- );

CREATE DATABASE hello;

-- 创建users 表
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    birthdate DATE
);

-- 查看数据表结构
SHOW CREATE TABLE users;

-- 插入数据
INSERT INTO users (username, email, birthdate) VALUES ('user1', 'user1@example.com', '2000-01-01');
INSERT INTO users (username, email, birthdate) VALUES ('user2', 'user2@example.com', '1995-05-15');
INSERT INTO users (username, email, birthdate) VALUES ('user3', 'user3@example.com', '1988-12-31');

-- 查看表
SELECT * FROM users;

-- 更新数据
-- 使用 UPDATE 语句更新数据。语法如下：
-- UPDATE table_name
-- SET column1=value1, column2=value2, ..., column=valuen
-- [WHERE condition]
-- 可以一次更新多条数据
-- 如果需要回滚数据，需要保证在DML前，进行设置：SET AUTOCOMMIT = FALSE; 
-- 使用 WHERE 子句指定需要更新的数据 
-- 如果省略 WHERE 子句，则表中的所有数据都将被更新
UPDATE users
SET username = 'new_user1', email = 'new_user1@example.com'
WHERE id = 1;

-- 删除数据
-- DELETE FROM table_name [WHERE <condition>];
-- table_name指定要执行删除操作的表；“[WHERE ]”为可选参数，指定删除条件，如果没有WHERE子句， DELETE语句将删除表中的所有记录
DELETE FROM users
WHERE id = 1;

-- 修改表
-- 修改表指的是修改数据库中已经存在的数据表的结构

-- ADD
-- 向已有的表中添加列
ALTER TABLE users
ADD age INT;

-- MODIFY
-- MODIFY 关键字用于修改列的数据类型或其他属性，但不会更改列的名称
-- 当使用 MODIFY 时，你只需要指定要修改的列名以及新的数据类型或其他属性
-- 如果你只想修改列的数据类型而不是名称，MODIFY 是一个很好的选择
ALTER TABLE users
MODIFY age VARCHAR(3);

-- CHANGE
-- CHANGE 关键字用于重命名列并且可以同时修改列的数据类型和其他属性
-- 当使用 CHANGE 时，你需要指定旧列名、新列名以及新的数据类型或其他属性
-- CHANGE 允许你在重命名列的同时对其进行其他修改
ALTER TABLE users
CHANGE email user_email VARCHAR(50);

-- DROP
-- 删除现有表中的列
ALTER TABLE users
DROP COLUMN user_email;

-- 更改表名
RENAME TABLE users
TO hello_users;

-- 删除表
-- 在MySQL中，当一张数据表 没有与其他任何数据表形成关联关系时，可以将当前数据表直接删除
-- 数据和结构都被删除
-- 所有正在运行的相关事务被提交
-- 所有相关索引被删除
DROP TABLE IF EXISTS hello_users;

-- 清空表
-- 删除表中所有的数据
-- 释放表的存储空间
TRUNCATE TABLE hello_users;

-- 计算列
-- MySQL8新特性
-- 什么叫计算列呢？简单来说就是某一列的值是通过别的列计算得来的。例如，a列值为1、b列值为2，c列 不需要手动插入，定义a+b的结果为c的值，那么c就是计算列，是通过别的列计算得来的。
-- 在MySQL 8.0中，CREATE TABLE 和 ALTER TABLE 中都支持增加计算列。下面以CREATE TABLE为例进行讲解。
-- 举例：定义数据表tb1，然后定义字段id、字段a、字段b和字段c，其中字段c为计算列，用于计算a+b的 值。 首先创建测试表tb1，语句如下：
CREATE TABLE tb1(
  id INT,
  a INT,
  b INT,
  c INT GENERATED ALWAYS AS (a + b) VIRTUAL
);
-- 测试
INSERT INTO tb1 (id,a,b) VALUES (1, 213, 23);