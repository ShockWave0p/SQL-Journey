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
