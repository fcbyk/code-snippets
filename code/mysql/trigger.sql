-- 在实际开发中，我们经常会遇到这样的情况：有2个或者多个相互关联的表，如商品信息和库存信息分别存放在2个不同的数据表中，
-- 我们在添加一条新商品记录的时候，为了保证数据的完整性，必须同时 在库存表中添加一条库存记录。
-- 这样一来，我们就必须把这两个关联的操作步骤写到程序里面，而且要用事务包裹起来，确保这两个操作成为一个原子操作，
-- 要么全部执行，要么全部不执行。要是遇到特殊情况，可能还需要对数据进行手动维护，这样就很 容易忘记其中的一步 ，导致数据缺失。
-- 这个时候，咱们可以使用触发器。你可以创建一个触发器，让商品信息数据的插入操作自动触发库存数据的插入操作。
-- 这样一来，就不用担心因为忘记添加库存数据而导致的数据缺失了。

-- 触发器概述
-- 触发器是由 事件来触发 某个操作，这些事件包括 INSERT 、 UPDATE 、 DELETE 事件。
-- 所谓事件就是指用户的动作或者触发某项行为。如果定义了触发程序，当数据库执行这些语句时候，就相当于事件发生 了，就会 自动 激发触发器执行相应的操作。
-- 当对数据表中的数据执行插入、更新和删除操作，需要自动执行一些数据库逻辑时，可以使用触发器来实现。

-- 触发器的创建

-- 语法
CREATE TRIGGER 触发器名称
{BEFORE|AFTER} {INSERT|UPDATE|DELETE} ON 表名
FOR EACH ROW
触发器执行的语句块

-- ● 表名 ：表示触发器监控的对象。
-- ● BEFORE|AFTER ：表示触发的时间。BEFORE 表示在事件之前触发；AFTER 表示在事件之后触发。
-- ● INSERT|UPDATE|DELETE ：表示触发的事件。 
--   ○ INSERT 表示插入记录时触发；
--   ○ UPDATE 表示更新记录时触发；
--   ○ DELETE 表示删除记录时触发。
-- ● 触发器执行的语句块 ：可以是单条SQL语句，也可以是由BEGIN…END结构组成的复合语句块。

-- 例子
-- 创建数据表
CREATE TABLE test_trigger (
  id INT PRIMARY KEY AUTO_INCREMENT,
  t_note VARCHAR(30)
);
CREATE TABLE test_trigger_log (
  id INT PRIMARY KEY AUTO_INCREMENT,
  t_log VARCHAR(30)
);
-- 创建触发器：创建名称为before_insert的触发器，向test_trigger数据表插入数据之前，向 test_trigger_log数据表中插入before_insert的日志信息。
DELIMITER //
CREATE TRIGGER before_insert
BEFORE INSERT ON test_trigger
FOR EACH ROW
BEGIN
INSERT INTO test_trigger_log (t_log)
VALUES('before_insert');
END //
DELIMITER ;
-- 向test_trigger数据表中插入数据
INSERT INTO test_trigger (t_note) VALUES ('测试 BEFORE INSERT 触发器');
-- 查看test_trigger_log数据表中的数据
SELECT * FROM test_trigger_log;

-- 例子2
-- 定义触发器“salary_check_trigger”，基于员工表“employees”的INSERT事件，在INSERT之前检查 将要添加的新员工薪资是否大于他领导的薪资，
-- 如果大于领导薪资，则报sqlstate_value为'HY000'的错 误，从而使得添加失败。
DELIMITER //
CREATE TRIGGER salary_check_trigger
BEFORE INSERT ON employees FOR EACH ROW
BEGIN
DECLARE mgrsalary DOUBLE;
SELECT salary INTO mgrsalary FROM employees WHERE employee_id = NEW.manager_id;
IF NEW.salary > mgrsalary THEN
SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = '薪资高于领导薪资错误';
END IF;
END //
DELIMITER ;
-- 上面触发器声明过程中的NEW关键字代表INSERT添加语句的新记录。


-- 查看当前数据库的所有触发器的定义
SHOW TRIGGERS;

-- 查看当前数据库中某个触发器的定义
SHOW CREATE TRIGGER 触发器名;

-- 从系统库information_schema的TRIGGERS表中查询“salary_check_trigger”触发器的信息
SELECT * FROM information_schema.TRIGGERS;

-- 触发器也是数据库对象，删除触发器也用DROP语句，语法格式如下：
DROP TRIGGER IF EXISTS 触发器名称;