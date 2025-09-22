# Library Management System - SQL Schema

## 📘 Project Overview
This project is part of the **SQL Developer Internship Task 1**.  
It demonstrates database schema design for a **Library Management System**, including entities, relationships, SQL DDL scripts, and an ER diagram.

---

## 🗂️ Database Schema

### Entities & Relationships
- **Users** → Students/Faculty who can borrow books.
- **Authors** → Writers of books.
- **Categories** → Classification of books.
- **Books** → Books available in the library.
- **BorrowRecords** → Track which user borrowed which book.

### Relationships
- One **Author** → Many **Books**
- One **Category** → Many **Books**
- One **User** → Many **BorrowRecords**
- One **Book** → Many **BorrowRecords**

---

## 🛠️ SQL Script

Save the schema in a file called **`library_schema.sql`**:

```sql
-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    user_type ENUM('Student','Faculty') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    category_id INT,
    isbn VARCHAR(20) UNIQUE,
    published_year YEAR,
    available_copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Borrow Records Table
CREATE TABLE BorrowRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
```

---

## 📊 ER Diagram
Below is the ER diagram for the schema:

![ER Diagram](library_er_diagram.png)

---

## 🚀 How to Run
1. Clone this repository:
   ```bash
   git clone <your_repo_url>
   cd <repo_folder>
   ```

2. Open **MySQL Workbench** (or pgAdmin / SQLiteStudio).  
3. Run the SQL script:
   ```sql
   SOURCE library_schema.sql;
   ```
4. Import the **ER diagram** (`library_er_diagram.png`) to visualize schema.

---

## 📌 Key Concepts
- **DDL (Data Definition Language)**
- **Normalization**
- **ER Diagrams**
- **Primary & Foreign Keys**

---

## ✨ Author
- Internship Project by Ashish Nagar
