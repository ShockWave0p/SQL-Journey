# 📄 SQL Practice: Views & Materialized Views Business Scenarios

---

## 🔹 S1

The HR team frequently queries high-salary employees.
Create a View for employees earning above 80000.

Show: `emp_id`, `emp_name`, `department`, `salary`

---

## 🔹 S2

The finance team needs a reusable salary report.
Create a View showing department-wise:
* total salary
* average salary
* highest salary
* lowest salary

Show: `department`, `total_salary`, `avg_salary`, `max_salary`, `min_salary`

---

## 🔹 S3

The operations team monitors undelivered orders daily.
Create a View for all orders where status is `'Pending'` or `'Cancelled'`.

Show: `order_id`, `customer_name`, `city`, `amount`, `status`

---

## 🔹 S4

The sales team wants a city-wise revenue dashboard.
Create a View showing city-wise total revenue
only for `'Delivered'` orders.

Show: `city`, `total_revenue`
Order by: `total_revenue DESC`

---

## 🔹 S5

Management wants a quick headcount report by city.
Create a View showing employee count per city.

Show: `city`, `employee_count`

---

## 🔹 S6

The analytics team wants category-wise order performance.
Create a View showing per category:
* total orders
* total revenue
* average order value

Show: `category`, `total_orders`, `total_revenue`, `avg_order_value`

---

## 🔹 S7 🧠

The data engineering team wants to accelerate a heavy report.
Create a Materialized View that stores:
* city-wise total revenue
* city-wise order count
* city-wise average order value

Show: `city`, `total_revenue`, `order_count`, `avg_order_value`

---

## 🔹 S8

After new orders are loaded into the system,
the Materialized View from S7 becomes stale.

Write the command to refresh it.
Then query it to find cities with `total_revenue` above 30000.

---

## 🔹 S9 🚀

The HR team wants to simplify access to employee tenure data.
Create a View that calculates each employee's
years of experience based on `joining_date`.

Show: `emp_name`, `department`, `joining_date`, `years_of_experience`

---

## 🔹 S10 🔥

Create a View that acts as a full employee performance summary:

* employee name
* department
* salary band:
  * `'High'` → salary >= 90000
  * `'Mid'` → salary >= 70000
  * `'Low'` → below 70000
* years of experience
* city

Show: `emp_name`, `department`, `salary_band`, `years_of_experience`, `city`
