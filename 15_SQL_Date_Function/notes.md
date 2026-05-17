# 📘 SQL: Date Functions

---

# 🧠 Why Date Functions Matter

Most business analytics depends on time-based analysis.

### Common Examples

* Monthly revenue analysis
* Weekly growth tracking
* Delivery monitoring
* Employee tenure calculation
* Quarterly reporting

---

# 🔹 `CURRENT_DATE`

Returns today's date.

### Example

```sql id="g2k9xp"
SELECT CURRENT_DATE;
```

---

# 🔹 `EXTRACT()`

Extracts specific parts of a date.

### Examples

```sql id="k8m4zt"
EXTRACT(YEAR FROM order_date)
```

```sql id="p5v2qc"
EXTRACT(MONTH FROM order_date)
```

```sql id="t4w7nd"
EXTRACT(DAY FROM order_date)
```

---

# 🔹 `AGE()`

Calculates the difference between two dates.

### Example

```sql id="r9m3qc"
AGE(delivery_date, order_date)
```

---

# 🔹 `DATE_TRUNC()`

Groups dates into time buckets.

### Common Buckets

* Month
* Year
* Week

### Example

```sql id="m2x7ly"
DATE_TRUNC('month', order_date)
```

---

# 🔹 `INTERVAL`

Adds or subtracts time from dates.

### Example

```sql id="w6k1zr"
order_date + INTERVAL '7 days'
```

---

# 🔹 Date Difference

Calculates the number of days between dates.

### Example

```sql id="q9m4tp"
delivery_date - order_date
```

---

# 🚀 Common Uses

* Reporting
* Trend analysis
* Cohort analysis
* Delivery tracking
* Retention analysis

---

# ⚠️ Common Mistakes

* Mixing `TIMESTAMP` and `DATE` ❌
* Wrong date extraction ❌
* Incorrect grouping ❌
* Forgetting date truncation ❌

---

# ✅ Key Takeaway

Date functions enable business time intelligence and trend analysis.
