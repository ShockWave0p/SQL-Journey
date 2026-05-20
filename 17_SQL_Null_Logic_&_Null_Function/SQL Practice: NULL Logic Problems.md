# 📄 SQL Practice: NULL Logic Problems

---

## 🔹 Q1

Find all employees where `city` is NULL.

---

## 🔹 Q2

Find all employees where `bonus` is NOT NULL.

---

## 🔹 Q3

Show all employees with their bonus.
Replace NULL bonus with `0`.

Show: `emp_name`, `bonus`

---

## 🔹 Q4

Show all employees with their city.
Replace NULL city with `'Unknown'`.

Show: `emp_name`, `city`

---

## 🔹 Q5

Show all employees with their phone.
If phone is NULL, show email.
If both are NULL, show `'No Contact'`.

Use `COALESCE()`.

Show: `emp_name`, `contact`

---

## 🔹 Q6

Calculate the average bonus of employees.

Run it twice:
* Once using `AVG(bonus)` directly
* Once replacing NULL bonus with `0` before averaging

Show the difference in results.

---

## 🔹 Q7

Show `COUNT(*)` vs `COUNT(bonus)` vs `COUNT(phone)`
for the employees table.

Explain the difference in your answer.

---

## 🔹 Q8

Find all orders where `discount` is NULL.
Replace NULL discount with `0` and calculate:
`amount - discount` as `final_amount`.

Show: `order_id`, `customer_name`, `amount`, `final_amount`

---

## 🔹 Q9

Use `NULLIF()` to return NULL for any employee
whose `bonus` equals `0`.

Show: `emp_name`, `bonus`

---

## 🔹 Q10 🔥

Find all orders where EITHER `city` is NULL
OR `delivered_date` is NULL
OR `notes` is NULL.

Show: `order_id`, `customer_name`, `city`, `delivered_date`, `notes`
