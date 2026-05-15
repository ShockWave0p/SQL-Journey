---CUSTOMERS TABLE---

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(30),
    phone_number VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'aarav@gmail.com', 'Mumbai', '9876543210'),
(2, 'meera joshi', 'MEERA@YAHOO.COM', 'Pune', '9123456780'),
(3, 'Rahul Verma', 'rahul123@outlook.com', 'Delhi', '9988776655'),
(4, 'PRIYA SINGH', 'priya.singh@gmail.com', 'Mumbai', '9000011111'),
(5, 'Karan Mehta', 'karan@company.com', 'Bangalore', '9555566666'),
(6, 'Sneha Patil', 'SNEHA@GMAIL.COM', 'Pune', '9888899999'),
(7, 'Aditya Rao', 'aditya@yahoo.com', 'Chennai', '9777711111'),
(8, 'Neha Kapoor', 'neha.kapoor@gmail.com', 'Delhi', '9666622222'),
(9, 'vikram patel', 'vikram@outlook.com', 'Mumbai', '9555512345'),
(10, 'Riya Sharma', 'riya123@gmail.com', 'Hyderabad', '9444433333');

SELECT * FROM customers;

---PRACTICE PROBLEMS---

-- Q1
-- Convert all customer names to uppercase.

SELECT UPPER(customer_name)
FROM customers;

-- Q2
-- Convert all emails to lowercase.

SELECT LOWER(email)
FROM customers;

-- Q3
-- Capitalize customer names properly.

SELECT INITCAP(customer_name)
FROM customers;

-- Q4
-- Show length of each customer name.

SELECT LENGTH(customer_name)
FROM customers;

-- Q5
-- Extract first 5 characters of email.

SELECT 	SUBSTRING(email FROM 1 FOR 5)
FROM customers;

-- Q6
-- Extract last 4 digits of phone_number.

SELECT RIGHT(phone_number, 4)
FROM customers;

-- Q7
-- Concatenate customer name and city.

SELECT CONCAT(customer_name,'--',city)
FROM customers;

-- Q8
-- Replace 'gmail.com' with 'company.com' in emails.

SELECT REPLACE(email, 'gmail.com','company.com')
FROM customers;

-- Q9
-- Find customers whose email contains 'yahoo'.

SELECT customer_name,
       email
FROM customers
WHERE email ILIKE '%yahoo%';

-- Q10
-- Find position of '@' in each email.

SELECT POSITION('@' IN email)
FROM customers;


--- String Function Business Scenarios ---

-- S1
-- Standardize all customer names into proper capitalization format.

SELECT INITCAP(customer_name)
FROM customers;

-- S2
-- Create email usernames by extracting text before '@'.

SELECT SPLIT_PART(email,'@',1)
FROM customers;

-- S3
-- Identify customers using Gmail accounts.

SELECT customer_name
FROM customers
WHERE email ILIKE '%@gmail.com';

-- S4
-- Mask phone numbers:
-- show only last 4 digits.

SELECT RIGHT(phone_number,4)
FROM customers;

-- S5
-- Generate customer display labels:
-- customer_name - city.

SELECT CONCAT(customer_name,'--',city) AS customer_details
FROM customers;

-- S6
-- Find customers whose names contain 'sharma'.

SELECT customer_name
FROM customers
WHERE customer_name ILIKE '%sharma%';

-- S7
-- Replace all Yahoo domains with company domains.

WITH lower_mails AS (
	SELECT LOWER(email) AS lower_emails
	FROM customers
)
SELECT REPLACE(lower_emails,'yahoo.com','company.com')
FROM lower_mails;

-- S8
-- Identify customers with long names:
-- name length > 12 characters.

SELECT customer_name
FROM customers
WHERE LENGTH(customer_name) > 12;

-- S9
-- Extract first names from customer_name.

SELECT SPLIT_PART(customer_name,' ',1)
FROM customers;
	
-- S10
-- Create layered customer cleanup:
-- 1. proper capitalization
-- 2. lowercase emails
-- 3. masked phone numbers
-- 4. customer label generation

SELECT INITCAP(customer_name) AS customer_name,
	   LOWER(email) AS email,
	   RIGHT(phone_number,4) AS masked_phone,
	   CONCAT(INITCAP(customer_name),' - ',city) AS customer_details
FROM customers;
	   