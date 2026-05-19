--- EMPLOYEES TABLE (Hierarchy) ---

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    manager_id INT,
    salary NUMERIC(10,2),
    city VARCHAR(30)
);

INSERT INTO employees VALUES
(1,  'Arjun Mehta',    'Engineering',  NULL, 120000, 'Mumbai'),
(2,  'Sneha Iyer',     'Engineering',  1,     90000, 'Mumbai'),
(3,  'Rahul Verma',    'HR',           1,     75000, 'Delhi'),
(4,  'Priya Nair',     'Finance',      2,     80000, 'Pune'),
(5,  'Karan Patel',    'Engineering',  2,     85000, 'Bangalore'),
(6,  'Meera Joshi',    'Finance',      4,     65000, 'Pune'),
(7,  'Aditya Rao',     'HR',           3,     60000, 'Delhi'),
(8,  'Neha Kapoor',    'Engineering',  5,     72000, 'Chennai'),
(9,  'Vikram Singh',   'Sales',        1,     55000, 'Mumbai'),
(10, 'Riya Sharma',    'Sales',        9,     50000, 'Hyderabad'),
(11, 'Ankit Gupta',    'Engineering',  5,     70000, 'Bangalore'),
(12, 'Pooja Shah',     'Finance',      6,     58000, 'Pune');


--- CATEGORIES TABLE (Product Hierarchy) ---

CREATE TABLE categories (
    category_id   INT PRIMARY KEY,
    category_name VARCHAR(50),
    parent_id     INT
);

INSERT INTO categories VALUES
(1,  'All Products',   NULL),
(2,  'Electronics',    1),
(3,  'Furniture',      1),
(4,  'Accessories',    1),
(5,  'Laptops',        2),
(6,  'Monitors',       2),
(7,  'Headphones',     2),
(8,  'Office Chairs',  3),
(9,  'Desks',          3),
(10, 'Laptop Bags',    4),
(11, 'USB Cables',     4),
(12, 'Gaming Laptops', 5),
(13, 'Ultrabooks',     5);


SELECT * FROM employees;
SELECT * FROM categories;

---SQL Practice: Recursive CTE Problems---

/* ----Q1----
Write a Recursive CTE to display the full employee hierarchy
starting from the top-level manager (where `manager_id IS NULL`).
Show: `emp_id`, `emp_name`, `manager_id` */

WITH RECURSIVE hierarchy AS (
	
	SELECT emp_id,
		   emp_name,
		   department,
		   manager_id,
	FROM employees
	WHERE manager_id IS NULL


	UNION ALL

	SELECT e.emp_id,
		   e.emp_name,
		   e.department,
		   e.manager_id,
	FROM employees e
	JOIN hierarchy h
	ON e.manager_id = h.emp_id
)
SELECT emp_id,
	   emp_name,
	   manager_id,
FROM hierarchy ;

/* ----Q2----
Extend Q1 to include a `level` column.

* Level 1 → top-level manager
* Level 2 → direct reports
* Level 3 → their reports

Show: `emp_id`, `emp_name`, `manager_id`, `level`
*/

WITH RECURSIVE hierarchy AS (
	
	SELECT emp_id,
		   emp_name,
		   department,
		   manager_id,
		   1 AS level
	FROM employees
	WHERE manager_id IS NULL


	UNION ALL

	SELECT e.emp_id,
		   e.emp_name,
		   e.department,
		   e.manager_id,
		   h.level + 1
	FROM employees e
	JOIN hierarchy h
	ON e.manager_id = h.emp_id
)
SELECT emp_id,
	   emp_name,
	   manager_id,
	   level
FROM hierarchy ;

/* ----Q3----
Using a Recursive CTE, find all employees who are
**directly or indirectly** under manager with `emp_id = 2` (Sneha Iyer).

Show: `emp_id`, `emp_name`, `level`
*/

WITH RECURSIVE hierarchy AS (

	SELECT emp_id,
	 	   emp_name,
		   manager_id,
		   1 AS level
	FROM employees
	WHERE emp_id = 2

	UNION ALL

	SELECT e.emp_id,
	 	   e.emp_name,
		   e.manager_id,
		   h.level + 1
	FROM employees e
	JOIN hierarchy h
	ON e.manager_id = h.emp_id

)
SELECT emp_id,
	   emp_name,
	   level
FROM hierarchy;

/* ----Q4----

Build the **full path** from the top-level manager to each employee.

Example output:
`Arjun Mehta → Sneha Iyer → Priya Nair`

Show: `emp_name`, `path`
*/

WITH RECURSIVE hierarchy_path AS (

	SELECT emp_id,
		   emp_name,
		   manager_id,
		   emp_name::TEXT AS path
	FROM employees
	WHERE manager_id IS NULL

	UNION ALL

	SELECT e.emp_id,
		   e.emp_name,
		   e.manager_id,
		   h.path || ' --> ' || e.emp_name
	FROM employees e
	JOIN hierarchy_path h
	ON e.manager_id = h.emp_id
	
)
SELECT emp_name,
	   path
FROM hierarchy_path;


/* ----Q5----

Write a Recursive CTE to traverse the `categories` table
and display the full product category hierarchy
starting from the root (`parent_id IS NULL`).

Show: `category_id`, `category_name`, `parent_id`, `level`
*/

WITH RECURSIVE hierarchy AS (

	SELECT category_id,
		   category_name,
		   parent_id,
		   1 AS level
	FROM categories
	WHERE parent_id IS NULL

	UNION ALL

	SELECT c.category_id,
		   c.category_name,
		   c.parent_id,
		   h.level + 1
	FROM categories c
	JOIN hierarchy h
	ON c.parent_id = h.category_id
)
SELECT *
FROM hierarchy;


/*Q6

Find all subcategories that fall under `Electronics` (category_id = 2).

Include all levels of subcategories.

Show: `category_id`, `category_name`, `level`
*/

WITH RECURSIVE hierarchy AS (

	SELECT category_id,
		   category_name,
		   parent_id,
		   1 AS level
	FROM categories 
	WHERE category_id = 2

	UNION ALL

	SELECT c.category_id,
		   c.category_name,
		   c.parent_id,
		   h.level + 1
	FROM categories c
	JOIN hierarchy h
	ON c.parent_id = h.category_id
)
SELECT category_id,
	   category_name,
	   level
FROM hierarchy;


/* ----Q7----

Count the total number of employees at each level of the hierarchy.

Show: `level`, `employee_count`
*/

WITH RECURSIVE hierarchy AS (

	SELECT emp_id,
	 	   emp_name,
		   manager_id,
		   1 AS level
	FROM employees
	WHERE manager_id IS NULL

	UNION ALL

	SELECT e.emp_id,
	 	   e.emp_name,
		   e.manager_id,
		   h.level + 1
	FROM employees e
	JOIN hierarchy h
	ON e.manager_id = h.emp_id

)
SELECT level,
	   COUNT(emp_id) AS employee_count
FROM hierarchy
GROUP BY level
ORDER BY level;


/*Q8

Find all employees who are exactly at **level 3**
(two levels below the top manager).

Show: `emp_id`, `emp_name`, `level`
*/

WITH RECURSIVE hierarchy AS (
	
	SELECT emp_id,
		   emp_name,
		   department,
		   manager_id,
		   1 AS level
	FROM employees
	WHERE manager_id IS NULL


	UNION ALL

	SELECT e.emp_id,
		   e.emp_name,
		   e.department,
		   e.manager_id,
		   h.level + 1
	FROM employees e
	JOIN hierarchy h
	ON e.manager_id = h.emp_id
)
SELECT emp_id,
	   emp_name,
	   level
FROM hierarchy 
WHERE level = 3;


/* ----Q9---- 

Build the category path for all categories in the `categories` table.

Example output:
`All Products → Electronics → Laptops → Gaming Laptops`

Show: `category_id`, `category_name`, `path`
*/

WITH RECURSIVE hierarchy AS (

	SELECT category_id,
		   category_name,
		   parent_id,
		   1 AS level,
		   category_name::TEXT AS path
	FROM categories
	WHERE parent_id IS NULL

	UNION ALL

	SELECT c.category_id,
		   c.category_name,
		   c.parent_id,
		   h.level + 1,
		   h.path || ' --> ' || c.category_name
	FROM categories c
	JOIN hierarchy h
	ON c.parent_id = h.category_id
)
SELECT category_id,
	   category_name,
	   path
FROM hierarchy;


/* ----Q10----
Find the **deepest level** reached in the employee hierarchy.

Show: `max_depth`

Then also show which employees sit at that deepest level.

Show: `emp_name`, `level`
*/

WITH RECURSIVE hierarchy AS (
	
	SELECT emp_id,
		   emp_name,
		   department,
		   manager_id,
		   1 AS level
	FROM employees
	WHERE manager_id IS NULL

	UNION ALL

	SELECT e.emp_id,
		   e.emp_name,
		   e.department,
		   e.manager_id,
		   h.level + 1
	FROM employees e
	JOIN hierarchy h
	ON e.manager_id = h.emp_id
),
max_depth AS (
	
	SELECT MAX(level) AS max_level
	FROM hierarchy
	
)
SELECT h.emp_name,
	   h.level,
	   m.max_level AS max_depth
FROM hierarchy h
CROSS JOIN max_depth m
WHERE h.level = m.max_level;


---SQL Practice: Recursive CTE Business Scenarios---

/* S1

The HR team wants to generate a **complete organizational chart**
showing every employee's position in the company hierarchy.

Show: `emp_name`, `department`, `level`
Order by: `level ASC`, `emp_name ASC`
*/

WITH RECURSIVE hierarchy AS (
	
	SELECT emp_id,
		   emp_name,
		   department,
		   manager_id,
		   1 AS level
	FROM employees
	WHERE manager_id IS NULL

	UNION ALL

	SELECT e.emp_id,
		   e.emp_name,
		   e.department,
		   e.manager_id,
		   h.level + 1
	FROM employees e
	JOIN hierarchy h
	ON e.manager_id = h.emp_id
)
SELECT emp_name,
	   department,
	   level
FROM hierarchy 
ORDER BY emp_name ASC;


/*S2

A manager (Sneha Iyer, `emp_id = 2`) is leaving the company.
HR wants to identify **all employees in her reporting chain**
to reassign them.

Show: `emp_id`, `emp_name`, `department`, `level`
*/

WITH RECURSIVE sneha_team AS (
 
    SELECT emp_id,
           emp_name,
           department,
           manager_id,
           1 AS level
    FROM employees
    WHERE emp_id = 2
 
    UNION ALL
 
    SELECT e.emp_id,
           e.emp_name,
           e.department,
           e.manager_id,
           s.level + 1
    FROM employees e
    JOIN sneha_team s
    ON e.manager_id = s.emp_id
 
)
SELECT emp_id,
       emp_name,
       department,
       level
FROM sneha_team
WHERE emp_id <> 2;


/*S3

Finance wants to calculate the **total salary expense**
for each manager's full team
(including all direct and indirect reports).

Show: `manager_name`, `total_team_salary`
*/

WITH RECURSIVE hierarchy AS (

	SELECT emp_id,
	 	   emp_name,
		   manager_id,
		   salary,
		   1 AS level
	FROM employees
	WHERE manager_id IS NULL

	UNION ALL

	SELECT e.emp_id,
	 	   e.emp_name,
		   e.manager_id,
		   e.salary,
		   h.level + 1
	FROM employees e
	JOIN hierarchy h
	ON e.manager_id = h.emp_id
),
team_salary AS (

	SELECT h.manager_id,
		   SUM(h.salary) AS total_team_salary
	FROM hierarchy h
	WHERE h.manager_id IS NOT NULL
	GROUP BY h.manager_id
)
SELECT e.emp_name AS manager_name,
	   t.total_team_salary
FROM team_salary t
JOIN employees e
ON e.emp_id = t.manager_id
ORDER BY t.total_team_salary DESC;


/*S4

The company wants to identify **deep organizational structures**.

Find managers who have **more than 2 levels** of hierarchy below them.

Show: `manager_name`, `max_depth_below`
*/

WITH RECURSIVE org_chart AS (
 
    SELECT emp_id,
           emp_name,
           manager_id,
           1 AS level
    FROM employees
    WHERE manager_id IS NULL
 
    UNION ALL
 
    SELECT e.emp_id,
           e.emp_name,
           e.manager_id,
           o.level + 1
    FROM employees e
    JOIN org_chart o
    ON e.manager_id = o.emp_id
 
),
manager_depth AS (
 
    SELECT o.manager_id,
           MAX(o.level) AS max_level_below
    FROM org_chart o
    WHERE o.manager_id IS NOT NULL
    GROUP BY o.manager_id
 
)
SELECT e.emp_name AS manager_name,
       md.max_level_below
FROM manager_depth md
JOIN employees e
ON e.emp_id = md.manager_id
WHERE md.max_level_below > 2
ORDER BY md.max_level_below DESC;


/*S5

The product team wants to see the **complete category tree**
with full path from root to leaf.

Show: `category_name`, `path`, `level`
Order by: `path ASC`
*/

WITH RECURSIVE category_tree AS (
 
    SELECT category_id,
           category_name,
           parent_id,
           1 AS level,
           category_name::TEXT AS path
    FROM categories
    WHERE parent_id IS NULL
 
    UNION ALL
 
    SELECT c.category_id,
           c.category_name,
           c.parent_id,
           ct.level + 1,
           ct.path || ' → ' || c.category_name
    FROM categories c
    JOIN category_tree ct
    ON c.parent_id = ct.category_id
 
)
SELECT category_name,
       path,
       level
FROM category_tree
ORDER BY path ASC;
 
 
/*S6

The marketing team wants to run a campaign targeting the
**Electronics supercategory** (category_id = 2).

Find all product categories that fall under Electronics
at **any depth**.

Show: `category_id`, `category_name`, `level`
*/

WITH RECURSIVE electronics_tree AS (
 
    SELECT category_id,
           category_name,
           parent_id,
           1 AS level
    FROM categories
    WHERE category_id = 2
 
    UNION ALL
 
    SELECT c.category_id,
           c.category_name,
           c.parent_id,
           e.level + 1
    FROM categories c
    JOIN electronics_tree e
    ON c.parent_id = e.category_id
 
)
SELECT category_id,
       category_name,
       level
FROM electronics_tree
WHERE category_id <> 2
ORDER BY level, category_name;
 
 
/*S7 

The CEO wants a report showing **how many employees**
exist at each level with a level label.

* Level 1 → `C-Suite`
* Level 2 → `Senior Management`
* Level 3 → `Mid Management`
* Level 4+ → `Individual Contributor`

Show: `level`, `employee_count`, `level_label`
*/

WITH RECURSIVE org_chart AS (
 
    SELECT emp_id,
           emp_name,
           manager_id,
           salary,
           1 AS level
    FROM employees
    WHERE manager_id IS NULL
 
    UNION ALL
 
    SELECT e.emp_id,
           e.emp_name,
           e.manager_id,
           e.salary,
           o.level + 1
    FROM employees e
    JOIN org_chart o
    ON e.manager_id = o.emp_id
 
)
SELECT level,
       COUNT(emp_id) AS employee_count,
       CASE
           WHEN level = 1 THEN 'C-Suite'
           WHEN level = 2 THEN 'Senior Management'
           WHEN level = 3 THEN 'Mid Management'
           ELSE 'Individual Contributor'
       END AS level_label
FROM org_chart
GROUP BY level
ORDER BY level;
 
 
/*S8

HR wants to generate an **employee reporting path card**
for every employee for internal directories.

Show: `emp_id`, `emp_name`, `reporting_path`

Example: `Arjun Mehta → Sneha Iyer → Priya Nair → Meera Joshi`
*/

WITH RECURSIVE org_chart AS (
 
    SELECT emp_id,
           emp_name,
           manager_id,
           emp_name::TEXT AS reporting_path
    FROM employees
    WHERE manager_id IS NULL
 
    UNION ALL
 
    SELECT e.emp_id,
           e.emp_name,
           e.manager_id,
           o.reporting_path || ' → ' || e.emp_name
    FROM employees e
    JOIN org_chart o
    ON e.manager_id = o.emp_id
 
)
SELECT emp_id,
       emp_name,
       reporting_path
FROM org_chart
ORDER BY reporting_path;
 
 
/*S9

The data team wants to identify **leaf-level employees**
(employees who have no one reporting to them).

Show: `emp_id`, `emp_name`, `department`, `level`
*/

WITH RECURSIVE org_chart AS (
 
    SELECT emp_id,
           emp_name,
           department,
           manager_id,
           1 AS level
    FROM employees
    WHERE manager_id IS NULL
 
    UNION ALL
 
    SELECT e.emp_id,
           e.emp_name,
           e.department,
           e.manager_id,
           o.level + 1
    FROM employees e
    JOIN org_chart o
    ON e.manager_id = o.emp_id
 
)
SELECT o.emp_id,
       o.emp_name,
       o.department,
       o.level
FROM org_chart o
WHERE o.emp_id NOT IN (
    SELECT DISTINCT manager_id
    FROM employees
    WHERE manager_id IS NOT NULL
)
ORDER BY o.level, o.emp_name;
 
 
/*S10 

Create a layered organizational analysis:

1. Build the full hierarchy with levels
2. Classify employees into bands:
   * Level 1 → `Executive`
   * Level 2 → `Senior Manager`
   * Level 3 → `Manager`
   * Level 4+ → `Individual Contributor`
3. Show total salary payout by band

Show: `band`, `employee_count`, `total_salary`, `avg_salary`
*/

WITH RECURSIVE org_chart AS (
 
    SELECT emp_id,
           emp_name,
           department,
           manager_id,
           salary,
           1 AS level
    FROM employees
    WHERE manager_id IS NULL
 
    UNION ALL
 
    SELECT e.emp_id,
           e.emp_name,
           e.department,
           e.manager_id,
           e.salary,
           o.level + 1
    FROM employees e
    JOIN org_chart o
    ON e.manager_id = o.emp_id
 
),
classified AS (
 
    SELECT emp_id,
           emp_name,
           salary,
           level,
           CASE
               WHEN level = 1 THEN 'Executive'
               WHEN level = 2 THEN 'Senior Manager'
               WHEN level = 3 THEN 'Manager'
               ELSE 'Individual Contributor'
           END AS band
    FROM org_chart
 
)
SELECT band,
       COUNT(emp_id)    AS employee_count,
       SUM(salary)      AS total_salary,
       AVG(salary)      AS avg_salary
FROM classified
GROUP BY band
ORDER BY MIN(level);