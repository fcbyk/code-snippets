-- 视图概述
-- ● 视图是一种 虚拟表 ，本身是不具有数据 的，占用很少的内存空间，它是 SQL 中的一个重要概念。
-- ● 视图建立在已有表的基础上, 视图赖以建立的这些表称为基表。
-- ● 视图的创建和删除只影响视图本身，不影响对应的基表。但是当对视图中的数据进行增加、删除和 修改操作时，数据表中的数据会相应地发生变化，反之亦然。
-- ● 视图提供数据内容的语句为 SELECT 语句, 可以将视图理解为存储起来的 SELECT 语句 
--   ○ 在数据库中，视图不会保存数据，数据真正保存在数据表中。当对视图中的数据进行增加、删 除和修改操作时，数据表中的数据会相应地发生变化；反之亦然。
-- ● 视图，是向用户提供基表数据的另一种表现形式。通常情况下，小型项目的数据库可以不使用视 图，但是在大型项目中，以及数据表比较复杂的情况下，视图的价值就凸显出来了，它可以帮助我 们把经常查询的结果集放到虚拟表中，提升使用效率。理解和使用起来都非常方便。


-- 创建视图
-- 单表视图,多表联合视图,基于视图创建视图
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

-- 查询视图
SELECT * FROM salvu80;

-- 查看视图
-- 语法1：查看数据库的表对象、视图对象
SHOW TABLES;
-- 语法2：查看视图的结构
DESC / DESCRIBE 视图名称;
-- 语法3：查看视图的属性信息
-- 查看视图信息（显示数据表的存储引擎、版本、数据行数和数据大小等）
SHOW TABLE STATUS LIKE '视图名称';
-- 执行结果显示，注释Comment为VIEW，说明该表为视图，其他的信息为NULL，说明这是一个虚表。 
-- 语法4：查看视图的详细定义信息
SHOW CREATE VIEW 视图名称;


-- 更新视图的数据
-- 1) 一般情况
-- MySQL支持使用INSERT、UPDATE和DELETE语句对视图中的数据进行插入、更新和删除操作。当视图中的 数据发生变化时，数据表中的数据也会发生变化，反之亦然。
-- 举例：UPDATE操作
UPDATE emp_tel SET tel = '13789091234' WHERE ename = '孙洪亮';
-- 举例：DELETE操作
 DELETE FROM emp_tel WHERE ename = '孙洪亮';


-- 修改视图
-- 方式1：使用CREATE OR REPLACE VIEW 子句修改视图
CREATE OR REPLACE VIEW empvu80
(id_number, name, sal, department_id)
AS
SELECT employee_id, first_name || ' ' || last_name, salary, department_id
FROM employees
WHERE department_id = 80;
-- 说明：CREATE VIEW 子句中各列的别名应和子查询中各列相对应。
-- 方式2：ALTER VIEW
-- 修改视图的语法是：
ALTER VIEW 视图名称
AS
查询语句

-- 删除视图
-- 删除视图只是删除视图的定义，并不会删除基表的数据
-- 说明：基于视图a、b创建了新的视图c，如果将视图a或者视图b删除，会导致视图c的查询失败。
-- 这样的视图c需要手动删除或修改，否则影响使用。
DROP VIEW IF EXISTS 视图名称;

