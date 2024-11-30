/* 数据库系统概论，课本例子练习 */

# 定义一个学生-课程数据库 S_T
create database S_T;
use S_T;

# 学生-课程数据库包括以下三张表
# 学生表(学号，姓名，性别，年龄，所在系)
# 课程表(课程号，课程名，先修课，学分)
# 学生选课表(学号，课程号，成绩)
create table Student(
    Sno char(9) primary key,
    Sname char(20) unique,
    Sex char(2),
    Sage smallint,
    Sdep char(20)
);

create table Course(
    Cno char(9) primary key,
    Cname char(20),
    Cpno char(9),
    Ccredit int
);

create table SC(
    Sno char(9),
    Cno char(9),
    Grade smallint,
    Primary key(Sno,Cno)
);

# 往三张表中插入数据
insert into Student values
('201215121','李明','男',20,'CS'),
('201215122','刘晨','女',19,'CS'),
('201215123','王敏','女',18,'MA'),
('201215125','张立','男',19,'IS');

insert into Course values
('1','数据库','5',4),
('2','数学',null,2),
('3','信息系统','1',4),
('4','操作系统','6',5),
('5','数据结构','7',4),
('6','数据处理',null,2),
('7','PASCAL语言','6',4);

insert into SC values
('201215121','1',92),
('201215121','2',85),
('201215121','3',88),
('201215122','2',90),
('201215122','3',80);