---EMPLOYEE TABLE---

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary NUMERIC(10,2),
    experience_years INT,
    performance_score INT
);

INSERT INTO employees VALUES
(1, 'Aarav', 'Engineering', 'Mumbai', 95000, 6, 9),
(2, 'Meera', 'Engineering', 'Pune', 85000, 5, 8),
(3, 'Rahul', 'HR', 'Delhi', 60000, 3, 6),
(4, 'Priya', 'Finance', 'Mumbai', 75000, 4, 7),
(5, 'Karan', 'Engineering', 'Bangalore', 105000, 8, 10),
(6, 'Sneha', 'Finance', 'Pune', 65000, 2, 5),
(7, 'Aditya', 'HR', 'Delhi', 55000, 1, 4),
(8, 'Neha', 'Engineering', 'Chennai', 72000, 4, 7),
(9, 'Vikram', 'Sales', 'Mumbai', 50000, 2, 5),
(10, 'Riya', 'Sales', 'Hyderabad', 48000, 1, 4),
(11, 'Arjun', 'Engineering', 'Mumbai', 115000, 10, 10),
(12, 'Pooja', 'Finance', 'Delhi', 78000, 5, 8);
