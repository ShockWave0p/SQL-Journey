# 📄 SQL Practice: Views & Materialized Views Problems

---

## 🔹 Q1

Create a View that shows all employees from the `Engineering` department.

Show: `emp_id`, `emp_name`, `salary`, `city`

---

## 🔹 Q2

Create a View that shows department-wise employee count and average salary.

Show: `department`, `employee_count`, `avg_salary`

---

## 🔹 Q3

Query the View created in Q2 to show only departments
where `avg_salary` is greater than 75000.

---

## 🔹 Q4

Create a View that shows all delivered orders from the `orders` table.

Show: `order_id`, `customer_name`, `city`, `amount`

---

## 🔹 Q5

Create a View that shows city-wise total revenue from orders.

Show: `city`, `total_revenue`

---

## 🔹 Q6

Replace the View from Q5 to also include `order_count` per city.

Show: `city`, `total_revenue`, `order_count`

---

## 🔹 Q7

Create a View that joins `employees` and `orders` tables
to show which cities have both employees and orders.

Show: `city`

---

## 🔹 Q8

Drop the View created in Q4.
Use the safe drop syntax.

---

## 🔹 Q9

Create a Materialized View that stores department-wise
total salary expense.

Show: `department`, `total_salary`

---

## 🔹 Q10 🔥

Write the command to refresh the Materialized View
created in Q9.

Then query it to show departments where
`total_salary` exceeds 200000.
