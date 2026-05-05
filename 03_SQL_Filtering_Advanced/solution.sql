CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
	name VARCHAR(50),
	city VARCHAR(50),
	age INT,
	gender VARCHAR(10),
	signup_date DATE,
	total_spent NUMERIC(10,2),
	membership VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Aarav', 'Mumbai', 25, 'Male', '2023-01-10', 12000, 'Gold'),
(2, 'Meera', 'Pune', 30, 'Female', '2022-05-12', 8000, 'Silver'),
(3, 'Rahul', 'Delhi', 35, 'Male', '2021-07-20', 15000, 'Gold'),
(4, 'Priya', 'Mumbai', 28, 'Female', '2023-03-15', 5000, 'Bronze'),
(5, 'Karan', 'Bangalore', 40, 'Male', '2020-11-01', 20000, 'Platinum'),
(6, 'Sneha', 'Pune', 22, 'Female', '2023-06-18', 3000, 'Bronze'),
(7, 'Aditya', 'Delhi', 31, 'Male', '2022-09-25', 11000, 'Silver'),
(8, 'Neha', 'Mumbai', 27, 'Female', '2023-08-05', 7000, 'Silver'),
(9, 'Vikram', 'Chennai', 45, 'Male', '2019-12-12', 25000, 'Platinum'),
(10, 'Riya', 'Bangalore', 29, 'Female', '2022-02-02', 9000, 'Gold'),
(11, 'Arjun', 'Hyderabad', NULL, 'Male', '2023-01-01', 6000, 'Silver'),
(12, 'Pooja', 'Delhi', 26, NULL, '2023-04-10', 4000, 'Bronze'),
(13, 'Kabir', 'Mumbai', 38, 'Male', '2021-10-30', 18000, 'Gold'),
(14, 'Isha', 'Pune', 24, 'Female', '2023-07-07', 3500, 'Bronze'),
(15, 'Manish', 'Chennai', 33, 'Male', '2022-06-14', 13000, 'Gold');

SELECT * FROM customers;

--PRACTICE QUESTIONS--

-- Q1. Get customers whose age is between 25 and 35.--

SELECT customer_id, name, age
FROM customers
WHERE age BETWEEN 25 AND 35;

-- Q2. Get customers from Mumbai or Pune.--

SELECT customer_id, name, city
FROM customers
WHERE city IN('Mumbai', 'Pune');

-- Q3. Get customers whose name starts with 'A'.--

SELECT *
FROM customers
WHERE name LIKE 'A%';

-- Q4. Get customers whose name contains 'ar'.--

SELECT *
FROM customers
WHERE name LIKE '%ar%';

-- Q5. Get customers whose membership is NOT 'Gold'.--

SELECT *
FROM customers
WHERE membership != 'Gold';

-- Q6. Get customers who are from Delhi AND have total_spent greater than 10000.--

SELECT *
FROM customers
WHERE city = 'Delhi' AND total_spent > 10000;

-- Q7 Get customers from Mumbai or Pune AND age greater than 25.--

SELECT *
FROM customers
WHERE (city IN ('Mumbai', 'Pune')) AND age > 25;

-- Q8. Get customers who are from Mumbai OR Pune AND have total_spent > 10000.--

SELECT *
FROM customers
WHERE (city = 'Mumbai' OR city = 'Pune') AND total_spent > 10000;

--Q9. Get customers where age is NULL OR gender is NULL.--

SELECT *
FROM customers
WHERE age IS NULL OR gender IS NULL;

/* Q10 Get customers: 
	whose name starts with 'A' OR 'M'
	AND city is Mumbai or Delhi
	AND total_spent between 5000 and 15000
*/

SELECT * 
FROM customers
WHERE (name LIKE 'A%' OR name LIKE 'M%') AND (city = 'Mumbai' OR city = 'Delhi') 
	  AND total_spent BETWEEN 5000 AND 15000; 