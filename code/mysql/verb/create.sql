-- 标识符
-- 标识符命名规则
-- 数据库名、表名不得超过30个字符，变量名限制为29个 
-- 必须只能包含 A–Z, a–z, 0–9, _共63个字符 
-- 数据库名、表名、字段名等对象名中间不要包含空格 
-- 同一个MySQL软件中，数据库不能同名；同一个库中，表不能重名；同一个表中，字段不能重名 
-- 必须保证你的字段没有和保留字、数据库系统或常用方法冲突。如果坚持使用，请在SQL语句中使 用`（着重号）引起来 
-- 保持字段名和类型的一致性：在命名字段并为其指定数据类型的时候一定要保证一致性，假如数据 类型在一个表里是整数，那在另一个表里可就别变成字符型了


-- 创建用户 
CREATE USER 用户名 [IDENTIFIED BY '密码'][,用户名 [IDENTIFIED BY '密码']];
-- 例子
CREATE USER zhang3 IDENTIFIED BY '123123'; -- 默认host是 %
CREATE USER 'kangshifu'@'localhost' IDENTIFIED BY '123456';

-- 创建数据库
CREATE DATABASE 数据库名;
-- 创建数据库并指定字符集 
CREATE DATABASE 数据库名 CHARACTER SET 字符集;
-- 判断数据库是否已经存在，不存在则创建数据库（ 推荐 ） 
CREATE DATABASE IF NOT EXISTS 数据库名;
-- DATABASE 不能改名。一些可视化工具可以改名，它是建新库，把所有表复制到新库，再删旧库完成的。


-- 创建表
-- 加上了IF NOT EXISTS关键字，则表示：如果当前数据库中不存在要创建的数据表，则创建数据表； 
-- 如果当前数据库中已经存在要创建的数据表，则忽略建表语句，不再创建数据表。
CREATE TABLE [IF NOT EXISTS] 表名(
  字段1 数据类型 [约束条件] [默认值],
  字段2 数据类型 [约束条件] [默认值],
  字段3 数据类型 [约束条件] [默认值],
  ……
  [表约束条件]
);
-- 例子
CREATE TABLE register(
    id VARCHAR(20) PRIMARY KEY,
    pw VARCHAR(20) NOT NULL,
    sort VARCHAR(10) CHECK(sort IN('student','staff','repairMan')) NOT NULL
);


-- 创建视图
-- 在 CREATE VIEW 语句中嵌入子查询
CREATE [OR REPLACE]
[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
VIEW 视图名称 [(字段列表)]
AS 查询语句
[WITH [CASCADED|LOCAL] CHECK OPTION]
-- 精简版
CREATE VIEW 视图名称
AS 查询语句
-- 创建单表视图
-- 方式一：
CREATE VIEW empvu80
AS
SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80;
-- 方式二：
CREATE VIEW empsalary8000(emp_id, NAME, monthly_sal) 
-- 小括号内字段个数与SELECT中字段个数相同
AS
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > 8000;
--  创建多表联合视图
CREATE VIEW empview
AS
SELECT employee_id emp_id,last_name NAME,department_name
FROM employees e,departments d
WHERE e.department_id = d.department_id;
-- 基于视图创建视图
CREATE VIEW emp_dept_ysalary
AS
SELECT emp_dept.ename,dname,year_salary
FROM emp_dept INNER JOIN emp_year_salary
ON emp_dept.ename = emp_year_salary.ename;


-- 创建存储过程
CREATE PROCEDURE 存储过程名(IN|OUT|INOUT 参数名 参数类型,...)
[characteristics ...]
BEGIN
存储过程体
END
-- 例子1
-- 创建存储过程select_all_data()，查看 emps 表的所有数据
DELIMITER $
CREATE PROCEDURE select_all_data()
BEGIN
SELECT * FROM emps;
END $
DELIMITER ;
-- 例子2
-- 创建存储过程avg_employee_salary()，返回所有员工的平均工资
DELIMITER //
CREATE PROCEDURE avg_employee_salary ()
BEGIN
SELECT AVG(salary) AS avg_salary FROM emps;
END //
DELIMITER ;


-- 创建触发器
CREATE TRIGGER 触发器名称
{BEFORE|AFTER} {INSERT|UPDATE|DELETE} ON 表名
FOR EACH ROW
触发器执行的语句块
-- 例子
-- 创建名称为before_insert的触发器，向test_trigger数据表插入数据之前，向 test_trigger_log数据表中插入before_insert的日志信息。
DELIMITER //
CREATE TRIGGER before_insert
BEFORE INSERT ON test_trigger
FOR EACH ROW
BEGIN
INSERT INTO test_trigger_log (t_log)
VALUES('before_insert');
END //
DELIMITER ;












