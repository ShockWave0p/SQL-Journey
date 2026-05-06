---CUSTOMER TABLE---
CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
	customer_name VARCHAR(50),
	city VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Aarav', 'Mumbai'),
(2, 'Meera', 'Pune'),
(3, 'Rahul', 'Delhi'),
(4, 'Priya', 'Bangalore'),
(5, 'Karan', 'Hyderabad'),
(6, 'Sneha', 'Mumbai'),
(7, 'Aditya', 'Chennai');

---ORDERS TABLE---

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	customer_id INT,
	product_name VARCHAR(50),
	category VARCHAR(50),
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

SELECT * FROM customers;

SELECT * FROM orders;

------------------------------------------------------
---Practice Problems---

-- Q1 Show all customers along with their orders.--

SELECT c.customer_id,c.customer_name,
	   o.order_id,o.product_name,o.amount,o.order_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Q2 Show customer_name and product_name for all orders.--

SELECT c.customer_name, o.product_name
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id;

-- Q3 Show all orders placed by customers from Mumbai.--

SELECT c.customer_name, c.city,
       o.order_id,o.product_name,o.amount,o.order_date
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
WHERE city = 'Mumbai';

-- Q4 Show total amount spent by each customer.--

SELECT c.customer_name,
	   SUM(o.amount) AS total_amount_spent
FROM orders o
LEFT JOIN customers c
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Q5 Show customers who have placed orders worth more than 10000.--

SELECT c.customer_name,
	   o.amount
FROM orders o
JOIN customers c
ON c.customer_id = o.customer_id
WHERE o.amount > 10000;

-- Q6 Show customers who have not placed any orders.

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
WHERE order_id IS NULL;

-- Q7 Show all customers and their orders, including customers with no orders.--

SELECT c.customer_name,
	   o.order_id, o.product_name, o.amount, o.order_date
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id;

-- Q8 Show total number of orders placed by each customer.--

SELECT c.customer_name,
       COUNT(o.order_id) AS no_of_orders
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

-- Q9 Show categories purchased by each customer.--

SELECT DISTINCT c.customer_name,
                o.category
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id;

-- Q10 Show the customer who spent the highest total amount.--

SELECT c.customer_name,
       SUM(o.amount) AS total_amt_spent
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY SUM(o.amount) DESC 
LIMIT 1;


-------------------------------------------------------------------
--- SCENARIOS QUESTIONS ---


-- S1
-- The business wants to identify top customers.
-- Return top 3 customers based on total spending.

SELECT c.customer_name,
       SUM(o.amount) AS total_amt_spent
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY SUM(o.amount) DESC 
LIMIT 3;


-- S2
-- Find customers who purchased Electronics products.

SELECT DISTINCT c.customer_name,
       o.category
FROM customers c
INNER JOIN orders o
ON o.customer_id = c.customer_id
WHERE o.category = 'Electronics';

-- S3
-- Identify customers who have never placed an order.

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
WHERE order_id IS NULL;

-- S4
-- The marketing team wants cities generating the highest revenue.
-- Return total revenue per city.

SELECT c.city,
       SUM(o.amount) AS city_revenue
FROM orders o
JOIN customers c
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY SUM(o.amount) DESC;

-- S5
-- Find customers who purchased more than 1 product.

SELECT c.customer_name,
       COUNT(DISTINCT o.product_name) AS no_of_product
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING COUNT(DISTINCT o.product_name) > 1;

-- S6
-- Identify the most popular product category based on number of orders.

SELECT category,
	   COUNT(order_id) AS no_of_orders
FROM orders
GROUP BY category
ORDER BY COUNT(order_id) DESC
LIMIT 1;

 -- S7
-- Find customers whose total spending is above average customer spending.
-- (Advanced - revisit after subqueries)

SELECT c.customer_name,
       SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING SUM(o.amount) > (
	SELECT AVG(spending) AS avg_spend
	FROM (
	SELECT c.customer_name,
		   SUM(o.amount) AS spending
	FROM customers c
	JOIN orders o
	ON o.customer_id = c.customer_id
	GROUP BY c.customer_name
	) AS customer_spending
);

-- S8
-- The business wants to identify inactive cities.
-- Find cities where no orders were placed.

SELECT c.city,
	   COUNT(o.order_id) AS no_of_orders
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.city
HAVING COUNT(o.order_id) = 0;

-- S9
-- Return customer-wise total spending and total number of orders.

SELECT c.customer_name,
	   SUM(o.amount) AS total_spending,
	   COUNT(o.order_id) AS no_of_orders
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

-- S10
-- Find the customer who placed the highest-value single order.

SELECT c.customer_name,
	   o.product_name,
	   o.order_date,
	   o.amount
FROM customers c
JOIN orders o
ON o.customer_id = c.customer_id
ORDER BY o.amount DESC
LIMIT 1;