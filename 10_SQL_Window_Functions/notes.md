# 📘 SQL: Window Functions

---

## 📌 What are Window Functions?

Window functions perform calculations across rows without collapsing the result set.

Unlike `GROUP BY`:

* rows remain visible
* analytics are added alongside rows

---

# 🔹 Basic Syntax

```sql id="g7k2xp"
function_name() OVER (
    PARTITION BY ...
    ORDER BY ...
)
```

---

# 🧠 Important Components

---

## 🔹 PARTITION BY

Creates groups/windows.

### Example

```sql id="k4m9zt"
PARTITION BY department
```

---

## 🔹 ORDER BY

Defines ranking/order inside partition.

### Example

```sql id="p2v8qc"
ORDER BY salary DESC
```

---

## 🔹 ROW_NUMBER()

Gives unique sequential numbering.

```sql id="t5w1nd"
SELECT emp_name,
       salary,
       ROW_NUMBER() OVER (
           ORDER BY salary DESC
       ) AS row_num
FROM employees;
```

---

## 🔹 RANK()

Same rank for ties.
Skips next rank.

### Example

```text id="z8q3mx"
100 → rank 1
100 → rank 1
90  → rank 3
```

---

## 🔹 DENSE_RANK()

Same rank for ties.
Does NOT skip ranks.

### Example

```text id="r4p7ly"
100 → rank 1
100 → rank 1
90  → rank 2
```

---

## 🔹 Running Total

```sql id="w6k1zr"
SUM(salary) OVER (
    ORDER BY joining_date
)
```

---

## 🔹 Partition Example

```sql id="q9m4tp"
AVG(salary) OVER (
    PARTITION BY department
)
```

Shows department average beside every employee.

---

# 🔍 GROUP BY vs Window Functions

| GROUP BY         | Window Function         |
| ---------------- | ----------------------- |
| Collapses rows   | Keeps rows              |
| Grouped output   | Row-level output        |
| Aggregation only | Analytical calculations |

---

# ⚠️ Common Mistakes

* Forgetting `OVER()` ❌
* Confusing `GROUP BY` with window functions ❌
* Missing `ORDER BY` in ranking functions ❌
* Misunderstanding `PARTITION BY` ❌

---

# ✅ Key Takeaway

Window functions add analytics without losing row detail.
