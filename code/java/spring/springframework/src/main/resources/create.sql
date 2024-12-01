# 使用docker创建mysql容器
# docker pull mysql:latest
# docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 --name=mysql mysql:latest

create database spring_db character set utf8;
use spring_db;
create table tbl_account(
    id int primary key auto_increment,
    name varchar(35),
    money double
);

insert into tbl_account values (1,'张三',5000.00);