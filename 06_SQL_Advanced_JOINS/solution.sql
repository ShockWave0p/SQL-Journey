---EMPLOYEES TABLE---

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    manager_id INT,
    salary NUMERIC(10,2),
    city VARCHAR(30)
);

INSERT INTO employees VALUES
(1, 'Aarav', 'Engineering', NULL, 90000, 'Mumbai'),
(2, 'Meera', 'Engineering', 1, 70000, 'Pune'),
(3, 'Rahul', 'HR', 1, 60000, 'Delhi'),
(4, 'Priya', 'Finance', 2, 75000, 'Mumbai'),
(5, 'Karan', 'Engineering', 2, 80000, 'Bangalore'),
(6, 'Sneha', 'Finance', 4, 65000, 'Pune'),
(7, 'Aditya', 'HR', 3, 55000, 'Delhi'),
(8, 'Neha', 'Engineering', 5, 72000, 'Chennai'),
(9, 'Vikram', 'Sales', 1, 50000, 'Mumbai'),
(10, 'Riya', 'Sales', 9, 48000, 'Hyderabad');

---PROJECTS TABLE---

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT,
    project_budget NUMERIC(10,2)
);

INSERT INTO projects VALUES
(101, 'Data Warehouse', 1, 500000),
(102, 'ETL Pipeline', 2, 300000),
(103, 'HR Analytics', 3, 150000),
(104, 'Finance Dashboard', 4, 250000),
(105, 'Cloud Migration', 5, 400000),
(106, 'Sales Reporting', 9, 180000),
(107, 'Customer Insights', 8, 220000);

SELECT * FROM employees;
SELECT * FROM projects;

--- PROBLEMS ---

-- Q1 Show employee names along with their manager names.---
	
SELECT e.emp_name AS employee,
       m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

--- Q2 Show employees who do not have a manager.---

SELECT e.emp_name
FROM employees e
WHERE e.manager_id IS NULL;

-- Q3 Show employee name and project name.---

SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN projects p
ON p.emp_id = e.emp_id;

-- Q4 Show employees working on projects with budget greater than 200000.--

SELECT e.emp_name,
       p.project_name,
	   p.project_budget
FROM employees e
LEFT JOIN projects p
ON p.emp_id = e.emp_id
WHERE p.project_budget > 200000;

-- Q5 Show total project budget handled by each employee.--

SELECT e.emp_name,
	   SUM(p.project_budget) AS total_project_budget
FROM employees e
LEFT JOIN projects p
ON p.emp_id = e.emp_id
GROUP BY e.emp_name;

-- Q6 Show managers and the number of employees reporting to them.--

SELECT m.emp_name AS manager,
       COUNT(e.emp_id) AS no_of_employees
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name;

-- Q7 Show employees who belong to the same department.--

SELECT e.emp_name AS employee_1,
       m.emp_name AS employee_2,
       e.department
FROM employees e
JOIN employees m
ON e.department = m.department
AND e.emp_id <> m.emp_id;

-- Q8 Show employees whose salary is greater than their manager's salary.--

SELECT e.emp_name AS employee,
       e.salary AS employee_salary,
       m.emp_name AS manager,
       m.salary AS manager_salary
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- Q9 Show all possible employee-project combinations.--

SELECT *
FROM employees
CROSS JOIN projects;

-- Q10 Show department-wise total project budget.--

SELECT e.department,
       SUM(p.project_budget) AS total_budget
FROM employees e
JOIN projects p
ON p.emp_id = e.emp_id
GROUP BY e.department;


--- SCENARIOS PROBLEMS ---

-- S1
-- The company wants to identify managers with large teams.
-- Return managers having more than 2 employees reporting to them.

SELECT m.emp_name AS manager,
	   COUNT(e.emp_id) AS total_employees
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING COUNT(e.emp_id) > 2;

-- S2
-- Identify employees working on high-budget projects (> 300000).

SELECT e.emp_name AS employee,
	   p.project_budget
FROM employees e
JOIN projects p
ON e.emp_id = p.emp_id
WHERE p.project_budget > 300000;


-- S3
-- Find departments where total project budget exceeds 500000.

SELECT e.department,
	   SUM(p.project_budget) AS total_project_budget
FROM employees e
JOIN projects p
ON e.emp_id = p.emp_id
GROUP BY e.department
HAVING SUM(p.project_budget) > 500000;

-- S4
-- The HR team wants to identify employees earning more than their managers.

SELECT e.emp_name AS employees,
	   m.emp_name AS manager,
	   e.salary AS employee_salary,
	   m.salary AS manager_salary
FROM employees e
JOIN employees m
ON m.emp_id = e.manager_id
WHERE e.salary > m.salary;

-- S5
-- Find employees who are not assigned to any project.

SELECT e.emp_name,
	   p.project_id
FROM employees e
LEFT JOIN projects p
ON p.emp_id = e.emp_id
WHERE p.project_id IS NULL;

-- S6
-- Find managers whose team salary expense exceeds 150000.

SELECT m.emp_name AS manager,
       SUM(e.salary) AS team_salary_expense
FROM employees e
JOIN employees m
ON m.emp_id = e.manager_id
GROUP BY m.emp_name
HAVING SUM(e.salary) > 150000;

-- S7
-- Identify the department with the highest average salary.

SELECT department,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY AVG(salary) DESC
LIMIT 1;

-- S8
-- Find employees who share the same city with their managers.

SELECT e.emp_name AS employee,
	   e.city,
       m.emp_name AS manager,
	   m.city
FROM employees e
JOIN employees m
ON m.emp_id = e.manager_id
WHERE e.city = m.city;

-- S9
-- Return employee count and total salary department-wise.

SELECT department,
       COUNT(emp_id) AS total_employees,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- S10
-- The company defines "critical managers" as:
-- managers with:
-- 1. at least 2 employees
-- 2. total team salary > 120000
-- Identify such managers.

SELECT m.emp_name AS manager,
       COUNT(e.emp_id) AS total_employees,
       SUM(e.salary) AS team_salary_expense
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING COUNT(e.emp_id) >= 2
   AND SUM(e.salary) > 120000;

