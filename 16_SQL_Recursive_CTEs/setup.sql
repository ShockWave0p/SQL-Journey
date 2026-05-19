--- EMPLOYEES TABLE (Hierarchy) ---

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    manager_id INT,
    salary NUMERIC(10,2),
    city VARCHAR(30)
);

INSERT INTO employees VALUES
(1,  'Arjun Mehta',    'Engineering',  NULL, 120000, 'Mumbai'),
(2,  'Sneha Iyer',     'Engineering',  1,     90000, 'Mumbai'),
(3,  'Rahul Verma',    'HR',           1,     75000, 'Delhi'),
(4,  'Priya Nair',     'Finance',      2,     80000, 'Pune'),
(5,  'Karan Patel',    'Engineering',  2,     85000, 'Bangalore'),
(6,  'Meera Joshi',    'Finance',      4,     65000, 'Pune'),
(7,  'Aditya Rao',     'HR',           3,     60000, 'Delhi'),
(8,  'Neha Kapoor',    'Engineering',  5,     72000, 'Chennai'),
(9,  'Vikram Singh',   'Sales',        1,     55000, 'Mumbai'),
(10, 'Riya Sharma',    'Sales',        9,     50000, 'Hyderabad'),
(11, 'Ankit Gupta',    'Engineering',  5,     70000, 'Bangalore'),
(12, 'Pooja Shah',     'Finance',      6,     58000, 'Pune');


--- CATEGORIES TABLE (Product Hierarchy) ---

CREATE TABLE categories (
    category_id   INT PRIMARY KEY,
    category_name VARCHAR(50),
    parent_id     INT
);

INSERT INTO categories VALUES
(1,  'All Products',   NULL),
(2,  'Electronics',    1),
(3,  'Furniture',      1),
(4,  'Accessories',    1),
(5,  'Laptops',        2),
(6,  'Monitors',       2),
(7,  'Headphones',     2),
(8,  'Office Chairs',  3),
(9,  'Desks',          3),
(10, 'Laptop Bags',    4),
(11, 'USB Cables',     4),
(12, 'Gaming Laptops', 5),
(13, 'Ultrabooks',     5);


SELECT * FROM employees;
SELECT * FROM categories;
