# 📘 SQL: NULL Logic & NULL Functions

---

# 🧠 Why NULL Logic Matters

NULL is one of the most misunderstood concepts in SQL.
It causes silent bugs in filters, joins, aggregations, and comparisons.

NULLs appear constantly in real data:
* missing phone numbers
* unassigned managers
* undelivered orders
* unknown cities

---

# 📌 What is NULL?

NULL means **absence of a value** — it is not zero, not empty string, not false.

NULL is **unknown**.

---

# 🔹 Core Rule: NULL is not comparable

```sql
-- These never return true
WHERE salary = NULL    ❌
WHERE salary != NULL   ❌

-- Correct way
WHERE salary IS NULL   ✅
WHERE salary IS NOT NULL ✅
```

---

# 🔹 NULL in Arithmetic

Any arithmetic operation involving NULL returns NULL.

```sql
salary + bonus    -- NULL if bonus is NULL
salary * NULL     -- NULL
100 + NULL        -- NULL
```

---

# 🔹 NULL in Comparisons

Any comparison with NULL returns NULL (not true or false).

```sql
NULL = NULL    -- NULL (not true)
NULL > 100     -- NULL
NULL < 100     -- NULL
```

---

# 🔹 NULL Functions

---

## COALESCE()

Returns the first non-NULL value from a list.

```sql
COALESCE(bonus, 0)
COALESCE(city, 'Unknown')
COALESCE(phone, email, 'No Contact')
```

Most commonly used NULL function in production SQL.

---

## NULLIF()

Returns NULL if two values are equal, otherwise returns the first value.

```sql
NULLIF(discount, 0)    -- returns NULL if discount = 0
NULLIF(city, 'N/A')    -- returns NULL if city = 'N/A'
```

Useful for avoiding division by zero:

```sql
salary / NULLIF(hours_worked, 0)
```

---

## IS DISTINCT FROM

Works like `!=` but handles NULLs safely.

```sql
-- Standard != fails with NULLs
WHERE city != 'Mumbai'         -- excludes NULLs silently

-- IS DISTINCT FROM handles NULLs correctly
WHERE city IS DISTINCT FROM 'Mumbai'   -- includes NULLs
```

## IS NOT DISTINCT FROM

Works like `=` but handles NULLs safely.

```sql
WHERE city IS NOT DISTINCT FROM NULL   -- same as IS NULL
```

---

# 🔹 NULL in Aggregations

Aggregate functions **ignore NULLs** automatically.

```sql
AVG(bonus)   -- ignores NULL rows, averages only non-NULL values
SUM(bonus)   -- ignores NULLs
COUNT(bonus) -- counts only non-NULL values
COUNT(*)     -- counts all rows including NULLs
```

⚠️ This can produce misleading results if not handled carefully.

---

# 🔹 NULL in GROUP BY

NULL is treated as a single group in `GROUP BY`.

```sql
SELECT city, COUNT(*)
FROM employees
GROUP BY city;
-- NULL city employees form their own group
```

---

# 🔹 NULL in JOIN

NULLs never match in JOIN conditions.

```sql
-- If manager_id IS NULL, the row will not match any emp_id
JOIN employees m ON e.manager_id = m.emp_id
-- Rows with NULL manager_id are excluded from INNER JOIN
-- Use LEFT JOIN to retain them
```

---

# 🔹 NULL in ORDER BY

By default in PostgreSQL, NULLs sort **last** in ASC and **first** in DESC.

Control this explicitly:

```sql
ORDER BY bonus ASC NULLS FIRST
ORDER BY bonus DESC NULLS LAST
```

---

# 🔍 Key Function Summary

| Function | Purpose |
|----------|---------|
| `IS NULL` | Check for NULL |
| `IS NOT NULL` | Check for non-NULL |
| `COALESCE()` | Replace NULL with fallback |
| `NULLIF()` | Convert value to NULL conditionally |
| `IS DISTINCT FROM` | NULL-safe inequality |
| `IS NOT DISTINCT FROM` | NULL-safe equality |

---

# ⚠️ Common Mistakes

* Using `= NULL` instead of `IS NULL` ❌
* Forgetting NULLs in arithmetic → silent NULL results ❌
* Using `!=` to exclude NULLs → NULLs silently excluded ❌
* Trusting `AVG()` without checking NULL impact ❌
* Assuming `COUNT(column)` = `COUNT(*)` ❌

---

# ✅ Key Takeaway

NULL means unknown — not zero, not empty.
Always handle NULLs explicitly using `IS NULL`, `COALESCE()`, and `NULLIF()` to avoid silent data errors in production SQL.
