--- EMPLOYEES TABLE ---

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary NUMERIC(10,2),
    city VARCHAR(30),
    joining_date DATE
);

INSERT INTO employees VALUES
(1,  'Arjun Mehta',  'Engineering', 120000, 'Mumbai',    '2019-03-15'),
(2,  'Sneha Iyer',   'Engineering',  90000, 'Mumbai',    '2020-07-22'),
(3,  'Rahul Verma',  'HR',           75000, 'Delhi',     '2020-01-10'),
(4,  'Priya Nair',   'Finance',      80000, 'Pune',      '2018-11-05'),
(5,  'Karan Patel',  'Engineering',  85000, 'Bangalore', '2021-04-18'),
(6,  'Meera Joshi',  'Finance',      65000, 'Pune',      '2021-09-30'),
(7,  'Aditya Rao',   'HR',           60000, 'Delhi',     '2022-06-14'),
(8,  'Neha Kapoor',  'Engineering',  72000, 'Chennai',   '2020-03-25'),
(9,  'Vikram Singh', 'Sales',        55000, 'Mumbai',    '2022-11-01'),
(10, 'Riya Sharma',  'Sales',        50000, 'Hyderabad', '2023-02-17'),
(11, 'Ankit Gupta',  'Engineering',  95000, 'Bangalore', '2019-08-09'),
(12, 'Pooja Shah',   'Finance',      78000, 'Delhi',     '2020-12-20');


--- ORDERS TABLE ---

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    category VARCHAR(30),
    amount NUMERIC(10,2),
    order_date DATE,
    status VARCHAR(20)
);

INSERT INTO orders VALUES
(1,  'Aarav Shah',    'Mumbai',    'Electronics', 15000, '2024-01-05', 'Delivered'),
(2,  'Meera Iyer',   'Pune',      'Furniture',   22000, '2024-01-10', 'Delivered'),
(3,  'Rahul Verma',  'Delhi',     'Electronics',  9000, '2024-01-15', 'Pending'),
(4,  'Priya Nair',   'Mumbai',    'Accessories',  4500, '2024-01-20', 'Delivered'),
(5,  'Karan Patel',  'Bangalore', 'Electronics', 30000, '2024-02-01', 'Delivered'),
(6,  'Sneha Patil',  'Pune',      'Furniture',   12000, '2024-02-05', 'Cancelled'),
(7,  'Aditya Rao',   'Chennai',   'Electronics', 21000, '2024-02-10', 'Delivered'),
(8,  'Neha Kapoor',  'Delhi',     'Accessories',  7500, '2024-02-15', 'Pending'),
(9,  'Vikram Singh', 'Mumbai',    'Electronics', 25000, '2024-03-01', 'Delivered'),
(10, 'Riya Sharma',  'Hyderabad', 'Furniture',   11000, '2024-03-05', 'Delivered'),
(11, 'Arjun Mehta',  'Mumbai',    'Electronics', 18000, '2024-03-10', 'Pending'),
(12, 'Pooja Shah',   'Delhi',     'Accessories',  6000, '2024-03-15', 'Delivered'),
(13, 'Kabir Khan',   'Bangalore', 'Furniture',   14000, '2024-03-20', 'Delivered'),
(14, 'Isha Gupta',   'Chennai',   'Electronics', 32000, '2024-03-25', 'Delivered'),
(15, 'Manish Bhat',  'Delhi',     'Accessories',  3500, '2024-03-28', 'Cancelled');


SELECT * FROM employees;
SELECT * FROM orders;
