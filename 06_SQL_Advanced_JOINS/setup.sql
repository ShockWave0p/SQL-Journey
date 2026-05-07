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

---PROJECT TABLE---

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
