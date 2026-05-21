# 📘 18 - SQL Views & Materialized Views

---

## 🎯 Objective

Learn how to create, manage, and use Views and Materialized Views
for reusable, maintainable, and performant SQL in production systems.

---

## 📌 Topics Covered

* Creating and querying Views
* Replacing and dropping Views
* Creating and refreshing Materialized Views
* View vs Materialized View comparison
* When to use each in production

---

## 🧠 Why This Topic Matters

Views and Materialized Views are core tools in:

* Analytics Engineering (dbt models)
* Data Warehouse design
* Dashboard acceleration
* Role-based data access
* ETL pipeline simplification

---

## 🚀 Key Learnings

* Store reusable query logic using Views
* Accelerate expensive queries using Materialized Views
* Understand freshness vs performance tradeoffs
* Apply views in real reporting and ETL scenarios

---

## ⭐ Most Important Concept

* **View** → saves the query, not the data. Always fresh, no storage.
* **Materialized View** → saves the data. Fast, but needs manual refresh.

---

## ⚠️ Common Mistakes

* Assuming views improve query performance ❌
* Forgetting to REFRESH materialized views ❌
* Over-nesting views on top of views ❌
* Assuming materialized views auto-update ❌

---

## 🔍 Real-World Applications

| Use Case | Tool |
|----------|------|
| dbt models | Views / Materialized Views |
| Dashboard acceleration | Materialized Views |
| Data access control | Views |
| Warehouse reporting | Materialized Views |
| ETL simplification | Views |

---

## 📂 Files

* `setup.sql` → employees and orders tables
* `notes.md` → concepts and syntax reference
* `SQL Practice: Views Problems.md` → core practice questions
* `SQL Practice: Views Business Scenarios.md` → business scenario questions
* `solution.sql` → full solutions

---

## ⏭️ Next Topic

`19 - Query Optimization & Performance Thinking`
