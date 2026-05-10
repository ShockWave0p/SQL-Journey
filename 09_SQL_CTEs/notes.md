# 📘 SQL: CTEs (Common Table Expressions)

---

## 📌 What is a CTE?

A CTE is a temporary named result set created using the `WITH` clause.

It helps:

* simplify complex queries
* improve readability
* break logic into steps

---

# 🔹 Basic Syntax

```sql id="m8q2vx"
WITH cte_name AS (
    SELECT ...
)
SELECT *
FROM cte_name;
```

---

# 🔹 Example

```sql id="k4p9za"
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 70000
)
SELECT *
FROM high_salary;
```

---

# 🧠 Why CTEs are Important

### Without CTE

* Nested subqueries become messy

### With CTE

* Logic becomes modular and readable

---

# 🔹 Multiple CTEs

You can chain multiple CTEs.

```sql id="t7w1nd"
WITH dept_salary AS (
    SELECT department,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
high_dept AS (
    SELECT *
    FROM dept_salary
    WHERE avg_salary > 70000
)
SELECT *
FROM high_dept;
```

---

# 🔍 CTE vs Subquery

| CTE           | Subquery        |
| ------------- | --------------- |
| More readable | More compact    |
| Reusable      | Harder to debug |
| Modular       | Nested          |

---

# ⚠️ Common Mistakes

* Forgetting comma between multiple CTEs ❌
* Using CTE name before declaration ❌
* Missing final `SELECT` ❌
* Forgetting alias names ❌

---

# ✅ Key Takeaway

CTEs help structure SQL step-by-step like programming logic.
