# 📄 SQL Practice: NULL Logic Business Scenarios

---

## 🔹 S1

HR wants a clean employee directory.
Find all employees with missing phone numbers.

Show: `emp_id`, `emp_name`, `department`, `phone`

---

## 🔹 S2

Finance wants to calculate total compensation for each employee.
Total compensation = `salary + bonus`.
Treat NULL bonus as `0`.

Show: `emp_name`, `salary`, `bonus`, `total_compensation`

---

## 🔹 S3

The HR team wants to identify employees with incomplete profiles.
Flag employees where ANY of these fields is NULL:
`city`, `bonus`, `phone`

Show: `emp_id`, `emp_name`, `city`, `bonus`, `phone`

---

## 🔹 S4

The operations team wants delivery tracking.
Find all orders that have NOT been delivered yet
(`delivered_date` is NULL).

Show: `order_id`, `customer_name`, `amount`, `city`

---

## 🔹 S5

The marketing team wants to contact customers.
Some orders have NULL city.
Replace NULL city with `'Location Unknown'`.

Show: `order_id`, `customer_name`, `city`

---

## 🔹 S6

Finance wants accurate discount reporting.
Replace NULL discounts with `0`.
Calculate final revenue: `amount - discount`.

Show: `order_id`, `customer_name`, `amount`, `discount`, `final_revenue`
Order by: `final_revenue DESC`

---

## 🔹 S7 🧠

HR wants department-wise bonus analysis.
Show total bonus and average bonus per department.
Treat NULL bonus as `0` for total but use natural `AVG()` for average.

Show: `department`, `total_bonus`, `avg_bonus`

Explain the difference between the two bonus columns.

---

## 🔹 S8

The data team wants to audit the orders table.
Count total rows, rows with NULL city, rows with NULL discount,
and rows with NULL delivered_date.

Show: `total_orders`, `null_city`, `null_discount`, `null_delivery`

---

## 🔹 S9 🚀

Generate a clean employee contact card.
Priority for contact field:
1. phone
2. If phone NULL → show `'No Phone'`

For city:
1. city
2. If city NULL → show `'Remote'`

Show: `emp_id`, `emp_name`, `department`, `contact`, `location`

---

## 🔹 S10 🔥

Create a full employee data quality report:

* Replace NULL city with `'Unknown'`
* Replace NULL bonus with `0`
* Replace NULL phone with `'Not Provided'`
* Add a `profile_status` column:
  * `'Complete'` → if none of city, bonus, phone were NULL
  * `'Incomplete'` → if any field was NULL

Show: `emp_id`, `emp_name`, `city`, `bonus`, `phone`, `profile_status`
