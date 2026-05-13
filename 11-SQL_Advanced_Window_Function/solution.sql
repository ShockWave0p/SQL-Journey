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

SELECT * FROM sales;

---PRACTICE PROBLEMS---

-- Q1
-- Show current sales_amount and previous sales_amount using LAG().

SELECT 	sale_id,
		sale_date,
		sales_amount AS current_sales_amount,
		LAG(sales_amount) OVER (
			ORDER BY sale_date
		) AS previous_sales_amount
FROM sales;

-- Q2
-- Show current sales_amount and next sales_amount using LEAD().

SELECT 	sale_id,
		sale_date,
		sales_amount AS current_sales_amount,
		LEAD(sales_amount) OVER (
			ORDER BY sale_date
		) AS next_sales_amount
FROM sales;

-- Q3
-- Calculate difference between current sale and previous sale.

WITH difference AS (
	SELECT 	sale_id,
			sale_date,
			sales_amount AS current_sales_amount,
			LAG(sales_amount) OVER (
				ORDER BY sale_date
			) AS previous_sales_amount
	FROM sales
)
SELECT sale_id,
	   sale_date,
	   current_sales_amount,
	   previous_sales_amount,
	   current_sales_amount - previous_sales_amount AS amount_difference
FROM difference;	   

-- Q4
-- Show highest sales_amount within each city using FIRST_VALUE().

SELECT DISTINCT city,
	   FIRST_VALUE(sales_amount) OVER (
			PARTITION BY city
			ORDER BY sales_amount DESC
	   ) AS high_value
FROM sales;

-- Q5
-- Show lowest sales_amount within each city using LAST_VALUE().

SELECT DISTINCT city,
	   LAST_VALUE(sales_amount) OVER (
			PARTITION BY city
			ORDER BY sales_amount DESC
			ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
	   ) AS low_value
FROM sales;

-- Q6
-- Divide sales into 4 quartiles using NTILE(4).

SELECT sale_id,
	   sale_date,
	   sales_amount,
	   NTILE(4) OVER (
			ORDER BY sales_amount
	   ) AS segments
FROM sales;

-- Q7
-- Calculate 3-day moving average of sales_amount.

SELECT 	sale_id,
		sale_date,
		AVG(sales_amount) OVER (
			ORDER BY sale_date
			ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
		) AS moving_avg
FROM sales;

-- Q8
-- Show cumulative sales_amount ordered by sale_date.

SELECT sale_id,
	   sales_amount,
	   SUM(sales_amount) OVER (
			ORDER BY sale_date
	   ) AS cumulative_sales_amount
FROM sales;

-- Q9
-- Find days where sales increased compared to previous day.

WITH previous_day AS (
	SELECT sale_id,
		   sale_date,
		   sales_amount AS current_sales,
		   LAG(sales_amount) OVER (
			ORDER BY sale_date
		   ) AS previous_sales
	FROM sales
)
SELECT sale_id,
	   sale_date,
	   current_sales,
	   previous_sales,
	   current_sales - previous_sales AS increased_amount
FROM previous_day
WHERE current_sales > previous_sales;
	   

-- Q10
-- Show difference between current sales and city average sales.

WITH city_sales AS (
	SELECT sale_id,
		   sale_date,
		   city,
		   sales_amount AS current_sales,
		   AVG(sales_amount) OVER (
				PARTITION BY city
		   ) AS city_avg
	FROM sales
)
SELECT sale_id,
	   sale_date,
	   city,
	   current_sales,
	   current_sales - city_avg AS amount_difference
FROM city_sales;

---SCENARIO PROBLEMS---

-- S1
-- Finance wants to identify sales growth trends.
-- Show current sale, previous sale, and growth amount for each day.

WITH sales AS (
	SELECT 	sale_id,
	   		sale_date,
	   		sales_amount AS current_sales,
	   		LAG(sales_amount) OVER (
				ORDER BY sale_date
	   		) AS previous_sales
	FROM sales
)
SELECT sale_id,
	   sale_date,
	   current_sales,
	   previous_sales,
	   current_sales - previous_sales AS growth_amount
FROM sales;

-- S2
-- Management wants to identify “sales crash days”.
-- Find days where sales dropped by more than 5000 compared to previous day.

WITH sales_trend AS (
    SELECT sale_id,
           sale_date,
           sales_amount AS current_sales,
           LAG(sales_amount) OVER (
               ORDER BY sale_date
           ) AS previous_sales
    FROM sales
)
SELECT sale_id,
       sale_date,
       current_sales,
       previous_sales,
       previous_sales - current_sales AS drop_amount
FROM sales_trend
WHERE (previous_sales - current_sales) > 5000;

-- S3
-- The analytics team wants rolling performance tracking.
-- Calculate 3-day moving average sales trend.

SELECT sale_id,
	   sale_date,
	   AVG(sales_amount) OVER (
			ORDER BY sale_date
			ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
	   ) AS moving_avg
FROM sales;

-- S4
-- Identify the best-performing city based on highest single-day sale.

SELECT DISTINCT city,
	   sale_id,
	   sale_date,
	   MAX(sales_amount) OVER (
			PARTITION BY city
	   ) AS city_sale
FROM sales;

-- S5
-- Marketing wants to segment sales into quartiles:
-- Premium / High / Medium / Low sales groups using NTILE().

WITH sales_bucket AS (
    SELECT sale_id,
           sale_date,
           sales_amount,
           NTILE(4) OVER (
               ORDER BY sales_amount DESC
           ) AS bucket
    FROM sales
)
SELECT sale_id,
       sale_date,
       sales_amount,
       CASE
           WHEN bucket = 1 THEN 'Premium'
           WHEN bucket = 2 THEN 'High'
           WHEN bucket = 3 THEN 'Medium'
           ELSE 'Low'
       END AS sales_group
FROM sales_bucket;

-- S6
-- Compare each sale against the city’s overall average sales.
-- Show whether the sale is Above Average or Below Average.

WITH city_average AS (
	SELECT 	city,
			sale_id ,
		   	sale_date,
			sales_amount,
			AVG(sales_amount) OVER (
				PARTITION BY city
			) AS avg_city_sales
	FROM sales
)
SELECT city,
	   sale_id,
	   sale_date,
	   sales_amount,
	   CASE
	   	   WHEN sales_amount > avg_city_sales THEN 'Above Average'
		   ELSE 'Below Average'
	   END AS segment
FROM city_average;
	   		

-- S7
-- Find days where sales continuously increased compared to the previous day.

WITH previous_sales AS (
	SELECT sale_id,
       	   sale_date,
	       sales_amount AS current_sales,
	       LAG(sales_amount) OVER (
				ORDER BY sale_date
	   	   ) AS previous_day_sales
	FROM sales
)
SELECT *
FROM previous_sales
WHERE current_sales > previous_day_sales;

-- S8
-- Identify cities where the lowest sale is below 8000.

WITH low_value AS (
	SELECT city,
		   sale_id,
		   sale_date,
		   LAST_VALUE(sales_amount) OVER (
				PARTITION BY city
				ORDER BY sale_date
				ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING 
		   ) AS low_sale
	FROM sales
)
SELECT *
FROM low_value
WHERE low_sale < 8000;

-- S9
-- Finance wants cumulative sales tracking.
-- Show running total sales ordered by sale_date.

SELECT sale_id,
       sale_date,
       sales_amount,
       SUM(sales_amount) OVER (
           ORDER BY sale_date
       ) AS cumulative_sales
FROM sales;


-- S10
-- Create layered sales trend analysis:
-- 1. previous day sales
-- 2. sales difference from previous day
-- 3. 3-day moving average
-- 4. sales performance label:
--    Above Trend / Below Trend

WITH sales_trend AS (
    SELECT sale_id,
           sale_date,
           city,
           sales_amount,

           LAG(sales_amount) OVER (
               ORDER BY sale_date
           ) AS previous_sale,

           sales_amount -
           LAG(sales_amount) OVER (
               ORDER BY sale_date
           ) AS sales_difference,

           AVG(sales_amount) OVER (
               ORDER BY sale_date
               ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
           ) AS moving_avg

    FROM sales
)
SELECT sale_id,
       sale_date,
       city,
       sales_amount,
       previous_sale,
       sales_difference,
       moving_avg,

       CASE
           WHEN sales_amount > moving_avg
                THEN 'Above Trend'
           ELSE 'Below Trend'
       END AS performance_label

FROM sales_trend;