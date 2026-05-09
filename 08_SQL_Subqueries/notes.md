# 📘 SQL: Subqueries

---

## 🎯 Objective

Learn how to solve SQL problems by placing one query inside another.

Subqueries are used heavily in:

* interviews
* reporting
* business analysis
* ETL validation
* data comparison logic

---

# 📌 What is a Subquery?

A subquery is a query inside another query.

```sql id="m8q2vx"
SELECT *
FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
);
```

---

# 🔹 Main Types of Subqueries

---

## 🔹 1. Scalar Subquery

Returns a single value.

### Used with

* `=`
* `>`
* `<`
* `>=`
* `<=`

### Example

```sql id="k4p9za"
SELECT *
FROM products
WHERE list_price > (
    SELECT AVG(list_price)
    FROM products
);
```

---

## 🔹 2. Multi-row Subquery

Returns multiple values.

### Used with

* `IN`
* `NOT IN`

### Example

```sql id="t7w1nd"
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);
```

---

## 🔹 3. Correlated Subquery

The inner query depends on the outer query.

### Example

```sql id="r8m3qc"
SELECT *
FROM orders o
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
    WHERE customer_id = o.customer_id
);
```

---

## 🔹 4. Subquery in FROM

Creates a derived table.

### Example

```sql id="p2x7ly"
SELECT city, AVG(city_spend)
FROM (
    SELECT c.city, SUM(o.total_amount) AS city_spend
    FROM customers c
    JOIN orders o 
        ON c.customer_id = o.customer_id
    GROUP BY c.city
) t;
```

---

# 🧠 Key Rules

* A scalar subquery must return one value
* `IN` is used when the subquery returns multiple values
* `EXISTS` checks whether rows exist
* `NOT EXISTS` is useful for missing-record logic
* Correlated subqueries are slower but powerful

---

# 🔍 WHERE vs HAVING vs Subquery

* `WHERE` filters rows before grouping
* `HAVING` filters grouped results
* Subqueries are used when one query depends on another query result

---

# ⚠️ Common Mistakes

* Using `=` with a subquery that returns multiple rows ❌
* Forgetting alias in subquery inside `FROM` ❌
* Mixing row-level logic with grouped logic ❌
* Writing correlated subqueries without understanding dependency ❌
* Using `NOT IN` with `NULL` values carelessly ❌

---

# 🧩 Important Thinking Pattern

Ask yourself:

* What do I need to compare?
* Is the comparison against one value or many values?
* Do I need the result of another query first?
* Is the condition row-level or group-level?

---

# ✅ Key Takeaway

Subqueries help you compare data with data, not just rows with rows.
