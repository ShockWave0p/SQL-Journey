# 📘 SQL: Advanced JOINS

---

## 📌 Topics Covered

* `SELF JOIN`
* `CROSS JOIN`
* Multi-table `JOIN`
* Join duplication logic

---

# 🔹 1. SELF JOIN

A table joined with itself.

Used for:

* employee-manager hierarchy
* parent-child relationships

```sql id="m8q2vx"
SELECT e.emp_name AS employee,
       m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;
```

---

# 🔹 2. CROSS JOIN

Returns all possible combinations.

```sql id="k4p9za"
SELECT *
FROM employees
CROSS JOIN projects;
```

⚠️ Can create huge datasets.

---

# 🔹 3. Multi-table JOIN

Joining more than 2 tables.

```sql id="t7w1nd"
SELECT e.emp_name,
       p.project_name
FROM employees e
JOIN projects p
ON e.emp_id = p.emp_id;
```

---

# 🔹 4. Join Duplication Logic

One-to-many joins can create duplicate rows.

### Example

* One employee
* Multiple projects

### Result

* Employee repeated multiple times

---

# ⚠️ Common Mistakes

* Wrong alias usage ❌
* Joining on incorrect keys ❌
* Unexpected duplicates ❌
* Forgetting join conditions ❌

---

# ✅ Key Takeaway

Advanced joins help model real-world relational systems.
