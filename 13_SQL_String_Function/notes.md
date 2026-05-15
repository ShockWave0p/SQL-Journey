# 📘 SQL: String Functions

---

# 🧠 Why String Functions Matter

String functions help clean, format, and transform textual data.

They are heavily used in:

* ETL pipelines
* Data cleaning
* Reporting
* Customer analytics
* Search systems

---

# 🔹 `UPPER()`

Converts text to uppercase.

### Syntax

```sql id="g2k9xp"
UPPER(column_name)
```

### Example

```sql id="k8m4zt"
SELECT UPPER(customer_name)
FROM customers;
```

---

# 🔹 `LOWER()`

Converts text to lowercase.

### Syntax

```sql id="p5v2qc"
LOWER(column_name)
```

---

# 🔹 `INITCAP()` *(PostgreSQL)*

Capitalizes the first letter of each word.

### Syntax

```sql id="t4w7nd"
INITCAP(customer_name)
```

---

# 🔹 `LENGTH()`

Returns character count.

### Syntax

```sql id="r9m3qc"
LENGTH(customer_name)
```

---

# 🔹 `SUBSTRING()`

Extracts part of text.

### Syntax

```sql id="m2x7ly"
SUBSTRING(email FROM 1 FOR 5)
```

---

# 🔹 `LEFT()`

Returns left-side characters.

### Syntax

```sql id="w6k1zr"
LEFT(phone_number, 4)
```

---

# 🔹 `RIGHT()`

Returns right-side characters.

### Syntax

```sql id="q9m4tp"
RIGHT(phone_number, 4)
```

---

# 🔹 `CONCAT()`

Joins strings together.

### Syntax

```sql id="z8q3mx"
CONCAT(customer_name, ' - ', city)
```

---

# 🔹 `REPLACE()`

Replaces text.

### Syntax

```sql id="r4p7ly"
REPLACE(email, 'gmail.com', 'company.com')
```

---

# 🔹 `TRIM()`

Removes extra spaces.

### Syntax

```sql id="n5r1cz"
TRIM(customer_name)
```

---

# 🔹 `POSITION()`

Finds location of a substring.

### Syntax

```sql id="u7y4pd"
POSITION('@' IN email)
```

---

# 🔹 `LIKE`

Used for pattern matching.

### Example

```sql id="e2t7lt"
WHERE email LIKE '%gmail.com'
```

---

# 🔹 `ILIKE` *(PostgreSQL)*

Case-insensitive `LIKE`.

### Example

```sql id="f8q2mn"
WHERE email ILIKE '%gmail.com'
```

---

# 🚀 Common Uses

* Standardization
* Formatting
* Text extraction
* Data masking
* Pattern searching

---

# ⚠️ Common Mistakes

* Forgetting case sensitivity ❌
* Substring index confusion ❌
* Wrong `LIKE` patterns ❌
* Unnecessary `CONCAT()` usage ❌

---

# ✅ Key Takeaway

String functions clean, format, and transform textual data efficiently.
