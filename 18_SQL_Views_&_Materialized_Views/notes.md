# 📘 SQL: Views & Materialized Views

---

# 🧠 Why Views Matter

In production SQL, the same complex queries are reused constantly:
* department salary reports
* active order summaries
* customer revenue dashboards

Writing the same 20-line query repeatedly is:
* error-prone
* hard to maintain
* not scalable

Views solve this by storing the query logic — not the data.

---

# 📌 What is a View?

A View is a **saved SQL query** that behaves like a virtual table.

* No data is stored
* Every time you query the view, the underlying query runs fresh
* Changes in base tables are reflected immediately

---

# 🔹 Creating a View

```sql
CREATE VIEW view_name AS
SELECT ...
FROM table
WHERE condition;
```

---

# 🔹 Querying a View

```sql
SELECT *
FROM view_name;

SELECT *
FROM view_name
WHERE department = 'Engineering';
```

Views behave exactly like tables in SELECT statements.

---

# 🔹 Replacing a View

```sql
CREATE OR REPLACE VIEW view_name AS
SELECT ...
FROM table;
```

---

# 🔹 Dropping a View

```sql
DROP VIEW view_name;
DROP VIEW IF EXISTS view_name;
```

---

# 🔹 Example: Department Salary View

```sql
CREATE VIEW dept_salary_summary AS
SELECT department,
       COUNT(emp_id)  AS employee_count,
       AVG(salary)    AS avg_salary,
       SUM(salary)    AS total_salary
FROM employees
GROUP BY department;
```

Now anyone can query:

```sql
SELECT * FROM dept_salary_summary;
```

---

# 📌 What is a Materialized View?

A Materialized View is a view that **physically stores the query result**.

* Data is saved on disk at creation time
* Does NOT update automatically when base tables change
* Must be refreshed manually

---

# 🔹 Creating a Materialized View

```sql
CREATE MATERIALIZED VIEW view_name AS
SELECT ...
FROM table;
```

---

# 🔹 Refreshing a Materialized View

```sql
REFRESH MATERIALIZED VIEW view_name;
```

Run this after base table data changes.

---

# 🔹 Dropping a Materialized View

```sql
DROP MATERIALIZED VIEW view_name;
```

---

# 🔍 View vs Materialized View

| Feature | View | Materialized View |
|---------|------|-------------------|
| Stores data | No | Yes |
| Always fresh | Yes | No — needs REFRESH |
| Query speed | Slower (reruns query) | Faster (reads stored data) |
| Storage used | None | Yes |
| Best for | Simple reusable logic | Heavy aggregations, dashboards |

---

# 🔹 When to Use Each

**Use a View when:**
* Data must always be up to date
* Query is simple and fast
* You want to simplify access to complex joins

**Use a Materialized View when:**
* Query is expensive (large aggregations, many joins)
* Data doesn't change frequently
* Query speed is critical (dashboards, reports)

---

# 🚀 Real-World Usage

| Tool | Views Used For |
|------|---------------|
| dbt | Models are essentially views or materialized views |
| Snowflake | Materialized views for expensive warehouse queries |
| BigQuery | Materialized views for dashboard acceleration |
| PostgreSQL | Views for role-based data access control |
| Redshift | Late-binding views for cross-schema queries |

---

# ⚠️ Common Mistakes

* Treating views as performance optimizations — they are not ❌
* Forgetting to REFRESH materialized views after data changes ❌
* Creating views on top of views excessively → hard to debug ❌
* Assuming materialized views auto-update ❌

---

# ✅ Key Takeaway

Views simplify and reuse query logic.
Materialized views trade freshness for speed.
Both are heavily used in Data Engineering and Analytics Engineering pipelines.
