---ONLINE_ORDERS TABLE---

CREATE TABLE online_orders (
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    amount NUMERIC(10,2)
);

INSERT INTO online_orders VALUES
(101, 'Aarav', 'Mumbai', 5000),
(102, 'Meera', 'Pune', 7000),
(103, 'Rahul', 'Delhi', 6000),
(104, 'Priya', 'Mumbai', 4000),
(105, 'Karan', 'Bangalore', 9000);

--- OFFLINE_ORDERS TABLE ---


CREATE TABLE offline_orders (
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    amount NUMERIC(10,2)
);

INSERT INTO offline_orders VALUES
(201, 'Sneha', 'Mumbai', 3000),
(202, 'Aditya', 'Delhi', 4500),
(203, 'Riya', 'Pune', 8000),
(204, 'Vikram', 'Chennai', 10000),
(205, 'Aarav', 'Mumbai', 5000);


SELECT * FROM online_orders;
SELECT * FROM offline_orders;

--- PROBLEMS ----

--- Q1 Return all customer names from both online and offline orders using UNION.---

SELECT customer_name FROM online_orders
UNION
SELECT customer_name FROM offline_orders;

--- Q2 Return all customer names including duplicates.---

SELECT customer_name FROM online_orders
UNION ALL
SELECT customer_name FROM offline_orders;

--- Q3 Return all unique cities from both tables.---

SELECT city FROM online_orders
UNION 
SELECT city FROM offline_orders;

--- Q4 Return cities common in both online and offline orders.---

SELECT city FROM online_orders
INTERSECT 
SELECT city FROM offline_orders;

--- Q5 Return cities present in online_orders but not in offline_orders.---

SELECT city FROM online_orders
EXCEPT
SELECT city FROM offline_orders;

-- Q6
-- Return all order amounts from both tables sorted in descending order.

SELECT amount FROM online_orders
UNION ALL
SELECT amount FROM offline_orders
ORDER BY amount DESC;

-- Q7
-- Return customer names who placed both online and offline orders.

SELECT customer_name FROM online_orders
INTERSECT
SELECT customer_name FROM offline_orders;

-- Q8
-- Return customer names who placed only online orders.

SELECT customer_name FROM online_orders
EXCEPT
SELECT customer_name FROM offline_orders;

-- Q9
-- Return customer names who placed only offline orders.

SELECT customer_name FROM offline_orders
EXCEPT
SELECT customer_name FROM online_orders;

/* Q10 Return all orders from both tables with an extra column
 showing order type ('Online' or 'Offline'). */

SELECT order_id,
       customer_name,
       city,
       amount,
       'Online' AS order_type
FROM online_orders
UNION ALL
SELECT order_id,
       customer_name,
       city,
       amount,
       'Offline' AS order_type
FROM offline_orders;


--- SCENARIOS PROBLEMS ---

-- S1 The business wants a unified customer list from both online and offline channels.--

SELECT customer_name FROM online_orders
UNION 
SELECT customer_name FROM offline_orders;

-- S2
-- Identify customers who use both online and offline purchasing channels.

SELECT customer_name FROM online_orders
INTERSECT
SELECT customer_name FROM offline_orders;

-- S3
-- Find cities where both online and offline sales exist.

SELECT city FROM online_orders
INTERSECT
SELECT city FROM offline_orders;

-- S4
-- Find cities where only online sales exist.

SELECT city FROM online_orders
EXCEPT
SELECT city FROM offline_orders;

-- S5
-- Return total revenue separately for online and offline channels.

SELECT 'Online' AS channel,
       SUM(amount) AS total_revenue
FROM online_orders
UNION ALL
SELECT 'Offline' AS channel,
       SUM(amount) AS total_revenue
FROM offline_orders;

-- S6
-- Identify the channel generating the highest average order amount.

SELECT 'Online' AS channel,
       AVG(amount) AS avg_order_amount
FROM online_orders
UNION ALL
SELECT 'Offline' AS channel,
       AVG(amount) AS avg_order_amount
FROM offline_orders
ORDER BY avg_order_amount DESC
LIMIT 1;

-- S7
-- Return all customers along with their purchase channel.

SELECT 'Online' AS channel,
		customer_name
FROM online_orders
UNION ALL
SELECT 'Offline' AS channel,
		customer_name
FROM offline_orders;

-- S8
-- Find customers who never placed offline orders.

SELECT customer_name FROM online_orders
EXCEPT 
SELECT customer_name FROM offline_orders;

-- S9
-- Combine all orders into a single report sorted by amount descending.

SELECT * FROM online_orders
UNION ALL
SELECT * FROM offline_orders
ORDER BY amount DESC;

-- S10
-- The company wants to identify duplicate customers appearing in both systems.

SELECT customer_name FROM online_orders
INTERSECT
SELECT customer_name FROM offline_orders;