# 📘 SQL: Aggregations

---

## 🔹 Aggregate Functions

| Function  | Description |
| --------- | ----------- |
| `COUNT()` | Count rows  |
| `SUM()`   | Total       |
| `AVG()`   | Average     |
| `MIN()`   | Minimum     |
| `MAX()`   | Maximum     |

---

## 🔹 GROUP BY

Used to group rows and apply aggregation.

```sql id="9o2r4k"
SELECT city, SUM(amount)
FROM orders
GROUP BY city;
```

---

## 🔹 HAVING

Used to filter aggregated results.

```sql id="k3d8x1"
SELECT city, SUM(amount)
FROM orders
GROUP BY city
HAVING SUM(amount) > 10000;
```

---

## 🔹 Difference: WHERE vs HAVING

| WHERE           | HAVING         |
| --------------- | -------------- |
| Filters rows    | Filters groups |
| Before grouping | After grouping |

---

## 🧠 Important Rules

* Every non-aggregated column must be in `GROUP BY`
* `WHERE` cannot use aggregate functions
* `HAVING` is used for aggregate filtering

---

## ⚠️ Common Mistakes

* Using `WHERE` with `SUM()` / `COUNT()` ❌
* Forgetting `GROUP BY` columns ❌
* Mixing aggregated & non-aggregated columns ❌
