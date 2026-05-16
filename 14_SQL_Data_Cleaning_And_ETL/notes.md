# 📘 SQL: Data Cleaning & ETL

---

# 🎯 Objective

Learn production-style SQL cleanup and transformation workflows used in real-world data systems.

---

# 📌 What is ETL?

ETL stands for:

* **Extract**
* **Transform**
* **Load**

SQL is heavily used in the **Transform** phase.

---

# ⚠️ Common Data Problems

Real-world datasets often contain:

* Inconsistent casing
* Extra spaces
* Malformed emails
* Invalid phone numbers
* `NULL` values
* Duplicate delimiters
* Mixed formatting

---

# 🧠 Core Cleaning Functions

| Function     | Purpose             |
| ------------ | ------------------- |
| `TRIM()`     | Remove extra spaces |
| `LOWER()`    | Normalize text      |
| `UPPER()`    | Standardize casing  |
| `INITCAP()`  | Proper formatting   |
| `REPLACE()`  | Cleanup patterns    |
| `POSITION()` | Validation checks   |
| `LENGTH()`   | Detect anomalies    |
| `CONCAT()`   | Generate labels     |

---

# 🔄 Cleanup Workflow

A typical ETL cleaning pipeline:

```text id="g7k2xp"
Raw Data
    ↓
Trim Spaces
    ↓
Normalize Casing
    ↓
Validate Format
    ↓
Replace Invalid Patterns
    ↓
Generate Clean Output
```

---

# 🔹 Email Validation Logic

Basic email validation checks:

* Contains `'@'`
* Contains `'.com'`
* No double `'@@'`

---

# 🔹 Phone Cleanup Logic

Typical cleanup tasks:

* Remove dashes
* Remove spaces
* Remove brackets
* Validate digit count

---

# 🔹 NULL Handling

Use `COALESCE()` to replace missing values.

### Example

```sql id="k4m9zt"
COALESCE(column_name, 'Unknown')
```

---

# 🚀 Important ETL Principle

Never overwrite raw data directly.

Instead, follow a layered architecture:

```text id="p2v8qc"
Raw Layer
    ↓
Cleaned Layer
    ↓
Analytics Layer
```

---

# ⚠️ Common Mistakes

* Cleaning before validation ❌
* Forgetting `NULL` handling ❌
* Partial standardization ❌
* Inconsistent transformations ❌

---

# ✅ Key Takeaway

Production SQL is mostly about:

* cleanup
* validation
* transformation
