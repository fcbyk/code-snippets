CREATE VIEW empvu80
AS
SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80;

CREATE VIEW empsalary8000(emp_id, NAME, monthly_sal) 
AS
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > 8000;

SELECT * FROM salvu80;
DROP VIEW IF EXISTS 视图名称;

