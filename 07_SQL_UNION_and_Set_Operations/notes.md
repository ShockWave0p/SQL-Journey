# 📘 SQL: UNION and Set Operations

---

## 📌 Topics Covered

* `UNION`
* `UNION ALL`
* `INTERSECT`
* `EXCEPT / MINUS`

---

# 🔹 1. UNION

Combines results and removes duplicates.

```sql id="m8q2vx"
SELECT city FROM online_orders
UNION
SELECT city FROM offline_orders;
```

---

# 🔹 2. UNION ALL

Combines results and keeps duplicates.

```sql id="k4p9za"
SELECT city FROM online_orders
UNION ALL
SELECT city FROM offline_orders;
```

---

# 🔍 Difference

| UNION              | UNION ALL        |
| ------------------ | ---------------- |
| Removes duplicates | Keeps duplicates |
| Slower             | Faster           |

---

# 🔹 3. INTERSECT

Returns common rows from both queries.

```sql id="t7w1nd"
SELECT city FROM online_orders
INTERSECT
SELECT city FROM offline_orders;
```

---

# 🔹 4. EXCEPT

Returns rows from first query not present in second.

```sql id="r8m3qc"
SELECT city FROM online_orders
EXCEPT
SELECT city FROM offline_orders;
```

---

# 🧠 Important Rules

Both queries must have:

* Same number of columns
* Compatible data types

---

# ⚠️ Common Mistakes

* Different column counts ❌
* Wrong column order ❌
* Confusing `UNION` vs `UNION ALL` ❌

---

# ✅ Key Takeaway

Set operations combine query results vertically.
