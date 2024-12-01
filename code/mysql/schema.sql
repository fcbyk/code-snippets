-- schema也就是database
-- 在MySQL中，"schema" 和 "database" 这两个术语通常可以互换使用。
-- 在实际使用中，它们表示的都是数据库对象的集合。

-- 创建数据库,并指定字符集,如果存在hello数据库,则不创建
CREATE DATABASE IF NOT EXISTS hello CHARACTER SET utf8;

-- 查看当前所有的数据库
SHOW DATABASES; 
-- 查看当前正在使用的数据库
-- 使用的一个 mysql 中的全局函数
SELECT DATABASE(); 

-- 查看数据库的创建信息 
SHOW CREATE DATABASE hello;

-- 使用/切换数据库
USE hello;

-- 更改数据库字符集
ALTER DATABASE hello CHARACTER SET gbk;

-- 如果存在,删除指定的数据库
DROP DATABASE IF EXISTS hello;