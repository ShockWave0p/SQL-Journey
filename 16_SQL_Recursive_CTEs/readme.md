# 📘 16 - SQL Recursive CTEs

---

## 🎯 Objective

Learn how to traverse hierarchical and graph-like data structures
using Recursive Common Table Expressions in SQL.

---

## 📌 Topics Covered

* `WITH RECURSIVE` syntax
* Anchor Member vs Recursive Member
* Level tracking in hierarchies
* Full path generation
* Traversing organizational charts
* Traversing product category trees
* Termination conditions
* Leaf node identification
* Recursive CTE vs Regular CTE

---

## 🧠 Why This Topic Matters

Hierarchical data is everywhere in real business systems:

* **Organizational charts** → who reports to whom
* **Product catalogs** → categories, subcategories, sub-subcategories
* **Bill of Materials** → parts inside products inside assemblies
* **Data lineage** → upstream and downstream pipeline dependencies
* **File systems** → nested folder structures
* **Network graphs** → connected node traversal

Regular SQL cannot dynamically traverse these relationships.
Recursive CTEs are the **standard solution** in Data Engineering and Analytics Engineering.

---

## 🚀 Key Learnings

* Write anchor + recursive members correctly
* Track depth levels in hierarchies
* Build path strings from root to leaf
* Identify leaf nodes vs internal nodes
* Apply hierarchy logic to business analytics
* Prevent infinite loop scenarios
* Combine Recursive CTEs with `CASE WHEN` and aggregations

---

## ⭐ Most Important Concept

A Recursive CTE has two parts:

1. **Anchor Member** → defines the starting rows (root level)
2. **Recursive Member** → joins back to the CTE to find the next level

The recursion runs until the recursive member returns zero rows.

---

## ⚠️ Common Mistakes

* Forgetting `WITH RECURSIVE` keyword ❌
* Using `UNION` instead of `UNION ALL` ❌
* Missing termination condition → infinite loop ❌
* Wrong join column in the recursive member ❌
* Confusing anchor and recursive parts ❌

---

## 🔍 Real-World Applications

| Use Case | Industry |
|----------|----------|
| Org chart reporting | HR Analytics |
| Product category trees | E-commerce |
| Bill of Materials | Manufacturing |
| Pipeline lineage graphs | Data Engineering |
| Network traversal | Telecom / Finance |
| Menu / navigation trees | Web Applications |

---

## 📂 Files

* `setup.sql` → employees and categories hierarchy tables
* `notes.md` → concept explanations and syntax
* `SQL Practice: Recursive CTE Problems.md` → core practice questions
* `SQL Practice: Recursive CTE Business Scenarios.md` → business scenario questions
* `solution.sql` → full solutions

---

## ⏭️ Next Topic

`17 - NULL Logic & NULL Functions`
