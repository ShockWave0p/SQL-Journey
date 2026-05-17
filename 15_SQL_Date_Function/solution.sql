CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    order_date DATE,
    delivery_date DATE,
    sales_amount NUMERIC(10,2)
);

INSERT INTO orders VALUES
(1, 'Aarav', 'Mumbai', '2025-01-05', '2025-01-08', 12000),
(2, 'Meera', 'Pune', '2025-01-10', '2025-01-14', 18000),
(3, 'Rahul', 'Delhi', '2025-02-01', '2025-02-06', 9000),
(4, 'Priya', 'Mumbai', '2025-02-12', '2025-02-15', 25000),
(5, 'Karan', 'Bangalore', '2025-03-03', '2025-03-08', 30000),
(6, 'Sneha', 'Pune', '2025-03-15', '2025-03-20', 15000),
(7, 'Aditya', 'Chennai', '2025-04-01', '2025-04-05', 21000),
(8, 'Neha', 'Delhi', '2025-04-18', '2025-04-23', 17000),
(9, 'Vikram', 'Mumbai', '2025-05-10', '2025-05-15', 26000),
(10, 'Riya', 'Hyderabad', '2025-05-20', '2025-05-25', 11000);

SELECT * FROM orders;

--- PRACTICE PROBLEMS---

-- Q1
-- Show current date.

SELECT CURRENT_DATE;

-- Q2
-- Extract year from order_date.

SELECT EXTRACT(YEAR FROM order_date)
FROM orders;

-- Q3
-- Extract month from order_date.

SELECT EXTRACT(MONTH FROM order_date)
FROM orders;

-- Q4
-- Extract day from order_date.

SELECT EXTRACT(DAY FROM order_date)
FROM orders;

-- Q5
-- Calculate delivery duration in days.

SELECT delivery_date - order_date  AS delivery_duration
FROM orders;

-- Q6
-- Show orders grouped by month using DATE_TRUNC().

SELECT DATE_TRUNC('month', order_date) AS order_month,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY order_month;

-- Q7
-- Add 7 days to order_date.

SELECT order_date + INTERVAL '7 days'
FROM orders;

-- Q8
-- Find orders placed in February.

WITH feb_month AS (
	SELECT order_id,
		   EXTRACT(MONTH FROM order_date) AS extract_month
	FROM orders
)
SELECT *
FROM feb_month
WHERE extract_month = 2;

-- Q9
-- Calculate total sales_amount month-wise.

WITH extract_month AS (
	SELECT 	sales_amount,
			EXTRACT(MONTH FROM order_date) AS all_month
	FROM orders 
)
SELECT 	all_month,
	    SUM(sales_amount) AS total_sales
FROM extract_month
GROUP BY all_month
ORDER BY all_month;

-- Q10
-- Show month and average sales_amount.


WITH extract_month AS (
	SELECT 	sales_amount,
			EXTRACT(MONTH FROM order_date) AS all_month
	FROM orders 
)
SELECT 	all_month,
	    AVG(sales_amount) AS total_sales
FROM extract_month
GROUP BY all_month
ORDER BY all_month;


--- SQL Date Function Business Scenarios ---

-- S1
-- Management wants monthly sales reporting.

WITH extract_month AS (
	SELECT 	sales_amount,
			EXTRACT(MONTH FROM order_date) AS all_month
	FROM orders 
)
SELECT 	all_month,
	    SUM(sales_amount) AS total_sales
FROM extract_month
GROUP BY all_month
ORDER BY all_month;

-- S2
-- Identify orders with delivery delays > 4 days.

WITH delivery_days AS (
	SELECT order_id,
		   delivery_date - order_date AS delivery_period
	FROM orders
)
SELECT order_id,
	   delivery_period
FROM delivery_days
WHERE delivery_period > 4;

-- S3
-- Finance wants quarterly-style monthly grouping.

SELECT DATE_TRUNC('month', order_date) AS month_grp,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY month_grp
ORDER BY month_grp;

-- S4
-- Find customers who ordered in May.

SELECT customer_name
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 5;

-- S5
-- Calculate average delivery time city-wise.

SELECT city,
	   AVG(delivery_date - order_date) AS avg_delivery_time
FROM orders
GROUP BY city;

-- S6
-- Identify highest sales month.

WITH extract_month AS (
    SELECT sales_amount,
           EXTRACT(MONTH FROM order_date) AS all_month
    FROM orders
)
SELECT all_month,
       SUM(sales_amount) AS total_sales
FROM extract_month
GROUP BY all_month
ORDER BY total_sales DESC
LIMIT 1;

-- S7
-- Generate delivery expected dates:
-- order_date + 7 days.

SELECT order_id,
	   order_date + INTERVAL '7 Days' AS expected_dates
FROM orders;

-- S8
-- Compare monthly sales against average monthly sales.

WITH monthly_sales AS (
    SELECT EXTRACT(MONTH FROM order_date) AS month_no,
           SUM(sales_amount) AS monthly_sales
    FROM orders
    GROUP BY month_no
),

overall_avg AS (
    SELECT AVG(monthly_sales) AS avg_monthly_sales
    FROM monthly_sales
)

SELECT m.month_no,
       m.monthly_sales,
       o.avg_monthly_sales
FROM monthly_sales m
CROSS JOIN overall_avg o
ORDER BY m.month_no;

-- S9
-- Identify cities with fastest average delivery times.

WITH city_delivery AS (
    SELECT city,
           AVG(delivery_date - order_date) AS avg_delivery_time
    FROM orders
    GROUP BY city
)
SELECT *
FROM city_delivery
ORDER BY avg_delivery_time
LIMIT 1;

-- S10
-- Create layered time-based sales analysis:
-- 1. month-wise sales
-- 2. average monthly sales
-- 3. delivery duration
-- 4. sales performance label

WITH monthly_sales AS (
    SELECT
        EXTRACT(MONTH FROM order_date) AS month_no,

        SUM(sales_amount) AS total_monthly_sales,

        AVG(delivery_date - order_date) AS avg_delivery_duration

    FROM orders
    GROUP BY month_no
),

overall_avg AS (
    SELECT AVG(total_monthly_sales) AS avg_monthly_sales
    FROM monthly_sales
)

SELECT
    m.month_no,
    m.total_monthly_sales,
    o.avg_monthly_sales,
    m.avg_delivery_duration,

    CASE
        WHEN m.total_monthly_sales > o.avg_monthly_sales
        THEN 'Above Average'
        ELSE 'Below Average'
    END AS performance_label

FROM monthly_sales m
CROSS JOIN overall_avg o
ORDER BY m.month_no;
