# create database if not exists javaee;
# use javaee;

-- 创建用户表
create table if not exists tb_user(
    username varchar(50) primary key ,
    password varchar(50)
);

-- 创建学生表
create table if not exists student(
    sno int primary key,
    sname varchar(50),
    sex varchar(10)
);

-- 插入用户表数据
INSERT INTO tb_user (username, password) VALUES
('sjdljfld', 'dasdasf213'),
('user2', 'password2'),
('user3', 'password3');

-- 插入学生表数据
INSERT INTO student (sno, sname, sex) VALUES
(201215125, 'Alice', 'Female'),
(201213423, 'Bob', 'Male'),
(201214324, 'Charlie', 'Male');