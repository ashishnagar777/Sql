-- task3_solution_mysql.sql
-- Drop old tables (so you can re-run safely)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- 1) Departments
CREATE TABLE departments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  location VARCHAR(100)
);

INSERT INTO departments (name, location) VALUES
('HR', 'New York'),
('Engineering', 'San Francisco'),
('Sales', 'Chicago');

-- 2) Employees
CREATE TABLE employees (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  department_id INT,
  salary DECIMAL(10,2),
  hire_date DATE,
  city VARCHAR(100),
  FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO employees (first_name, last_name, email, department_id, salary, hire_date, city) VALUES
('John','Doe','john.doe@gmail.com',2,80000,'2019-03-15','San Francisco'),
('Alice','Smith','alice.smith@yahoo.com',2,95000,'2021-06-01','San Francisco'),
('Bob','Johnson','bob.j@gmail.com',1,55000,'2020-11-20','New York'),
('Carol','Lee','carol.lee@outlook.com',3,60000,'2022-02-10','Chicago'),
('Dave','Brown','dave.b@company.com',2,45000,'2023-01-10','Austin'),
('Eve','Davis','eve.d@gmail.com',3,70000,'2018-12-05','Chicago'),
('Frank','White','frank.white@gmail.com',2,120000,'2016-08-22','San Jose'),
('Grace','King','grace.king@yahoo.com',1,50000,'2024-05-02','New York');

-- 3) Customers
CREATE TABLE customers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  city VARCHAR(100),
  signup_date DATE
);

INSERT INTO customers (name, email, city, signup_date) VALUES
('Acme Co','contact@acme.com','Boston','2020-01-05'),
('Bob Retail','bob.retail@gmail.com','Chicago','2021-09-10'),
('Lina Store','lina.store@yahoo.com','San Francisco','2022-04-22');

-- 4) Products
CREATE TABLE products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(100),
  price DECIMAL(10,2),
  stock INT
);

INSERT INTO products (name, category, price, stock) VALUES
('Laptop X','Electronics',1200.00,10),
('Wireless Mouse','Electronics',25.50,150),
('T-Shirt','Clothing',15.00,200),
('Coffee Table Book','Books',35.00,40),
('Bluetooth Speaker','Electronics',80.00,25);

-- 5) Orders
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  status VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1,'2023-06-10',1255.50,'completed'),
(2,'2023-07-01',80.00,'shipped'),
(3,'2024-01-05',35.00,'completed');

-- 6) Order items
CREATE TABLE order_items (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_id INT,
  quantity INT,
  item_price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO order_items (order_id, product_id, quantity, item_price) VALUES
(1,1,1,1200.00),
(1,2,1,25.50),
(2,5,1,80.00),
(3,4,1,35.00);

-------------------------------------------------------------------
-- SELECT query examples
-------------------------------------------------------------------

SELECT * FROM employees;

SELECT id,
       CONCAT(first_name, ' ', last_name) AS full_name,
       email,
       salary
FROM employees;

SELECT id, first_name, last_name, department_id, city
FROM employees
WHERE department_id = 2;

SELECT id, first_name, last_name, salary
FROM employees
WHERE department_id = 2 AND salary > 80000;

SELECT id, first_name, last_name, salary, city
FROM employees
WHERE salary > 100000 OR city = 'Austin';

SELECT id, first_name, last_name, email
FROM employees
WHERE email LIKE '%@gmail.com';

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'A%';

SELECT id, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31';

SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 90000;

SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC;

SELECT first_name, last_name, department_id, salary
FROM employees
ORDER BY department_id ASC, salary DESC;

SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

SELECT first_name, last_name, salary
FROM employees
ORDER BY id
LIMIT 3 OFFSET 3;

SELECT * FROM departments WHERE id = 2;
SELECT * FROM departments WHERE id IN (1, 3);

SELECT DISTINCT city FROM customers;

SELECT oi.id AS order_item_id,
       o.id AS order_id,
       p.name AS product_name,
       oi.quantity,
       oi.item_price,
       (oi.quantity * oi.item_price) AS line_total
FROM order_items oi
JOIN products p ON oi.product_id = p.id
JOIN orders o ON oi.order_id = o.id;

SELECT o.id AS order_id,
       c.name AS customer_name,
       o.order_date,
       o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE o.total_amount > 100
ORDER BY o.order_date DESC
LIMIT 5;

SELECT COUNT(DISTINCT category) AS distinct_categories FROM products;
