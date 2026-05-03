CREATE TABLE employees (
	emp_id INT,
	name VARCHAR(50),
	department VARCHAR(50),
	salary INT,
	age INT,
	city VARCHAR(50)
);

INSERT INTO employees (emp_id, name, department, salary, age, city) VALUES
(1, 'Amit', 'IT', 60000, 28, 'Mumbai'),
(2, 'Neha', 'HR', 45000, 32, 'Pune'),
(3, 'Raj', 'Finance', 70000, 35, 'Mumbai'),
(4, 'Simran', 'IT', 52000, 26, 'Delhi'),
(5, 'Karan', 'HR', 48000, 29, 'Bangalore'),
(6, 'Priya', 'Finance', 65000, 31, 'Mumbai'),
(7, 'Ankit', 'IT', 55000, 27, 'Pune'),
(8, 'Sneha', 'Marketing', 40000, 24, 'Delhi'),
(9, 'Vikas', 'Finance', 72000, 34, 'Bangalore'),
(10, 'Riya', 'HR', 47000, 30, 'Mumbai');

SELECT * FROM employees;

--- Q1: Get all columns for employees who work in 'IT' department. ---

SELECT *
FROM employees
WHERE department = 'IT';

-- Q2: Get name and salary of employees whose salary is greater than 50,000.--

SELECT name, salary
FROM employees
WHERE salary > 50000;

-- Q3: Get all employees from Mumbai.--

SELECT *
FROM employees
WHERE city = 'Mumbai';

-- Q4: Get employees whose age is less than 30.--

SELECT *
FROM employees
WHERE age < 30;

-- Q5: Get employees whose salary is not equal to 50000.--

SELECT *
FROM employees
WHERE salary != 50000;

-- Q6: Get employees from 'HR' department with salary greater than 45000.--

SELECT name, salary
FROM employees
WHERE department = 'HR' AND salary >45000;