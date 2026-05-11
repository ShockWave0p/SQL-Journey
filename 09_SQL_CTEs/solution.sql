---Employees Table---

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary NUMERIC(10,2),
    joining_date DATE
);

INSERT INTO employees VALUES
(1, 'Aarav', 'Engineering', 'Mumbai', 90000, '2021-01-10'),
(2, 'Meera', 'Engineering', 'Pune', 70000, '2021-03-15'),
(3, 'Rahul', 'HR', 'Delhi', 60000, '2020-07-20'),
(4, 'Priya', 'Finance', 'Mumbai', 75000, '2019-11-11'),
(5, 'Karan', 'Engineering', 'Bangalore', 80000, '2022-04-05'),
(6, 'Sneha', 'Finance', 'Pune', 65000, '2021-08-18'),
(7, 'Aditya', 'HR', 'Delhi', 55000, '2023-01-01'),
(8, 'Neha', 'Engineering', 'Chennai', 72000, '2020-05-25'),
(9, 'Vikram', 'Sales', 'Mumbai', 50000, '2022-09-14'),
(10, 'Riya', 'Sales', 'Hyderabad', 48000, '2023-02-12');


---Projects Table---

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    emp_id INT,
    project_name VARCHAR(50),
    project_budget NUMERIC(10,2)
);

INSERT INTO projects VALUES
(101, 1, 'Data Warehouse', 500000),
(102, 2, 'ETL Pipeline', 300000),
(103, 3, 'HR Analytics', 150000),
(104, 4, 'Finance Dashboard', 250000),
(105, 5, 'Cloud Migration', 400000),
(106, 6, 'Budget Forecasting', 180000),
(107, 8, 'Customer Insights', 220000),
(108, 9, 'Sales Reporting', 160000);

SELECT * FROM employees;
SELECT * FROM projects;

---SQL PRACTICE QUESTIONS---

-- Q1
-- Create a CTE to find employees with salary greater than 70000.

WITH high_salary AS (
	SELECT * 
	FROM employees 
	WHERE salary > 70000
)
SELECT *
FROM high_salary;

-- Q2
-- Create a CTE to calculate department-wise average salary.

WITH dept_wise_salary AS (
	SELECT department,
		   AVG(salary) AS avg_salary
	FROM employees
	GROUP BY department
)
SELECT *
FROM dept_wise_salary;

-- Q3
-- Using a CTE, find departments where average salary is greater than 65000.

WITH dept_wise_salary AS (
	SELECT department,
		   AVG(salary) AS avg_salary
	FROM employees
	GROUP BY department
	HAVING AVG(salary) > 65000
)
SELECT *
FROM dept_wise_salary;

-- Q4
-- Create a CTE to calculate total project budget handled by each employee.

WITH project_budget AS (
	SELECT emp_id,
		   SUM(project_budget) AS total_budget
	FROM projects 
	GROUP BY emp_id 
)
SELECT  e.emp_id,
	    e.emp_name,
		p.total_budget
FROM employees e
JOIN project_budget p
ON p.emp_id = e.emp_id;


-- Q5
-- Using a CTE, find employees handling project budget greater than 200000.

WITH high_budget AS (
    SELECT emp_id,
           project_budget
    FROM projects
    WHERE project_budget > 200000
)
SELECT e.emp_name,
       h.project_budget
FROM employees e
JOIN high_budget h
ON e.emp_id = h.emp_id;

-- Q6
-- Create a CTE to calculate total salary expense department-wise.

WITH salary_expense AS (
	SELECT	department, 
			SUM(salary) AS total_salary
	FROM employees
	GROUP BY department
)
SELECT *
FROM salary_expense;

/* Q7 Using multiple CTEs, find departments whose total salary expense is 
	above average department salary expense.*/

WITH salary_expense AS (
	SELECT department,
		   SUM(salary) AS total_salary
	FROM employees
	GROUP BY department
),
avg_expense AS (
	SELECT AVG(total_salary) AS avg_dept_expense
	FROM salary_expense
)
SELECT total_salary, department
FROM salary_expense
WHERE total_salary > (SELECT avg_dept_expense FROM avg_expense);

-- Q8
-- Create a CTE to calculate employee count per department.

WITH emp_count AS (
	SELECT department,
		   COUNT(emp_id) AS employee_count
	FROM employees
	GROUP BY department
)
SELECT *
FROM emp_count;

-- Q9
-- Using a CTE, find departments having more than 2 employees.

WITH emp_count AS (
	SELECT department,
		   COUNT(emp_id) AS employee_count
	FROM employees
	GROUP BY department
	HAVING COUNT(emp_id) > 2
)
SELECT *
FROM emp_count;

-- Q10
-- Using multiple CTEs, find the city with the highest total salary payout.

WITH city_salary AS (
    SELECT city,
           SUM(salary) AS total_salary
    FROM employees
    GROUP BY city
)
SELECT city,
       total_salary
FROM city_salary
ORDER BY total_salary DESC
LIMIT 1;


---SCENARIOS PROBLEMS---

-- S1
-- HR wants to identify departments where the average employee salary
-- is higher than the company-wide average salary.

WITH company_avg AS (
    SELECT AVG(salary) AS avg_company_salary
    FROM employees
),
dept_avg AS (
    SELECT department,
           AVG(salary) AS avg_dept_salary
    FROM employees
    GROUP BY department
)
SELECT department,
       avg_dept_salary
FROM dept_avg
WHERE avg_dept_salary > (
    SELECT avg_company_salary
    FROM company_avg
);


-- S2
-- The finance team wants to identify cities whose total salary payout
-- exceeds 150000.

WITH city_salary AS (
	SELECT 	city,
			SUM(salary) AS total_salary
	FROM employees
	GROUP BY city
)
SELECT city,
	   total_salary
FROM city_salary
WHERE total_salary > 150000;

-- S3
-- Management wants to identify employees who handle projects
-- with budgets higher than the average project budget.

WITH avg_project_budget AS (
    SELECT AVG(project_budget) AS avg_budget
    FROM projects
)
SELECT e.emp_name,
       p.project_name,
       p.project_budget
FROM employees e
JOIN projects p
ON p.emp_id = e.emp_id
WHERE p.project_budget > (
    SELECT avg_budget
    FROM avg_project_budget
);

-- S4
-- Find departments where total project budget is greater than
-- the average department project budget.

WITH dept_project_budget AS (
	SELECT e.department,
		   SUM(p.project_budget) AS dept_total_budget
	FROM employees e
	JOIN projects p
	ON p.emp_id = e.emp_id
	GROUP BY department
),
avg_dept_budget AS (
	SELECT AVG(dept_total_budget) AS avg_budget
	FROM dept_project_budget
)
SELECT department,
	   dept_total_budget
FROM dept_project_budget
WHERE dept_total_budget > (
	SELECT avg_budget
	FROM avg_dept_budget
);
-- S5
-- The company wants to identify “high investment employees”:
-- employees whose handled project budget exceeds 300000.

WITH project_budget_by_emp AS (
    SELECT emp_id,
           SUM(project_budget) AS total_budget
    FROM projects
    GROUP BY emp_id
)
SELECT e.emp_name,
       p.total_budget
FROM employees e
JOIN project_budget_by_emp p
ON p.emp_id = e.emp_id
WHERE p.total_budget > 300000;


-- S6
-- Find cities where the average employee salary is above
-- the overall average employee salary.

WITH city_emp_salary AS (
	SELECT city,
	       AVG(salary) AS avg_emp_salary
	FROM employees
	GROUP BY city
),
overall_avg_salary AS (
	SELECT AVG(salary) AS company_avg_salary
	FROM employees
)
SELECT city,
	   avg_emp_salary
FROM city_emp_salary
WHERE avg_emp_salary > (
	SELECT company_avg_salary
	FROM overall_avg_salary
);

-- S7
-- The operations team wants departments having:
-- 1. more than 2 employees
-- 2. total salary expense above 200000

WITH emp_count AS (
	SELECT department,
		   COUNT(emp_id) AS no_of_emp
	FROM employees
	GROUP BY department
),
dept_salary AS (
	SELECT department,
		   SUM(salary) AS dept_total_salary
	FROM employees
	GROUP BY department
)
SELECT ec.department,
	   ec.no_of_emp,
	   ds.dept_total_salary
FROM emp_count ec
JOIN dept_salary ds
ON ds.department = ec.department
WHERE ec.no_of_emp > 2 AND ds.dept_total_salary > 200000;

-- S8
-- Identify employees whose salary is above
-- their department’s average salary.

WITH deptwise_salary AS (
    SELECT department,
           AVG(salary) AS avg_dept_salary
    FROM employees
    GROUP BY department
)
SELECT e.emp_name,
       e.department,
       e.salary,
       d.avg_dept_salary
FROM employees e
JOIN deptwise_salary d
ON e.department = d.department
WHERE e.salary > d.avg_dept_salary;

-- S9
-- The company wants the department contributing
-- the highest total salary expense.

WITH deptwise_salary AS (
	SELECT department,
		   SUM(salary) AS dept_salary
	FROM employees
	GROUP BY department
),
total_expense AS (
	SELECT SUM(salary) AS total_expense
	FROM employees
)
SELECT department,
	   dept_salary
FROM deptwise_salary
ORDER BY dept_salary DESC
LIMIT 1;


-- S10
-- Create a layered analysis:
-- Step 1: calculate department-wise average salary
-- Step 2: identify departments with avg salary > 65000
-- Step 3: calculate employee count for those departments
-- Step 4: return only departments having employee count >= 2

WITH deptwise_avg_salary AS (
    SELECT department,
           AVG(salary) AS avg_dept_salary
    FROM employees
    GROUP BY department
),
high_salary_dept AS (
    SELECT department,
           avg_dept_salary
    FROM deptwise_avg_salary
    WHERE avg_dept_salary > 65000
),
emp_counts AS (
    SELECT department,
           COUNT(emp_id) AS no_of_emp
    FROM employees
    GROUP BY department
)
SELECT h.department,
       h.avg_dept_salary,
       e.no_of_emp
FROM high_salary_dept h
JOIN emp_counts e
ON h.department = e.department
WHERE e.no_of_emp >= 2;

