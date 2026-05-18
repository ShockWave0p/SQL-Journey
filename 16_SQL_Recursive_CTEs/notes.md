# 📘 SQL: Recursive CTEs

---

# 🧠 Why Recursive CTEs Matter

Most real-world data has **hierarchical relationships**:

* Employees and their managers
* Product categories and subcategories
* Organizational charts
* File system folder structures
* Bill of Materials (parts inside parts)
* Menu systems and navigation trees

Regular SQL cannot traverse these relationships dynamically.
Recursive CTEs solve this problem by allowing a query to **call itself** repeatedly until a condition is met.

They are heavily used in:

* Data Engineering pipelines
* Organizational analytics
* Graph traversal
* Lineage tracking
* ETL hierarchy processing

---

# 📌 What is a Recursive CTE?

A Recursive CTE is a CTE that **references itself** in its own definition.

It works in two parts:

1. **Anchor Member** → the starting point (base case)
2. **Recursive Member** → the part that calls the CTE again and again

The recursion continues until no more rows are returned.

---

# 🔹 Basic Syntax

```sql
WITH RECURSIVE cte_name AS (

    -- Anchor Member (starting point)
    SELECT ...
    FROM table
    WHERE condition

    UNION ALL

    -- Recursive Member (calls itself)
    SELECT ...
    FROM table
    JOIN cte_name
    ON join_condition

)
SELECT *
FROM cte_name;
```

---

# 🔹 Key Rules

* `WITH RECURSIVE` keyword is required in PostgreSQL
* Anchor and recursive members are combined using `UNION ALL`
* Recursion stops when the recursive member returns zero rows
* Always include a **termination condition** to prevent infinite loops
* Use a `level` counter as a safety mechanism and depth tracker

---

# 🔹 Example: Employee Hierarchy

### Goal: Show all employees under a given manager

```sql
WITH RECURSIVE org_chart AS (

    -- Anchor: start with the top-level manager
    SELECT emp_id,
           emp_name,
           manager_id,
           1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive: find employees reporting to previous level
    SELECT e.emp_id,
           e.emp_name,
           e.manager_id,
           o.level + 1
    FROM employees e
    JOIN org_chart o
    ON e.manager_id = o.emp_id

)
SELECT *
FROM org_chart;
```

### How it works step by step:

| Iteration | What Happens |
|-----------|-------------|
| Step 1 | Anchor runs → finds the CEO (manager_id IS NULL) |
| Step 2 | Recursive runs → finds all direct reports of CEO |
| Step 3 | Recursive runs again → finds reports of those employees |
| Step 4 | Continues until no more employees are found |

---

# 🔹 Level Tracking

Adding a `level` column is a standard pattern in Recursive CTEs.

* Level 1 → top of hierarchy (CEO, root category)
* Level 2 → direct reports / subcategories
* Level 3 → their reports / sub-subcategories

```sql
WITH RECURSIVE hierarchy AS (

    SELECT emp_id,
           emp_name,
           manager_id,
           1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id,
           e.emp_name,
           e.manager_id,
           h.level + 1
    FROM employees e
    JOIN hierarchy h
    ON e.manager_id = h.emp_id

)
SELECT emp_name,
       level
FROM hierarchy
ORDER BY level;
```

---

# 🔹 Path Building

Build the full path string from root to each node.

```sql
WITH RECURSIVE hierarchy AS (

    SELECT emp_id,
           emp_name,
           manager_id,
           emp_name::TEXT AS path
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id,
           e.emp_name,
           e.manager_id,
           h.path || ' → ' || e.emp_name
    FROM employees e
    JOIN hierarchy h
    ON e.manager_id = h.emp_id

)
SELECT emp_name,
       path
FROM hierarchy;
```

---

# 🔹 UNION vs UNION ALL in Recursive CTEs

| Feature | UNION | UNION ALL |
|---------|-------|-----------|
| Duplicates | Removed | Kept |
| Performance | Slower | Faster |
| Standard choice | No | Yes |

`UNION ALL` is used in almost all Recursive CTEs because hierarchy traversal rarely produces duplicates and it is significantly faster.

---

# 🔹 Preventing Infinite Loops

Always ensure the recursion has a **termination condition**.

**Strategy 1: Natural termination**
The join condition returns no rows when no children exist — recursion stops automatically.

**Strategy 2: Level depth limit**
```sql
WHERE h.level < 10
```

**Strategy 3: LIMIT clause**
```sql
SELECT * FROM hierarchy LIMIT 100;
```

---

# 🔍 Regular CTE vs Recursive CTE

| Feature | Regular CTE | Recursive CTE |
|---------|-------------|---------------|
| Calls itself | No | Yes |
| Use case | Flat data | Hierarchical data |
| Keyword | `WITH` | `WITH RECURSIVE` |
| Termination | N/A | Required |
| Complexity | Low | Medium |

---

# 🚀 Common Use Cases in Data Engineering

| Use Case | Description |
|----------|-------------|
| Org chart traversal | Find all employees under a manager |
| Product category hierarchy | Find all subcategories under a root |
| Bill of Materials | Find all components inside a product |
| Lineage tracking | Find all upstream/downstream dependencies |
| Folder structure | Traverse nested folder paths |
| Network graph traversal | Find connected nodes |

---

# ⚠️ Common Mistakes

* Forgetting `WITH RECURSIVE` keyword ❌
* Using `UNION` instead of `UNION ALL` ❌
* No termination condition → infinite loop ❌
* Joining on the wrong column in the recursive member ❌
* Confusing anchor member and recursive member ❌
* Casting issues when building path strings ❌

---

# ✅ Key Takeaway

Recursive CTEs allow SQL to traverse hierarchical and graph-like data structures — a critical skill in Data Engineering for org charts, category trees, and pipeline lineage tracking.
