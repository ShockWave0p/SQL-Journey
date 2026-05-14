---EMPLOYEES TABLE---

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary NUMERIC(10,2),
    experience_years INT,
    performance_score INT
);

INSERT INTO employees VALUES
(1, 'Aarav', 'Engineering', 'Mumbai', 95000, 6, 9),
(2, 'Meera', 'Engineering', 'Pune', 85000, 5, 8),
(3, 'Rahul', 'HR', 'Delhi', 60000, 3, 6),
(4, 'Priya', 'Finance', 'Mumbai', 75000, 4, 7),
(5, 'Karan', 'Engineering', 'Bangalore', 105000, 8, 10),
(6, 'Sneha', 'Finance', 'Pune', 65000, 2, 5),
(7, 'Aditya', 'HR', 'Delhi', 55000, 1, 4),
(8, 'Neha', 'Engineering', 'Chennai', 72000, 4, 7),
(9, 'Vikram', 'Sales', 'Mumbai', 50000, 2, 5),
(10, 'Riya', 'Sales', 'Hyderabad', 48000, 1, 4),
(11, 'Arjun', 'Engineering', 'Mumbai', 115000, 10, 10),
(12, 'Pooja', 'Finance', 'Delhi', 78000, 5, 8);

SELECT * FROM employees;

--- PRACTICE PROBLEMS---

-- Q1
-- Categorize employees based on salary:
-- >=100000 → High
-- >=70000 → Medium
-- else Low

SELECT emp_name,
	   salary,
	   CASE
	   		WHEN salary >= 100000 THEN 'High Salary'
			WHEN salary >= 70000 THEN 'Medium Salary'
	   ELSE 'Low'
	   END AS Salary_band
FROM employees

-- Q2
-- Categorize employees based on experience:
-- >=7 years → Senior
-- >=3 years → Mid-Level
-- else Junior

SELECT emp_name,
	   department,
	   experience_years,
	   CASE 
	   		WHEN experience_years >= 7 THEN 'Senior'
			WHEN experience_years >= 3 THEN 'Mid-Level'
		ELSE 'Junior'
		END AS emp_level
FROM employees;

-- Q3
-- Create performance labels:
-- >=9 → Excellent
-- >=7 → Good
-- >=5 → Average
-- else Poor

SELECT emp_name,
	   department,
	   performance_score,
	   CASE
	   		WHEN performance_score >= 9 THEN 'Excellent'
			WHEN performance_score >= 7 THEN 'Good'
			WHEN performance_score >= 5 THEN 'Average'
		ELSE 'Poor'
		END AS performance_Remark
FROM employees;

-- Q4
-- Show bonus percentage:
-- Engineering → 20%
-- Finance → 15%
-- HR → 10%
-- others → 5%

SELECT 	emp_name,
		department,
		CASE 
			WHEN department = 'Engineering' THEN '20%'
			WHEN department = 'Finance' THEN '15%'
			WHEN department = 'HR' THEN '10%'
		ELSE '5%' 
		END AS Salary_Bonus
FROM employees;

-- Q5
-- Count employees having salary >=80000.

SELECT
	   COUNT(
			CASE
				WHEN salary >= 80000 THEN 1
			END
	   ) AS high_salary
FROM employees;

-- Q6
-- Count employees department-wise whose performance_score >=8.

SELECT department,
		COUNT(
			CASE 
				WHEN performance_score >= 8 THEN 1
			END
		) AS high_performance
FROM employees
GROUP BY department;

-- Q7
-- Calculate total high salary payout department-wise
-- where high salary means >=80000.

SELECT department,
       SUM(
           CASE
               WHEN salary >= 80000 THEN salary
               ELSE 0
           END
       ) AS high_salary_payout
FROM employees
GROUP BY department;

-- Q8
-- Show employees with a salary flag:
-- Above Average
-- Below Average

WITH salary_avg AS (
	SELECT AVG(salary) AS avg_emp_salary
	FROM employees
)
SELECT emp_name,
	   CASE 
	   		WHEN salary > (SELECT avg_emp_salary FROM salary_avg) THEN 'Above Average'
			ELSE 'Below Average'
		END AS salary_flag
FROM employees;

-- Q9
-- Categorize cities:
-- Mumbai/Pune → West
-- Delhi → North
-- Chennai/Hyderabad → South
-- else Other


SELECT city,
	   CASE 
	   		WHEN city = 'Mumbai'THEN 'West'
			WHEN city = 'Pune'  THEN 'West'
			WHEN city = 'Delhi' THEN 'North'
			WHEN city = 'Chennai' THEN 'South'
			WHEN city = 'Hyderabad' THEN 'South'
			ELSE 'Other'
		END AS region
FROM employees;


-- Q10
-- Create a salary-grade system:
-- >=100000 → Grade A
-- >=80000 → Grade B
-- >=60000 → Grade C
-- else Grade D

SELECT emp_name,
	   salary,
	   CASE 
	   		WHEN salary >= 100000 THEN 'Grade A'
			WHEN salary >= 80000 THEN 'Grade B'
			WHEN salary >= 60000 THEN 'Grade c'
			ELSE 'Grade D'
		END AS salary_grade
FROM employees;

--- CASE WHEN Business Scenarios ---

-- S1
-- HR wants employee compensation bands:
-- Premium / Standard / Entry-Level.

SELECT emp_name,
	   salary,
	   CASE
	   		WHEN salary >= 100000 THEN 'PREMIUM'
			WHEN salary >= 60000 THEN 'STANDARD'
			ELSE 'ENTRY-LEVEL'
		END AS Employee_Category
FROM employees
ORDER BY salary DESC;

-- S2
-- Management wants employee experience classification:
-- Senior / Mid-Level / Junior.

SELECT emp_name,
	   experience_years,
	   CASE
	   		WHEN experience_years >= 8 THEN 'Senior'
			WHEN experience_years >=5  THEN 'Mid_level'
			WHEN experience_years >=2 THEN 'Junior'
			ELSE 'Fresher'
		END AS experience_band
FROM employees;

-- S3
-- Finance wants bonus allocation labels
-- based on department policies.

SELECT department,
	   CASE 
	   		WHEN department = 'Engineering' THEN 'High_Bonus'
			WHEN department = 'Finance' THEN 'Medium_Bonus'
			WHEN department = 'HR' THEN 'Standard_Bonus'
			ELSE 'Basic_Bonus'
		END AS Bonus_Band
FROM employees;

-- S4
-- Identify top performers:
-- performance_score >= 8.

SELECT emp_name,
       department,
       performance_score
FROM employees
WHERE performance_score >= 8;

-- S5
-- Calculate department-wise high salary expense
-- only for employees earning >=80000.

SELECT  department,
	   SUM (
			CASE 
				WHEN salary >= 80000 THEN salary
				ELSE 0
			END
	   )AS high_salary
FROM employees
GROUP BY department;

-- S6
-- Create regional business zones:
-- West / North / South / Other.

SELECT city,
	   CASE 
	   		WHEN city = 'Mumbai'THEN 'West'
			WHEN city = 'Pune'  THEN 'West'
			WHEN city = 'Delhi' THEN 'North'
			WHEN city = 'Chennai' THEN 'South'
			WHEN city = 'Hyderabad' THEN 'South'
			ELSE 'Other'
		END AS region
FROM employees;

-- S7
-- Identify leadership-program eligible employees:
-- experience >=5 AND performance_score >=8.

SELECT emp_name,
	   CASE 
	   		WHEN experience_years >= 5 AND performance_score >=8 THEN 'Eligible'
			ELSE 'Not_Eligible'
		END AS Leadership_program
FROM employees;

-- S8
-- Create employee risk categories:
-- salary < 60000 AND performance_score <5 → High Risk
-- otherwise Stable.

SELECT emp_name,
	   CASE 
	   		WHEN salary < 60000 AND performance_score <5 THEN 'HIGH_RISK'
			ELSE 'STABLE'
		END AS Risk_Category
FROM employees;

-- S9
-- Create salary grade bands:
-- A / B / C / D.

SELECT emp_name,
	   salary,
	   CASE 
	   		WHEN salary >= 100000 THEN 'Grade A'
			WHEN salary >= 80000 THEN 'Grade B'
			WHEN salary >= 60000 THEN 'Grade c'
			ELSE 'Grade D'
		END AS salary_grade
FROM employees;

-- S10
-- Create layered employee analysis:
-- 1. salary category
-- 2. experience category
-- 3. performance category
-- 4. leadership eligibility

SELECT emp_name,

       CASE
           WHEN salary >= 100000 THEN 'High'
           ELSE 'Low'
       END AS salary_band,

       CASE
           WHEN experience_years >= 5 THEN 'Senior'
           ELSE 'Junior'
       END AS experience_level,

	   CASE
	   		WHEN performance_score >=8 THEN 'High_performer'
			ELSE 'Average_Performer'
		END AS performance_ranking,

		CASE 
	   		WHEN experience_years >= 5 AND performance_score >=8 THEN 'Eligible'
			ELSE 'Not_Eligible'
		END AS Leadership_eligiblity

FROM employees;