# SQL Developer Internship – Task 3 (MySQL Workbench Solution)

This repository contains the solution for **Task 3: Writing Basic SELECT Queries**, completed in **MySQL Workbench**.

---

## 📂 Files in this Repo
- **task3_solution_mysql.sql**  
  SQL script that:
  - Creates tables (`departments`, `employees`, `customers`, `products`, `orders`, `order_items`)
  - Inserts sample data
  - Contains multiple `SELECT` queries demonstrating filtering, sorting, aliasing, DISTINCT, LIMIT, IN, LIKE, BETWEEN, ORDER BY, etc.

- **screenshots/** *(optional)*  
  Folder with screenshots of query execution and outputs from MySQL Workbench.

---

## 🛠️ How to Run

1. Open **MySQL Workbench**.  
2. Create a new schema (database), for example:
   ```sql
   CREATE DATABASE task3_db;
   USE task3_db;
   ```
3. Open a new **SQL tab**, paste the contents of `task3_solution_mysql.sql`, and execute it.  
   - The script will:  
     - Drop existing tables (if any)  
     - Create fresh tables with constraints  
     - Insert sample data  
     - Run all required `SELECT` queries  

4. Run each `SELECT` query individually to verify outputs.  

---

## ✅ Examples of Queries

### 1. Select all employees
```sql
SELECT * FROM employees;
```

### 2. Employees with Gmail accounts
```sql
SELECT id, first_name, last_name, email
FROM employees
WHERE email LIKE '%@gmail.com';
```

### 3. Highest paid employees (Top 3)
```sql
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
```

### 4. Distinct customer cities
```sql
SELECT DISTINCT city FROM customers;
```

### 5. Orders above $100, most recent first
```sql
SELECT o.id AS order_id,
       c.name AS customer_name,
       o.order_date,
       o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE o.total_amount > 100
ORDER BY o.order_date DESC
LIMIT 5;
```

---

## 📸 Screenshots
Please check the `screenshots/` folder for proof of query execution in **MySQL Workbench**.

---

## 🔑 Key SQL Concepts Covered
- `SELECT *` vs column projection  
- Filtering rows with `WHERE`, `AND`, `OR`  
- Pattern matching with `LIKE`  
- Range queries with `BETWEEN`  
- Sorting with `ORDER BY ASC | DESC`  
- Limiting rows with `LIMIT` & pagination with `OFFSET`  
- `=` vs `IN`  
- `DISTINCT` for unique values  
- Aliasing columns & computed expressions  
- Aggregation with `COUNT(DISTINCT ...)`  

---

## 📝 Notes
- Script tested on **MySQL 8.x**  
- Can be re-run safely (tables are dropped before creation)  
- Default schema name is not included, so make sure to `USE your_schema_name;` before executing  

---

👨‍💻 Author: *[Your Name Here]*  
