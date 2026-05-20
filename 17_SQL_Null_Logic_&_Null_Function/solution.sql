--- EMPLOYEES TABLE ---

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary NUMERIC(10,2),
    manager_id INT,
    city VARCHAR(30),
    bonus NUMERIC(10,2),
    phone VARCHAR(20)
);

INSERT INTO employees VALUES
(1,  'Arjun Mehta',  'Engineering', 120000, NULL, 'Mumbai',    20000, '9876543210'),
(2,  'Sneha Iyer',   'Engineering',  90000, 1,    'Mumbai',    15000, NULL),
(3,  'Rahul Verma',  'HR',           75000, 1,    NULL,        10000, '9988776655'),
(4,  'Priya Nair',   'Finance',      80000, 2,    'Pune',      NULL,  '9000011111'),
(5,  'Karan Patel',  'Engineering',  85000, 2,    'Bangalore', 12000, '9555566666'),
(6,  'Meera Joshi',  'Finance',      65000, 4,    NULL,        NULL,  NULL),
(7,  'Aditya Rao',   'HR',           60000, 3,    'Delhi',     8000,  '9777711111'),
(8,  'Neha Kapoor',  'Engineering',  72000, 5,    'Chennai',   NULL,  '9666622222'),
(9,  'Vikram Singh', 'Sales',        55000, 1,    'Mumbai',    5000,  NULL),
(10, 'Riya Sharma',  'Sales',        50000, 9,    NULL,        NULL,  '9444433333');


--- ORDERS TABLE ---

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    amount NUMERIC(10,2),
    discount NUMERIC(10,2),
    delivered_date DATE,
    notes VARCHAR(100)
);

INSERT INTO orders VALUES
(1,  'Aarav Shah',    'Mumbai',    15000, 500,  '2024-01-10', 'Priority order'),
(2,  'Meera Iyer',   'Pune',      22000, NULL, '2024-01-15', NULL),
(3,  'Rahul Verma',  'Delhi',      9000, 200,  NULL,         'Delayed'),
(4,  'Priya Nair',   NULL,        18000, NULL, '2024-02-01', NULL),
(5,  'Karan Patel',  'Bangalore', 30000, 1000, '2024-02-10', 'Bulk order'),
(6,  'Sneha Patil',  'Pune',      12000, NULL, NULL,         NULL),
(7,  'Aditya Rao',   'Chennai',   21000, 300,  '2024-03-01', 'Gift wrapped'),
(8,  'Neha Kapoor',  NULL,         7500, NULL, '2024-03-05', NULL),
(9,  'Vikram Singh', 'Mumbai',    25000, 800,  NULL,         'Express delivery'),
(10, 'Riya Sharma',  'Hyderabad', 11000, NULL, '2024-03-20', NULL);


SELECT * FROM employees;
SELECT * FROM orders;


--- SQL Practice: NULL Logic Problems ---


/* Q1

Find all employees where `city` is NULL.
*/

SELECT emp_name,city
FROM employees
WHERE city IS NULL;

---

/* Q2

Find all employees where `bonus` is NOT NULL.
*/

SELECT *
FROM employees
WHERE bonus IS NOT NULL;

---

/* Q3

Show all employees with their bonus.
Replace NULL bonus with `0`.

Show: `emp_name`, `bonus`
*/

SELECT emp_name,
	  COALESCE(bonus,0) AS bonus
FROM employees;

---

/* Q4

Show all employees with their city.
Replace NULL city with `'Unknown'`.

Show: `emp_name`, `city`
*/

SELECT emp_name,
	  COALESCE(city,'Unknown') AS city
FROM employees;

---

/* Q5

Show all employees with their contact information.
If phone is NULL, show 'No Contact'.

Show: `emp_name`, `contact`
*/

SELECT emp_name,
	  COALESCE(phone,'No Contact')
FROM employees;

---

/* Q6

Calculate the average bonus of employees.
Show the difference in results.
*/

SELECT AVG(bonus) AS avg_bonus,
	   AVG(COALESCE(bonus,0)) AS avg_bonus_without_null
FROM employees;

---

/* Q7

Show `COUNT(*)` vs `COUNT(bonus)` vs `COUNT(phone)`
for the employees table.

Explain the difference in your answer.
*/

SELECT COUNT(*),
	   COUNT(bonus),
	   COUNT(phone)
FROM employees;

---So The First Count dont ignore the NULLS and COUNT them therefore COUNT is 10
---The Secound Count Ignore the NULLS therefore COUNT is 6
---The Third Count also Ignore the NULLS therefore COUNT is 7

---

/* Q8

Find all orders where `discount` is NULL.
Replace NULL discount with `0` and calculate:
`amount - discount` as `final_amount`.

Show: `order_id`, `customer_name`, `amount`, `final_amount`
*/

SELECT order_id,
	   customer_name,
	   amount,
	   amount - COALESCE(discount,0) AS final_amount
FROM orders
WHERE discount IS NULL;
	   
---

/* Q9

Use `NULLIF()` to return NULL for any employee
whose `bonus` equals `0`.

Show: `emp_name`, `bonus`
*/

SELECT emp_name,
	   NULLIF(bonus,0) AS bonus
FROM employees;

---

/* Q10 

Find all orders where EITHER `city` is NULL
OR `delivered_date` is NULL
OR `notes` is NULL.

Show: `order_id`, `customer_name`, `city`, `delivered_date`, `notes`
*/

SELECT order_id,
       customer_name,
       city,
       delivered_date,
       notes
FROM orders
WHERE city IS NULL 
	  OR delivered_date IS NULL 
	  OR notes IS NULL;


--- SQL Practice: NULL Logic Business Scenarios ---

---

/* S1

HR wants a clean employee directory.
Find all employees with missing phone numbers.

Show: `emp_id`, `emp_name`, `department`, `phone`
*/

SELECT emp_id,
	   emp_name,
	   department,
	   phone
FROM employees 
WHERE phone IS NULL;

---

/* S2

Finance wants to calculate total compensation for each employee.
Total compensation = `salary + bonus`.
Treat NULL bonus as `0`.

Show: `emp_name`, `salary`, `bonus`, `total_compensation`
*/

SELECT emp_name,
	   salary,
	   COALESCE(bonus, 0) AS bonus,
	   salary + COALESCE(bonus, 0) AS total_compensation
FROM employees;

---

/* S3

The HR team wants to identify employees with incomplete profiles.
Flag employees where ANY of these fields is NULL:
`city`, `bonus`, `phone`

Show: `emp_id`, `emp_name`, `city`, `bonus`, `phone`
*/

SELECT emp_id,
	   emp_name,
	   city,
	   bonus,
	   phone
FROM employees
WHERE city IS NULL
	  OR bonus IS NULL
	  OR phone IS NULL;

---

/* S4

The operations team wants delivery tracking.
Find all orders that have NOT been delivered yet
(`delivered_date` is NULL).

Show: `order_id`, `customer_name`, `amount`, `city`
*/

SELECT order_id,
	   customer_name,
	   amount,
	   city
FROM orders
WHERE delivered_date IS NULL;

---

/* S5

The marketing team wants to contact customers.
Some orders have NULL city.
Replace NULL city with `'Location Unknown'`.

Show: `order_id`, `customer_name`, `city`
*/

SELECT order_id,
	   customer_name,
	   COALESCE(city,'Unknown Location') AS city
FROM orders;

---

/* S6

Finance wants accurate discount reporting.
Replace NULL discounts with `0`.
Calculate final revenue: `amount - discount`.

Show: `order_id`, `customer_name`, `amount`, `discount`, `final_revenue`
Order by: `final_revenue DESC`
*/

SELECT order_id,
	   customer_name,
	   amount,
	   COALESCE(discount,0) AS discount,
	   amount - COALESCE(discount,0) AS final_revenue
FROM orders
ORDER BY final_revenue DESC;

---

/* S7 

HR wants department-wise bonus analysis.
Show total bonus and average bonus per department.
Treat NULL bonus as `0` for total but use natural `AVG()` for average.

Show: `department`, `total_bonus`, `avg_bonus`

Explain the difference between the two bonus columns.
*/

SELECT department,
	   SUM(COALESCE(bonus,0)) AS total_bonus,
	   AVG(bonus) AS avg_bonus
FROM employees
GROUP BY department;

---

/* S8

The data team wants to audit the orders table.
Count total rows, rows with NULL city, rows with NULL discount,
and rows with NULL delivered_date.

Show: `total_orders`, `null_city`, `null_discount`, `null_delivery`
*/

SELECT
    COUNT(*) AS total_orders,

    COUNT(
        CASE
            WHEN city IS NULL THEN 1
        END
    ) AS null_city,

    COUNT(
        CASE
            WHEN discount IS NULL THEN 1
        END
    ) AS null_discount,

    COUNT(
        CASE
            WHEN delivered_date IS NULL THEN 1
        END
    ) AS null_delivery

FROM orders;

---

/* S9 

Generate a clean employee contact card.
Priority for contact field:
1. phone
2. If phone NULL → show `'No Phone'`

For city:
1. city
2. If city NULL → show `'Remote'`

Show: `emp_id`, `emp_name`, `department`, `contact`, `location`
*/

SELECT emp_id,
	   emp_name,
	   department,
	   COALESCE(phone,'No Phone') AS contact,
	   COALESCE(city,'Remote') AS location
FROM employees;
---

/* S10 
 
Create a full employee data quality report:

* Replace NULL city with `'Unknown'`
* Replace NULL bonus with `0`
* Replace NULL phone with `'Not Provided'`
* Add a `profile_status` column:
  * `'Complete'` → if none of city, bonus, phone were NULL
  * `'Incomplete'` → if any field was NULL

Show: `emp_id`, `emp_name`, `city`, `bonus`, `phone`, `profile_status`
*/

SELECT emp_id,
	   emp_name,
	   COALESCE(city,'Unknown') AS city,
	   COALESCE(bonus,0) AS bonus,
	   COALESCE(phone,'Not Provided') AS phone,
	   CASE
	   		WHEN city IS NOT NULL 
				 AND bonus IS NOT NULL 
				 AND phone IS NOT NULL 
				 THEN 'complete'
		ELSE
			'Incomplete'
		END AS profile_status
FROM employees;