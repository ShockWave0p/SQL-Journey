--- CUSTOMERS TABLE---

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE,
    membership VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'Mumbai', '2023-01-10', 'Gold'),
(2, 'Meera Iyer', 'Pune', '2022-11-14', 'Silver'),
(3, 'Rahul Verma', 'Delhi', '2023-03-02', 'Gold'),
(4, 'Priya Nair', 'Bangalore', '2021-08-19', 'Bronze'),
(5, 'Karan Patel', 'Hyderabad', '2022-05-21', 'Platinum'),
(6, 'Sneha Kapoor', 'Mumbai', '2023-06-07', 'Gold'),
(7, 'Aditya Rao', 'Chennai', '2022-09-30', 'Silver'),
(8, 'Neha Joshi', 'Delhi', '2023-02-18', 'Bronze'),
(9, 'Vikram Singh', 'Pune', '2021-12-11', 'Gold'),
(10, 'Riya Mehta', 'Mumbai', '2023-07-25', 'Silver'),
(11, 'Arjun Malhotra', 'Kolkata', '2024-01-05', 'Bronze'),
(12, 'Pooja Shah', 'Jaipur', '2024-02-16', 'Silver');



--- PRODUCTS TABLE---

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(60),
    category VARCHAR(30),
    list_price NUMERIC(10,2)
);

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mouse', 'Accessories', 1200),
(103, 'Office Chair', 'Furniture', 7000),
(104, 'Keyboard', 'Accessories', 2500),
(105, 'Monitor', 'Electronics', 15000),
(106, 'Notebook', 'Stationery', 250),
(107, 'Printer', 'Electronics', 18000),
(108, 'Desk Lamp', 'Furniture', 3200),
(109, 'Headphones', 'Electronics', 4500),
(110, 'Water Bottle', 'Accessories', 800);


--- ORDERS TABLE---

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    unit_price NUMERIC(10,2),
    discount NUMERIC(10,2),
    total_amount NUMERIC(10,2),
    channel VARCHAR(20)
);

INSERT INTO orders VALUES
(1001, 1, 101, '2024-01-10', 1, 55000, 2000, 53000, 'Online'),
(1002, 1, 102, '2024-01-15', 2, 1200, 100, 2300, 'Online'),
(1003, 2, 103, '2024-01-18', 1, 7000, 500, 6500, 'Offline'),
(1004, 2, 104, '2024-01-22', 2, 2500, 200, 4800, 'Online'),
(1005, 3, 105, '2024-02-01', 1, 15000, 0, 15000, 'Online'),
(1006, 3, 106, '2024-02-03', 10, 250, 0, 2500, 'Offline'),
(1007, 4, 108, '2024-02-10', 2, 3200, 300, 6100, 'Offline'),
(1008, 5, 107, '2024-02-12', 1, 18000, 1000, 17000, 'Online'),
(1009, 5, 101, '2024-02-16', 1, 55000, 5000, 50000, 'Offline'),
(1010, 6, 102, '2024-02-20', 3, 1200, 100, 3500, 'Online'),
(1011, 6, 109, '2024-02-22', 2, 4500, 200, 8800, 'Offline'),
(1012, 7, 110, '2024-03-01', 6, 800, 100, 4700, 'Online'),
(1013, 8, 104, '2024-03-05', 1, 2500, 0, 2500, 'Offline'),
(1014, 9, 103, '2024-03-08', 2, 7000, 700, 13300, 'Online'),
(1015, 9, 105, '2024-03-12', 1, 15000, 0, 15000, 'Offline'),
(1016, 10, 106, '2024-03-15', 15, 250, 0, 3750, 'Online'),
(1017, 1, 107, '2024-03-18', 1, 18000, 1500, 16500, 'Offline'),
(1018, 3, 102, '2024-03-20', 4, 1200, 100, 4700, 'Online'),
(1019, 5, 108, '2024-03-22', 1, 3200, 0, 3200, 'Online'),
(1020, 6, 101, '2024-03-25', 1, 55000, 3000, 52000, 'Online'),
(1021, 2, 110, '2024-03-27', 4, 800, 50, 3150, 'Offline'),
(1022, 4, 106, '2024-03-29', 20, 250, 0, 5000, 'Online');


SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;


---

-- Q1
-- Find orders whose total_amount is greater than the average total_amount of all orders.

SELECT order_id,
       customer_id,
       total_amount
FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
);

-- Q2
-- Find customers who have placed at least one order.

--- USING IN---
SELECT customer_id,
       customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);


---USING EXISTS

SELECT customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Q3
-- Find customers who have never placed any order.

SELECT customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Q4
-- Find products whose list_price is greater than the average list_price of all products.

SELECT product_name,
       list_price
FROM products
WHERE list_price > (
    SELECT AVG(list_price)
    FROM products
);

-- Q5
-- Find orders placed by customers from Mumbai.

SELECT *
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE city = 'Mumbai'
);

-- Q6
-- Find customers whose total spending is greater than 10000.

SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(total_amount) > 10000
);

-- Q7
-- Find products that have never been ordered.

SELECT p.product_id,
       p.product_name
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.product_id = p.product_id
);

-- Q8
-- Find orders where total_amount is greater than the average total_amount of that same customer.

SELECT o.order_id,
       o.customer_id,
       o.total_amount
FROM orders o
WHERE o.total_amount > (
    SELECT AVG(total_amount)
    FROM orders
    WHERE customer_id = o.customer_id
);

-- Q9
-- Find customers whose number of orders is greater than the average number of orders per customer.

SELECT customer_id,
       COUNT(order_id) AS no_of_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > (
    SELECT AVG(total_orders)
    FROM (
        SELECT COUNT(order_id) AS total_orders
        FROM orders
        GROUP BY customer_id
    ) t
);

-- Q10
-- Find customers whose total spending is greater than the highest single order amount in the table.

SELECT customer_id,
       SUM(total_amount) AS total_spending
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > (
    SELECT MAX(total_amount)
    FROM orders
);


--- Practice: Subquery Business Scenarios ---

---S1 The finance team wants orders that are above the company-wide average order value.---

SELECT order_id,
	   total_amount
FROM orders
WHERE total_amount > (
	SELECT AVG(total_amount)
	FROM orders
);

-- S2
-- Identify customers who are active buyers, meaning they have at least one order.

SELECT  customer_name,
		customer_id
FROM customers
WHERE customer_id IN (
	SELECT customer_id
	FROM orders 
);

-- S3
-- Find customers who have never converted into buyers.

SELECT customer_id,
	   customer_name
FROM customers c
WHERE NOT EXISTS (
	SELECT customer_id
	FROM orders o
	WHERE o.customer_id = c.customer_id
);

-- S4
-- The product team wants products priced above the average product price.

SELECT product_name,
	   list_price AS products_price
FROM products 
WHERE list_price > (
	SELECT AVG(list_price)
	FROM products
);

-- S5
-- Find customers from Mumbai who have placed orders.

SELECT customer_name,
       city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
)
AND city = 'Mumbai';

-- S6
-- Identify customers whose total spending is above 10000.

SELECT customer_name
FROM customers
WHERE customer_id IN (
	SELECT customer_id
	FROM orders
	GROUP BY customer_id
	HAVING SUM(total_amount) > 10000
);

-- S7
-- Find products that have not been sold yet.

SELECT product_id,
	   product_name
FROM products p
WHERE NOT EXISTS (
	SELECT product_id
	FROM orders o
	WHERE o.product_id = p.product_id
);

-- S8
-- Find orders that are higher than the average order amount of the customer who placed them.

SELECT o.order_id,
       o.customer_id,
       o.total_amount
FROM orders o
WHERE o.total_amount > (
    SELECT AVG(total_amount)
    FROM orders
    WHERE customer_id = o.customer_id
);

-- S9
-- The operations team wants customers who place more orders than the average customer.

SELECT 	customer_id,
		COUNT(order_id) AS no_of_orders
FROM orders 
GROUP BY customer_id
HAVING COUNT(order_id) > (
	SELECT AVG(total_orders)
	FROM (
		SELECT COUNT(order_id) AS total_orders
		FROM orders
		GROUP BY customer_id
	)t
);

-- S10
-- The business wants customers whose total lifetime spend is greater than the largest single order in the system

SELECT customer_id,
	   SUM(total_amount) AS total_spending
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > (
	SELECT MAX(total_amount)
	FROM orders
);