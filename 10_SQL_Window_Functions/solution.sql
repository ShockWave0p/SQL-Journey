---EMPLOYEES TABLE---

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary NUMERIC(10,2),
    joining_date DATE
);

INSERT INTO employees VALUES
(1, 'Aarav', 'Engineering', 'Mumbai', 95000, '2021-01-10'),
(2, 'Meera', 'Engineering', 'Pune', 85000, '2021-03-15'),
(3, 'Rahul', 'HR', 'Delhi', 60000, '2020-07-20'),
(4, 'Priya', 'Finance', 'Mumbai', 75000, '2019-11-11'),
(5, 'Karan', 'Engineering', 'Bangalore', 85000, '2022-04-05'),
(6, 'Sneha', 'Finance', 'Pune', 65000, '2021-08-18'),
(7, 'Aditya', 'HR', 'Delhi', 60000, '2023-01-01'),
(8, 'Neha', 'Engineering', 'Chennai', 72000, '2020-05-25'),
(9, 'Vikram', 'Sales', 'Mumbai', 50000, '2022-09-14'),
(10, 'Riya', 'Sales', 'Hyderabad', 48000, '2023-02-12'),
(11, 'Arjun', 'Engineering', 'Mumbai', 105000, '2018-06-20'),
(12, 'Pooja', 'Finance', 'Delhi', 75000, '2020-10-05');

SELECT * FROM employees;

--- SQL PRACTICE QUESTION---

-- Q1
-- Assign row numbers to employees based on salary descending.

SELECT emp_name,
	   salary,
	   ROW_NUMBER() OVER (
			ORDER BY salary DESC
	   ) AS row_num
FROM employees;

-- Q2
-- Rank employees based on salary descending using RANK().

SELECT emp_name,
	   salary,
	   RANK() OVER (
			ORDER BY salary DESC
	   ) AS emp_ranking
FROM employees;

-- Q3
-- Rank employees using DENSE_RANK().

SELECT emp_name,
	   salary,
	   DENSE_RANK() OVER (
			ORDER BY salary DESC
	   ) AS emp_ranking
FROM employees;

-- Q4
-- Show department-wise average salary beside each employee.

SELECT 	emp_id,
		emp_name,
		department,
		AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employees;
		

-- Q5
-- Show department-wise highest salary employee.

WITH ranked_employees AS (
    SELECT emp_name,
           department,
           salary,
           RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
)
SELECT emp_name,
       department,
       salary
FROM ranked_employees
WHERE salary_rank = 1;

-- Q6
-- Calculate running total of salary ordered by joining_date.

SELECT emp_name,
	   department,
	   SUM(salary) OVER (ORDER BY joining_date) AS running_salary
FROM employees;


-- Q7
-- Show salary difference between employee salary and department average salary.

SELECT emp_name,
	   department,
	   salary AS emp_salary,
	   AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary,
	   salary - AVG(salary) OVER (PARTITION BY department) AS salary_diff
FROM employees;

-- Q8
-- Assign row numbers within each department based on salary descending.

SELECT emp_name,
	   department,
	   salary,
	   ROW_NUMBER () OVER (PARTITION BY department ORDER BY salary DESC)
FROM employees;	   

-- Q9
-- Find top 2 highest paid employees from each department.

WITH ranked_employees AS (
	SELECT emp_name,
	   	   department,
	   	   salary,
	   	   RANK() OVER (
			  PARTITION BY department 
			  ORDER BY salary DESC
		   ) AS salary_rank
	FROM employees
)
SELECT *
FROM ranked_employees
WHERE salary_rank <= 2;

-- Q10
-- Show cumulative salary expense department-wise ordered by salary descending.

SELECT emp_name,
       department,
       salary,
       SUM(salary) OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS cumulative_salary
FROM employees;


---PROBLEMS SCENARIOS---

-- S1
-- HR wants to rank employees based on salary company-wide.

WITH salary_rank AS (
	SELECT emp_name,
		   salary,
		   RANK() OVER (ORDER BY salary DESC)
	FROM employees
)
SELECT *
FROM salary_rank;

-- S2
-- Identify highest paid employee from each department.

WITH high_salary AS (
	SELECT emp_name,
		   department,
		   salary,
		   RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS high_rank
	FROM employees
)
SELECT *
FROM high_salary
WHERE high_rank = 1;

-- S3
-- Finance wants to compare employee salary
-- against department average salary.

SELECT emp_name,
       department,
       salary,
       AVG(salary) OVER (
           PARTITION BY department
       ) AS dept_avg_salary,
       salary - AVG(salary) OVER (
           PARTITION BY department
       ) AS salary_difference
FROM employees;

-- S4
-- Find top 2 highest earning employees per department.

WITH top_salary_emp AS (
	SELECT emp_name,
		   department,
		   salary,
		   RANK() OVER (
				PARTITION BY department
				ORDER BY salary DESC
		   ) AS emp_rank
	FROM employees
)
SELECT *
FROM top_salary_emp
WHERE emp_rank <=2;

-- S5
-- The company wants salary running totals
-- based on employee joining dates.

SELECT emp_name,
       joining_date,
       salary,
       SUM(salary) OVER (
           ORDER BY joining_date
       ) AS running_salary
FROM employees;

-- S6
-- Identify employees earning above department average salary.

WITH dept_avg_salary AS (
	SELECT emp_name,
		   salary AS emp_salary,
		   department,
		   AVG(salary) OVER (
				PARTITION BY department
		   ) AS avg_dept_salary
	FROM employees
)
SELECT *
FROM dept_avg_salary
WHERE emp_salary > avg_dept_salary;

-- S7
-- Rank cities based on total salary payout.

WITH city_salary AS (
    SELECT DISTINCT city,
           SUM(salary) OVER (
               PARTITION BY city
           ) AS total_city_salary
    FROM employees
)
SELECT city,
       total_city_salary,
       RANK() OVER (
           ORDER BY total_city_salary DESC
       ) AS city_rank
FROM city_salary;

-- S8
-- Find departments where the highest salary exceeds 90000.

WITH deptwise_salary AS (
    SELECT DISTINCT department,
           MAX(salary) OVER (
               PARTITION BY department
           ) AS highest_salary
    FROM employees
)
SELECT *
FROM deptwise_salary
WHERE highest_salary > 90000;

-- S9
-- Identify employees whose salary rank within department is 1.

WITH salary_rank AS (
		SELECT emp_name,
				department,
				salary,
				RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS emp_rank
		FROM employees
)
SELECT *
FROM salary_rank
WHERE emp_rank = 1;

-- S10
-- Create a layered analysis:
-- 1. calculate department-wise salary rank
-- 2. identify top 2 employees per department
-- 3. compare employee salary with department average

WITH deptwise_rank AS (
	SELECT emp_name,
		   department,
		   salary,
		   RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_ranking
	FROM employees
),
top_2_per_dept AS (
	SELECT *
	FROM deptwise_rank
	WHERE dept_ranking <=2
),
avg_dept_salary AS (
	SELECT 	department,
			AVG(salary) AS avg_salary
	FROM employees
	GROUP BY department
)
SELECT  t.emp_name,
		a.department,
		t.salary,
		t.dept_ranking,
		a.avg_salary
FROM top_2_per_dept t
JOIN avg_dept_salary a
ON t.department = a.department;