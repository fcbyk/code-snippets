-- 创建数据表
CREATE TABLE test_trigger (
  id INT PRIMARY KEY AUTO_INCREMENT,
  t_note VARCHAR(30)
);
CREATE TABLE test_trigger_log (
  id INT PRIMARY KEY AUTO_INCREMENT,
  t_log VARCHAR(30)
);

/* #region index */
DELIMITER //
CREATE TRIGGER before_insert
BEFORE INSERT ON test_trigger
FOR EACH ROW
BEGIN
INSERT INTO test_trigger_log (t_log)
VALUES('before_insert');
END //
DELIMITER ;

INSERT INTO test_trigger (t_note) VALUES ('测试 BEFORE INSERT 触发器');
SELECT * FROM test_trigger_log;

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

SHOW TRIGGERS;
SHOW CREATE TRIGGER 触发器名;
SELECT * FROM information_schema.TRIGGERS;
DROP TRIGGER IF EXISTS 触发器名称;
/* #endregion index */

