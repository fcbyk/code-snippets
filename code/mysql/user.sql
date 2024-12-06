/* #region 0 */
-- 默认host是 %
CREATE USER zhang3 IDENTIFIED BY '123123'; 
CREATE USER 'kangshifu'@'localhost' IDENTIFIED BY '123456';

-- 更改用户名
UPDATE mysql.user SET USER='li4' WHERE USER='wang5';
FLUSH PRIVILEGES;

-- 默认删除host为%的用户
DROP USER li4 ; 
DROP USER 'kangshifu'@'localhost';
/* #endregion 0 */

/* #region 1 */
CREATE USER 'kangshifu'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;

ALTER USER 'kangshifu'@'localhost' PASSWORD EXPIRE NEVER;
ALTER USER 'kangshifu'@'localhost' PASSWORD EXPIRE DEFAULT;
ALTER USER 'kangshifu'@'localhost' PASSWORD HISTORY 5;
ALTER USER 'kangshifu'@'localhost' PASSWORD REUSE INTERVAL 365 DAY;
/* #endregion 1 */