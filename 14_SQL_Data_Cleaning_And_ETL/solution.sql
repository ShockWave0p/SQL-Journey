CREATE TABLE raw_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(120),
    city VARCHAR(50),
    phone_number VARCHAR(30)
);

INSERT INTO raw_customers VALUES
(1, '  aarav sharma ', 'AARAV@GMAIL.COM', 'mumbai', '98765-43210'),
(2, 'MEERA   JOSHI', 'meera@yahoo.com ', 'PUNE', '(91)9123456780'),
(3, 'rahul verma', 'rahul123@outlook', ' delhi ', '99887 76655'),
(4, 'PRIYA SINGH', 'priya.singh@gmail.com', 'Mumbai', '90000-11111'),
(5, 'Karan@Mehta', 'karan.company.com', 'bangalore', '95555abc666'),
(6, 'Sneha   Patil', 'SNEHA@GMAIL.COM', ' pune', '98888-99999'),
(7, 'Aditya Rao', NULL, 'CHENNAI', '9777711111'),
(8, 'Neha Kapoor', 'neha.kapoor@gmail.com', 'Delhi', '96666 22222'),
(9, 'vikram   patel', 'vikram@@outlook.com', 'MUMBAI ', '9555512345'),
(10, ' Riya Sharma ', 'riya123@gmail.com', NULL, '94444-33333');

SELECT * FROM raw_customers;

---PRACTICE PROBLEMS---

-- Q1
-- Remove leading/trailing spaces from customer names.

SELECT TRIM(customer_name) AS Customers
FROM raw_customers;

-- Q2
-- Convert all emails to lowercase.

SELECT LOWER(email)
FROM raw_customers;

-- Q3
-- Standardize cities into proper capitalization.

SELECT INITCAP(TRIM(city)) AS standardize_city
FROM raw_customers;

-- Q4
-- Replace dashes '-' in phone numbers.

SELECT REPLACE(phone_number,'-','')
FROM raw_customers;

-- Q5
-- Identify customers whose emails do not contain '@'.

SELECT customer_name,
       email
FROM raw_customers
WHERE POSITION('@' IN email) = 0;

-- Q6
-- Identify customers having double '@' in emails.

SELECT 	customer_name,
		email
FROM raw_customers
WHERE email ILIKE('%@@%');

-- Q7
-- Replace NULL cities with 'Unknown'.

SELECT COALESCE(city,'Unknown')
FROM raw_customers;

-- Q8
-- Remove spaces inside phone numbers.

WITH cleaning AS (
	SELECT TRIM(phone_number) AS trim_numbers
	FROM raw_customers
)
SELECT REPLACE(trim_numbers,' ','')
FROM cleaning;

-- Q9
-- Create cleaned customer labels:
-- Proper Name - Proper City

WITH cleaning AS (
	SELECT TRIM(INITCAP(customer_name)) AS clean_name,
		   TRIM(INITCAP(city)) AS clean_city
	FROM raw_customers	
)
SELECT CONCAT(clean_name,'-',clean_city) AS Clean_Customers
FROM cleaning;

-- Q10
-- Create fully cleaned customer output:
-- 1. trimmed names
-- 2. lowercase emails
-- 3. cleaned phone numbers
-- 4. standardized cities

SELECT TRIM(customer_name) AS clean_name,
	   LOWER(email) AS clean_email,
	   REPLACE(phone_number,'-','') AS clean_phone_number,
	   INITCAP(TRIM(city)) AS clean_city
FROM raw_customers;


--- SQL Data Cleaning & ETL Scenarios ---

-- S1
-- Standardize all customer names into proper business format.

WITH space_remove AS (
	SELECT INITCAP(TRIM(customer_name)) AS new_name
	FROM raw_customers
),
new_format AS (
SELECT REPLACE(new_name,'  ',' ') AS Proper_name
FROM space_remove
)
SELECT REPLACE(Proper_name,'@',' ') AS Cleaned_name
FROM new_format;

-- S2
-- Identify invalid emails:
-- missing '@' OR missing '.com'.

SELECT customer_name,
       email
FROM raw_customers
WHERE email IS NULL
   OR POSITION('@' IN email) = 0
   OR POSITION('.com' IN email) = 0;


-- S3
-- Detect suspicious emails containing multiple '@'.

SELECT 	customer_name,
		email
FROM raw_customers
WHERE email ILIKE('%@@%');

-- S4
-- Generate cleaned phone numbers:
-- remove spaces, dashes, and brackets.

SELECT REPLACE(
           REPLACE(
               REPLACE(
                   REPLACE(phone_number, '-', ''),
               ' ', ''),
           '(91)', ''),
       ')', '') AS cleaned_phone
FROM raw_customers;

-- S5
-- Create customer contact cards:
-- Proper Name | lowercase email | cleaned phone.

WITH cleaned_data AS (
    SELECT
        REPLACE(
            INITCAP(TRIM(customer_name)),
            '@',
            ' '
        ) AS clean_name,

        LOWER(TRIM(email)) AS clean_email,

        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(phone_number, '-', ''),
                ' ', ''),
            '(91)', ''),
        ')', '') AS clean_phone

    FROM raw_customers
)
SELECT CONCAT(
           clean_name,
           ' | ',
           clean_email,
           ' | ',
           clean_phone
       ) AS customer_contact_card
FROM cleaned_data;

-- S6
-- Replace missing cities with 'Unknown'
-- and standardize all city names.

SELECT INITCAP(TRIM(COALESCE(city,'Unknown')))
FROM raw_customers;

-- S7
-- Identify customers with potentially invalid phone numbers:
-- length after cleanup < 10.

WITH cleaned_phones AS (
    SELECT customer_name,

           REPLACE(
               REPLACE(
                   REPLACE(
                       REPLACE(phone_number, '-', ''),
                   ' ', ''),
               '(91)', ''),
           ')', '') AS clean_phone

    FROM raw_customers
)
SELECT *
FROM cleaned_phones
WHERE LENGTH(clean_phone) < 10;


-- S8
-- Create email usernames from cleaned emails.

WITH cleaned_mails AS (
	SELECT TRIM(LOWER(email)) AS clean1
	FROM raw_customers
)
SELECT SPLIT_PART(clean1,'@',1) AS username
FROM cleaned_mails;

-- S9
-- Generate layered cleanup pipeline:
-- 1. cleaned names
-- 2. cleaned cities
-- 3. cleaned phones
-- 4. cleaned emails


WITH cleaned_data AS (
    SELECT
        REPLACE(
            INITCAP(TRIM(customer_name)),
            '@',
            ' '
        ) AS clean_name,

        INITCAP(
            TRIM(
                COALESCE(city, 'Unknown')
            )
        ) AS clean_city,

        LOWER(TRIM(email)) AS clean_email,

        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(phone_number, '-', ''),
                ' ', ''),
            '(91)', ''),
        ')', '') AS clean_phone

    FROM raw_customers
)
SELECT clean_name,
       clean_city,
       clean_email,
       clean_phone
FROM cleaned_data;


-- S10
-- Create final analytics-ready customer dataset:
-- fully standardized and validated customer output.

WITH cleaned_data AS (
    SELECT
        customer_id,

        REPLACE(
            INITCAP(TRIM(customer_name)),
            '@',
            ' '
        ) AS clean_name,

        LOWER(
            TRIM(
                COALESCE(email, 'unknown@unknown.com')
            )
        ) AS clean_email,

        INITCAP(
            TRIM(
                COALESCE(city, 'Unknown')
            )
        ) AS clean_city,

        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(phone_number, '-', ''),
                ' ', ''),
            '(91)', ''),
        ')', '') AS clean_phone

    FROM raw_customers
)
SELECT *
FROM cleaned_data;
