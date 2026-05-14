# 📘 SQL: CASE WHEN

---

# 📌 What is `CASE WHEN`?

`CASE WHEN` allows conditional business logic in SQL.

It works like:

* `IF`
* `ELSE IF`
* `ELSE`

from programming languages.

---

# 🔹 Basic Syntax

```sql id="g2k9xp"
CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END
```

---

# 🔹 Example

```sql id="k8m4zt"
SELECT emp_name,
       salary,
       CASE
           WHEN salary >= 100000 THEN 'High Salary'
           WHEN salary >= 70000 THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS salary_category
FROM employees;
```

---

# ⚠️ Important Rule

`CASE` conditions execute from top to bottom.

✅ First matching condition wins.

---

# ❌ Wrong Ordering Example

```sql id="p5v2qc"
CASE
    WHEN salary >= 70000 THEN 'Medium'
    WHEN salary >= 100000 THEN 'High'
END
```

### Why is this wrong?

Because:

* `100000` also satisfies `>= 70000`
* The second condition never executes

---

# 🔹 CASE WHEN with Aggregations

```sql id="t4w7nd"
SELECT department,
       SUM(
           CASE
               WHEN salary >= 80000 THEN salary
               ELSE 0
           END
       ) AS high_salary_total
FROM employees
GROUP BY department;
```

---

# 🔹 CASE WHEN with COUNT

```sql id="r9m3qc"
COUNT(
    CASE
        WHEN performance_score >= 8 THEN 1
    END
)
```

---

# 🔹 CASE WHEN with Window Functions

```sql id="m2x7ly"
CASE
    WHEN salary >
         AVG(salary) OVER (
             PARTITION BY department
         )
    THEN 'Above Average'
    ELSE 'Below Average'
END
```

---

# 🧠 Common Uses

* Categorization
* KPI labels
* Salary bands
* Customer segmentation
* Conditional aggregation
* Risk classification

---

# ⚠️ Common Mistakes

* Wrong condition order ❌
* Overlapping conditions ❌
* Forgetting `ELSE` ❌
* Missing `END` ❌

---

# ✅ Key Takeaway

`CASE WHEN` brings business logic directly into SQL queries.
