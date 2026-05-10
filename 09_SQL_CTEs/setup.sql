---🔹 Employees Table---

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


---🔹 Projects Table---

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
