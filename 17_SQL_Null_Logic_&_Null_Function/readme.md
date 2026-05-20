# 📘 17 - SQL NULL Logic & NULL Functions

---

## 🎯 Objective

Master NULL handling in SQL to write accurate, production-safe queries.

---

## 📌 Topics Covered

* What NULL means in SQL
* NULL in comparisons and arithmetic
* `IS NULL` / `IS NOT NULL`
* `COALESCE()`
* `NULLIF()`
* `IS DISTINCT FROM` / `IS NOT DISTINCT FROM`
* NULL in aggregations
* NULL in JOINs
* NULL in GROUP BY
* NULL in ORDER BY

---

## 🧠 Why This Topic Matters

NULL bugs are among the most common and silent errors in production SQL:

* Filters silently exclude NULL rows
* Arithmetic returns NULL without warning
* Aggregations produce misleading averages
* JOINs silently drop unmatched NULL rows

Handling NULLs correctly is a core Data Engineering skill.

---

## 🚀 Key Learnings

* Never compare NULL with `=` or `!=`
* Use `COALESCE()` for fallback values in ETL pipelines
* Use `NULLIF()` to prevent division-by-zero errors
* Understand how NULLs behave in `COUNT`, `AVG`, `SUM`
* Use `IS DISTINCT FROM` for NULL-safe comparisons

---

## ⭐ Most Important Concept

NULL is unknown — not zero, not empty string.
Any comparison or arithmetic with NULL returns NULL.
Always handle NULLs explicitly.

---

## ⚠️ Common Mistakes

* Using `= NULL` instead of `IS NULL` ❌
* Silent NULL exclusion in `!=` filters ❌
* Misleading `AVG()` when NULLs exist ❌
* Assuming `COUNT(column)` equals `COUNT(*)` ❌

---

## 🔍 Real-World Applications

| Use Case | Description |
|----------|-------------|
| ETL pipelines | Replace NULLs with defaults using `COALESCE()` |
| Data validation | Identify missing fields with `IS NULL` |
| Financial reporting | Avoid division-by-zero with `NULLIF()` |
| Customer analytics | Handle missing cities, phones, emails |
| Data cleaning | Standardize NULL vs placeholder values |

---

## 📂 Files

* `setup.sql` → employees and orders tables with intentional NULLs
* `notes.md` → NULL concepts and function reference
* `SQL Practice: NULL Logic Problems.md` → core practice questions
* `SQL Practice: NULL Logic Business Scenarios.md` → business scenario questions
* `solution.sql` → full solutions

---

## ⏭️ Next Topic

`18 - Views & Materialized Views`
