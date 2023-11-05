-- It will show the result for each rows

-- OVER() this will show result for each rows 
SELECT emp_no, department, salary, AVG(salary) OVER(), MIN(salary) OVER() FROM employees

-- PARITION BY
SELECT emp_no, department, salary, AVG(salary) OVER(PARTITION BY department), MIN(salary) OVER(PARTITION BY department) FROM employees


-- ORDER BY with OVER 
SELECT emp_no, department, salary, 
SUM(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS rolling_dept_salary,
SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

--RANK()
SELECT emp_no, department, salary,
RANK() OVER(ORDER BY salary DESC) FROM employees;

SELECT emp_no, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC),
RANK() OVER(ORDER BY salary DESC) FROM employees ORDER BY department;