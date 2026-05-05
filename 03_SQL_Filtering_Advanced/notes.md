# 📘 SQL: Advanced Filtering

---

## 🔹 BETWEEN

Used to filter within a range.

```sql
SELECT *
FROM customers
WHERE age BETWEEN 25 AND 35;
```

---

## 🔹 IN

Used to match multiple values.

```sql
SELECT *
FROM customers
WHERE city IN ('Mumbai', 'Pune');
```

---

## 🔹 LIKE

Used for pattern matching.

| Pattern | Meaning       |
| ------- | ------------- |
| `A%`    | Starts with A |
| `%a`    | Ends with a   |
| `%ar%`  | Contains "ar" |

```sql
SELECT *
FROM customers
WHERE name LIKE 'A%';
```

---

## 🔹 AND / OR Logic

```sql
SELECT *
FROM customers
WHERE city = 'Mumbai'
AND age > 25;
```

⚠️ `AND` has higher priority than `OR`

---

## 🔹 NOT

```sql
SELECT *
FROM customers
WHERE city NOT IN ('Delhi', 'Pune');
```

---

## 🔹 NULL Handling

```sql
SELECT *
FROM customers
WHERE age IS NULL;
```

---

## 🧠 Key Takeaways

* Use `BETWEEN` for ranges
* `IN` is cleaner than multiple `OR` conditions
* `LIKE` is powerful for text filtering
* Be careful with `AND` vs `OR` precedence
