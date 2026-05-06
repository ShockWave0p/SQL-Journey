# 📘 SQL: JOINS

---

## 📌 What is a JOIN?

A `JOIN` combines rows from multiple tables using a related column.

---

# 🔹 Types of JOINS

---

## 🔹 INNER JOIN

Returns matching rows from both tables.

```sql id="r029ba"
SELECT *
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
```

---

## 🔹 LEFT JOIN

Returns all rows from the left table and matching rows from the right table.

```sql id="ktnubr"
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
```

---

## 🔹 RIGHT JOIN

Returns all rows from the right table and matching rows from the left table.

```sql id="zggkth"
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;
```

---

## 🔹 FULL OUTER JOIN

Returns all matching and non-matching rows from both tables.

```sql id="rzhhys"
SELECT *
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;
```

---

# 🧠 Important Concepts

## 🔹 Primary Key

Uniquely identifies rows.

## 🔹 Foreign Key

Connects one table to another.

---

# 🔄 JOIN Flow

```text id="ukf5rk"
customers.customer_id
        ↓
orders.customer_id
```

---

# ⚠️ Common Mistakes

* Missing `ON` condition ❌
* Wrong join key ❌
* Duplicate rows misunderstanding ❌
* Confusing `INNER JOIN` vs `LEFT JOIN` ❌

---

# ✅ Key Takeaway

`JOINs` are the foundation of relational databases and analytics.
