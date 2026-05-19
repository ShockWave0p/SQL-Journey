# 📄 SQL Practice: Recursive CTE Business Scenarios

---

## 🔹 S1

The HR team wants to generate a **complete organizational chart**
showing every employee's position in the company hierarchy.

Show: `emp_name`, `department`, `level`
Order by: `level ASC`, `emp_name ASC`

---

## 🔹 S2

A manager (Sneha Iyer, `emp_id = 2`) is leaving the company.
HR wants to identify **all employees in her reporting chain**
to reassign them.

Show: `emp_id`, `emp_name`, `department`, `level`

---

## 🔹 S3

Finance wants to calculate the **total salary expense**
for each manager's full team
(including all direct and indirect reports).

Show: `manager_name`, `total_team_salary`

---

## 🔹 S4

The company wants to identify **deep organizational structures**.

Find managers who have **more than 2 levels** of hierarchy below them.

Show: `manager_name`, `max_depth_below`

---

## 🔹 S5

The product team wants to see the **complete category tree**
with full path from root to leaf.

Show: `category_name`, `path`, `level`
Order by: `path ASC`

---

## 🔹 S6

The marketing team wants to run a campaign targeting the
**Electronics supercategory** (category_id = 2).

Find all product categories that fall under Electronics
at **any depth**.

Show: `category_id`, `category_name`, `level`

---

## 🔹 S7 🧠

The CEO wants a report showing **how many employees**
exist at each level with a level label.

* Level 1 → `C-Suite`
* Level 2 → `Senior Management`
* Level 3 → `Mid Management`
* Level 4+ → `Individual Contributor`

Show: `level`, `employee_count`, `level_label`

---

## 🔹 S8

HR wants to generate an **employee reporting path card**
for every employee for internal directories.

Show: `emp_id`, `emp_name`, `reporting_path`

Example: `Arjun Mehta → Sneha Iyer → Priya Nair → Meera Joshi`

---

## 🔹 S9 🚀

The data team wants to identify **leaf-level employees**
(employees who have no one reporting to them).

Show: `emp_id`, `emp_name`, `department`, `level`

---

## 🔹 S10 🔥

Create a layered organizational analysis:

1. Build the full hierarchy with levels
2. Classify employees into bands:
   * Level 1 → `Executive`
   * Level 2 → `Senior Manager`
   * Level 3 → `Manager`
   * Level 4+ → `Individual Contributor`
3. Show total salary payout by band

Show: `band`, `employee_count`, `total_salary`, `avg_salary`
