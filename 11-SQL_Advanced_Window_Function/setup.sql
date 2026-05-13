---SALES TABLE---

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    city VARCHAR(30),
    category VARCHAR(30),
    sales_amount NUMERIC(10,2)
);

INSERT INTO sales VALUES
(1,  '2024-01-01', 'Mumbai',     'Electronics', 12000),
(2,  '2024-01-02', 'Mumbai',     'Electronics', 15000),
(3,  '2024-01-03', 'Mumbai',     'Furniture',    8000),
(4,  '2024-01-04', 'Delhi',      'Electronics', 10000),
(5,  '2024-01-05', 'Delhi',      'Furniture',    9000),
(6,  '2024-01-06', 'Pune',       'Electronics', 17000),
(7,  '2024-01-07', 'Pune',       'Furniture',   11000),
(8,  '2024-01-08', 'Mumbai',     'Electronics', 20000),
(9,  '2024-01-09', 'Delhi',      'Furniture',    9500),
(10, '2024-01-10', 'Pune',       'Electronics', 21000),
(11, '2024-01-11', 'Mumbai',     'Furniture',    7000),
(12, '2024-01-12', 'Delhi',      'Electronics', 13000),
(13, '2024-01-13', 'Mumbai',     'Electronics', 18000),
(14, '2024-01-14', 'Pune',       'Furniture',    6500),
(15, '2024-01-15', 'Delhi',      'Electronics', 16000),
(16, '2024-01-16', 'Mumbai',     'Furniture',    9000),
(17, '2024-01-17', 'Pune',       'Electronics', 24000),
(18, '2024-01-18', 'Delhi',      'Furniture',   12000),
(19, '2024-01-19', 'Mumbai',     'Electronics', 22000),
(20, '2024-01-20', 'Pune',       'Furniture',    8000);
