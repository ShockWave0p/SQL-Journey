🔹 Customers Table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Aarav', 'Mumbai'),
(2, 'Meera', 'Pune'),
(3, 'Rahul', 'Delhi'),
(4, 'Priya', 'Bangalore'),
(5, 'Karan', 'Hyderabad'),
(6, 'Sneha', 'Mumbai'),
(7, 'Aditya', 'Chennai');

🔹 Orders Table

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    category VARCHAR(30),
    amount NUMERIC(10,2),
    order_date DATE
);

INSERT INTO orders VALUES
(101, 1, 'Laptop', 'Electronics', 55000, '2025-01-01'),
(102, 2, 'Chair', 'Furniture', 7000, '2025-01-02'),
(103, 1, 'Mouse', 'Accessories', 1200, '2025-01-03'),
(104, 3, 'Monitor', 'Electronics', 15000, '2025-01-04'),
(105, 5, 'Keyboard', 'Accessories', 2500, '2025-01-05'),
(106, 2, 'Table', 'Furniture', 9000, '2025-01-06'),
(107, 6, 'Phone', 'Electronics', 30000, '2025-01-07'),
(108, 1, 'USB Cable', 'Accessories', 800, '2025-01-08');
