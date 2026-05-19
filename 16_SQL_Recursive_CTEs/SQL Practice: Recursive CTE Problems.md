# 📄 SQL Practice: Recursive CTE Problems

---

## 🔹 Q1

Write a Recursive CTE to display the full employee hierarchy
starting from the top-level manager (where `manager_id IS NULL`).

Show: `emp_id`, `emp_name`, `manager_id`

---

## 🔹 Q2

Extend Q1 to include a `level` column.

* Level 1 → top-level manager
* Level 2 → direct reports
* Level 3 → their reports

Show: `emp_id`, `emp_name`, `manager_id`, `level`

---

## 🔹 Q3

Using a Recursive CTE, find all employees who are
**directly or indirectly** under manager with `emp_id = 2` (Sneha Iyer).

Show: `emp_id`, `emp_name`, `level`

---

## 🔹 Q4

Build the **full path** from the top-level manager to each employee.

Example output:
`Arjun Mehta → Sneha Iyer → Priya Nair`

Show: `emp_name`, `path`

---

## 🔹 Q5

Write a Recursive CTE to traverse the `categories` table
and display the full product category hierarchy
starting from the root (`parent_id IS NULL`).

Show: `category_id`, `category_name`, `parent_id`, `level`

---

## 🔹 Q6

Find all subcategories that fall under `Electronics` (category_id = 2).

Include all levels of subcategories.

Show: `category_id`, `category_name`, `level`

---

## 🔹 Q7

Count the total number of employees at each level of the hierarchy.

Show: `level`, `employee_count`

---

## 🔹 Q8

Find all employees who are exactly at **level 3**
(two levels below the top manager).

Show: `emp_id`, `emp_name`, `level`

---

## 🔹 Q9 🚀

Build the category path for all categories in the `categories` table.

Example output:
`All Products → Electronics → Laptops → Gaming Laptops`

Show: `category_id`, `category_name`, `path`

---

## 🔹 Q10 🔥

Find the **deepest level** reached in the employee hierarchy.

Show: `max_depth`

Then also show which employees sit at that deepest level.

Show: `emp_name`, `level`
