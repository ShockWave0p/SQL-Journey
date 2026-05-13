# 📘 11 - Advanced Window Functions

---

## 🎯 Objective

Learn advanced analytical SQL using window functions for:

* trend analysis
* row-to-row comparison
* ranking inside windows
* frame-based calculations

---

# 🔹 1. `LAG()`

Returns the value from the previous row in the window.

### Syntax

```sql id="g2k9xp"
LAG(column_name) OVER (
    ORDER BY ...
)
```

### Use Cases

* Compare current day vs previous day
* Detect drops or increases
* Sequential analysis

### Example

```sql id="k8m4zt"
SELECT sale_date,
       sales_amount,
       LAG(sales_amount) OVER (
           ORDER BY sale_date
       ) AS previous_sale
FROM sales;
```

---

# 🔹 2. `LEAD()`

Returns the value from the next row in the window.

### Syntax

```sql id="p5v2qc"
LEAD(column_name) OVER (
    ORDER BY ...
)
```

### Use Cases

* Compare current row with next row
* Forward-looking analysis
* Trend preview

---

# 🔹 3. `FIRST_VALUE()`

Returns the first value in the ordered window.

### Syntax

```sql id="t4w7nd"
FIRST_VALUE(column_name) OVER (
    PARTITION BY ...
    ORDER BY ...
)
```

### Use Cases

* Highest value when ordering `DESC`
* First event in a group
* Baseline comparison

---

# 🔹 4. `LAST_VALUE()`

Returns the last value in the ordered window.

---

## ⚠️ Very Important

The default frame usually ends at the current row.
Because of this, `LAST_VALUE()` often does **not** return the true last value of the partition unless the frame is expanded.

---

## ✅ Correct Full-Partition Version

```sql id="r9m3qc"
LAST_VALUE(column_name) OVER (
    PARTITION BY ...
    ORDER BY ...
    ROWS BETWEEN UNBOUNDED PRECEDING 
         AND UNBOUNDED FOLLOWING
)
```

### Use Cases

* Lowest value in a group when ordering `DESC`
* Final value in a sequence
* End-of-window analysis

---

# 🔹 5. `NTILE()`

Splits ordered rows into buckets.

### Syntax

```sql id="m2x7ly"
NTILE(4) OVER (
    ORDER BY ...
)
```

### Use Cases

* Quartiles
* Percentile-style grouping
* Top/bottom segmentation

---

# 🔹 6. Window Frames

Window frames define which rows participate in the calculation.

A window function has:

* partition
* ordering
* frame

The frame decides which rows the function can see.

---

## 🔍 Default Frame Behavior

Many functions behave as if the frame ends at the current row.
That is why `LAST_VALUE()` can be confusing.

---

## 🔹 ROWS

`ROWS` works with physical rows.

### Example

```sql id="w6k1zr"
SUM(sales_amount) OVER (
    ORDER BY sale_date
    ROWS BETWEEN 2 PRECEDING 
         AND CURRENT ROW
)
```

### Meaning

* Current row
* Previous 2 rows

This creates a 3-row moving calculation.

---

## 📌 Common ROWS Frames

### Running Total

```sql id="q9m4tp"
ROWS BETWEEN UNBOUNDED PRECEDING 
     AND CURRENT ROW
```

### Full Partition

```sql id="z8q3mx"
ROWS BETWEEN UNBOUNDED PRECEDING 
     AND UNBOUNDED FOLLOWING
```

### Moving Window

```sql id="r4p7ly"
ROWS BETWEEN 2 PRECEDING 
     AND CURRENT ROW
```

---

## 🔹 RANGE

`RANGE` works with value-based ranges rather than physical row counts.

### Example

```sql id="n5r1cz"
RANGE BETWEEN 1000 PRECEDING 
     AND CURRENT ROW
```

This is based on values, not row count.

---

# 🔹 7. Running Total

A running total adds values step-by-step over an ordered window.

### Example

```sql id="u7y4pd"
SUM(sales_amount) OVER (
    ORDER BY sale_date
)
```

### Use Cases

* Cumulative sales
* Cumulative salary expense
* Progressive totals

---

# 🔹 8. Moving Average

A moving average calculates an average over a sliding window.

### Example

```sql id="e2t7lt"
AVG(sales_amount) OVER (
    ORDER BY sale_date
    ROWS BETWEEN 2 PRECEDING 
         AND CURRENT ROW
)
```

### Use Cases

* Sales trend smoothing
* Anomaly detection
* Rolling KPIs

---

# 🔍 9. GROUP BY vs Window Functions

| GROUP BY               | Window Function          |
| ---------------------- | ------------------------ |
| Collapses rows         | Keeps rows               |
| Returns grouped output | Returns row-level output |
| Used for summaries     | Used for analytics       |

---

# ⚠️ 10. Common Mistakes

* Forgetting `OVER()` ❌
* Missing `ORDER BY` in sequencing logic ❌
* Using `LAST_VALUE()` without a full frame ❌
* Confusing `ROWS` and `RANGE` ❌
* Filtering window aliases directly in `WHERE` ❌
* Using `GROUP BY` when a window function is needed ❌

---

# 🧠 11. Important Interview Patterns

| Requirement                        | Function                         |
| ---------------------------------- | -------------------------------- |
| Previous vs current row comparison | `LAG()`                          |
| Next row comparison                | `LEAD()`                         |
| First/last value in partition      | `FIRST_VALUE()` / `LAST_VALUE()` |
| Bucket analysis                    | `NTILE()`                        |
| Trend analysis                     | Moving average + running total   |

---

# ✅ Key Takeaway

Advanced window functions analyze row sequences and trends without collapsing the result set.
