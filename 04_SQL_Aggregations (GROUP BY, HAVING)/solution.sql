CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	customer_name VARCHAR(50),
	city VARCHAR(20),
	category VARCHAR(50),
	amount NUMERIC(10,2),
	quantity INT,
	order_date DATE
);

INSERT INTO orders VALUES
(1,'Aarav','Mumbai','Electronics',5000,1,'2025-01-01'),
(2,'Meera','Pune','Furniture',7000,2,'2025-01-02'),
(3,'Rahul','Delhi','Electronics',12000,1,'2025-01-03'),
(4,'Priya','Mumbai','Furniture',3000,1,'2025-01-04'),
(5,'Karan','Bangalore','Electronics',15000,2,'2025-01-05'),
(6,'Sneha','Pune','Accessories',2000,3,'2025-01-06'),
(7,'Aditya','Delhi','Furniture',8000,1,'2025-01-07'),
(8,'Neha','Mumbai','Accessories',1500,2,'2025-01-08'),
(9,'Vikram','Chennai','Electronics',20000,1,'2025-01-09'),
(10,'Riya','Bangalore','Furniture',9000,2,'2025-01-10'),
(11,'Arjun','Mumbai','Electronics',7000,1,'2025-01-11'),
(12,'Pooja','Delhi','Accessories',2500,2,'2025-01-12'),
(13,'Kabir','Mumbai','Electronics',11000,1,'2025-01-13'),
(14,'Isha','Pune','Furniture',6000,1,'2025-01-14'),
(15,'Manish','Chennai','Accessories',3500,2,'2025-01-15');

SELECT * FROM orders;

-- Section A: Core Practice
-- Q1 to Q10

-- Q1. Get total number of orders.--

SELECT COUNT(order_id) AS total_orders
FROM orders;

-- Q2. Get total revenue.--

SELECT SUM(amount) AS total_revenue
FROM orders;

-- Q3. Get average order amount.--

SELECT AVG(amount) AS avg_order_amount
FROM orders;

-- Q4. Get total revenue per city.--

SELECT city, SUM(amount) AS total_revenue
FROM orders
GROUP BY city;

-- Q5. Get total revenue per category.--

SELECT category, SUM(amount) AS total_revenue
FROM orders
GROUP BY category;

-- Q6. Get number of orders per city.--

SELECT city, COUNT(order_id) AS order_number
FROM orders
GROUP BY city;

-- Q7. Get cities where total revenue is greater than 15000.--

SELECT city, SUM(amount) AS total_revenue
FROM orders
GROUP BY city
HAVING SUM(amount) > 15000;

-- Q8. Get categories where average amount is greater than 8000.--

SELECT category, AVG(amount) AS avg_amount
FROM orders
GROUP BY category
HAVING AVG(amount) > 8000;
 
-- Q9. Get city and category wise total revenue.--

SELECT city, category, SUM(amount) AS total_amount
FROM orders
GROUP BY city, category;

-- Q10. Get cities having more than 2 orders AND total revenue greater than 10000.--

SELECT city, 
	   COUNT(order_id) AS total_orders, 
	   SUM(amount) AS total_revenue
FROM orders
GROUP BY city
HAVING COUNT(order_id) > 2
	   AND SUM(amount) > 10000;

-- Section B: Real-Life Scenarios
-- S1 to S10

-- S1:-
-- The business wants to know which cities are generating the highest revenue.
-- Return top 3 cities based on total revenue.

SELECT city, SUM(amount) AS total_amount
FROM orders
GROUP BY city
ORDER BY SUM(amount) DESC
LIMIT 3;

-- S2
-- Identify cities where total revenue is greater than 
-- the overall average revenue across all cities.

SELECT city,
       SUM(amount) AS total_revenue
FROM orders
GROUP BY city
HAVING SUM(amount) > (
    SELECT AVG(city_revenue)
    FROM (
        SELECT SUM(amount) AS city_revenue
        FROM orders
        GROUP BY city
    ) AS city_totals
);


-- S3
-- The company wants to target high-performing categories.
-- Find categories where total revenue exceeds 20000.

SELECT category, SUM(amount) AS total_revenue
FROM orders
GROUP BY category
HAVING SUM(amount) > 20000;

-- S4
-- Find cities where the number of orders is more than 2.
-- These cities will be considered for warehouse expansion.

SELECT city,
	   COUNT(order_id) AS number_of_orders
FROM orders
GROUP BY city
HAVING COUNT(order_id) > 2;

-- S5
-- Identify categories with average order amount greater than 8000.

SELECT category,
	   AVG(amount) AS avg_order_amount
FROM orders
GROUP BY category
HAVING AVG(amount) > 8000;

-- S6
-- Find the city which has generated the maximum revenue.

SELECT city,
	   SUM(amount) AS _total_revenue
FROM orders
GROUP BY city
ORDER BY SUM(amount) DESC
LIMIT 1;

-- S7 (Business Insight)
-- Find cities where revenue is high but number of orders is low (<= 2).
-- This indicates high-value orders.

SELECT city,
	   SUM(amount) AS total_revenue,
	   COUNT(order_id) AS number_of_order
FROM orders
GROUP BY city
HAVING COUNT(order_id) <= 2 AND SUM(amount) > 10000;

-- S8 (Comparison Logic)
-- Find categories whose total revenue is above the overall average category revenue.

SELECT category,
		SUM(amount) AS total_revenue
FROM orders
GROUP BY category
HAVING SUM(amount) > (
	SELECT AVG(total_revenue)
	FROM (
		SELECT SUM(amount) AS total_revenue
		FROM orders
		GROUP BY category
	)AS avg_category_revenue
);


-- S9 (Multi-level thinking)
-- For each city, find total revenue and only show cities where revenue is greater than 10000
-- and number of orders is at least 2.

SELECT city,
       SUM(amount) AS total_revenue,
	   COUNT(order_id) AS no_of_orders
FROM orders
GROUP BY city
HAVING SUM(amount) > 10000 AND COUNT(order_id) >= 2;

-- S10 (Advanced Thinking)
-- The company defines "strong markets" as:
-- cities where:
-- 1. total revenue > 15000
-- 2. average order value > 5000
-- 3. number of orders >= 2
-- Identify such cities.

SELECT city,
	   SUM(amount) AS total_revenue,
	   AVG(amount) AS order_value,
	   COUNT(order_id) AS no_of_orders
FROM orders
GROUP BY city
HAVING SUM(amount) > 15000 AND AVG(amount) > 5000 AND COUNT(order_id) >=2;