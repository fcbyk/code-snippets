/* #region l */
CREATE TABLE table_name (
  非空约束 CHAR NOT NULL, 
  唯一约束 INT UNIQUE KEY,
  主键约束 INT PRIMARY KEY,
  默认约束 CHAR DEFAULT '默认值', 
  检查约束 INT CHECK (检查约束 > 0),
  自动递增 INT AUTO_INCREMENT
);
/* #endregion l */

/* #region t */
CREATE TABLE table_name (
  col1 INT,
  col2 INT,
  col3 CHAR(10),
  PRIMARY KEY (col1, col2),
  UNIQUE (col3),
  FOREIGN KEY (col2) REFERENCES another_table(another_column)
);
/* #endregion t */

/* #region alter */
ALTER TABLE table_name ADD PRIMARY KEY (col1, col2);
ALTER TABLE table_name ADD UNIQUE (col3);
ALTER TABLE table_name ALTER col3 SET DEFAULT '默认值';

-- 查看某个表已有的约束
SELECT * FROM information_schema.table_constraints
WHERE table_name = '表名称';
/* #endregion alter */

/* #region del */
ALTER TABLE table_name DROP PRIMARY KEY;
ALTER TABLE orders DROP FOREIGN KEY fk_customer_id;
/* #endregion del */
