# 📘 SQL: ORDER BY, LIMIT, DISTINCT

---

## 🔹 ORDER BY

Sorts data.

* `ASC` → ascending (default)
* `DESC` → descending

```sql
SELECT *
FROM sales_orders
ORDER BY total_amount DESC;
```

---

## 🔹 LIMIT

Restricts number of rows returned.

```sql
SELECT *
FROM sales_orders
LIMIT 5;
```

---

## 🔹 OFFSET

Skips rows (used for pagination).

```sql
SELECT *
FROM sales_orders
ORDER BY total_amount DESC
LIMIT 5 OFFSET 5;
```

---

## 🔹 DISTINCT

Removes duplicate values.

```sql
SELECT DISTINCT city
FROM sales_orders;
```

---

## 🧠 Key Concepts

* Sorting is applied **after filtering**
* `LIMIT` should usually be used with `ORDER BY`
* `DISTINCT` works on **full row combinations**

---

## ⚠️ Common Mistakes

* Using `LIMIT` without `ORDER BY`
* Incorrect `DISTINCT` syntax
* Wrong sorting priority
