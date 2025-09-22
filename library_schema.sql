CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(15),
  user_type ENUM('Student','Faculty'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  country VARCHAR(50)
);

CREATE TABLE Categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) UNIQUE
);

CREATE TABLE Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200),
  author_id INT,
  category_id INT,
  isbn VARCHAR(20) UNIQUE,
  published_year YEAR,
  available_copies INT,
  FOREIGN KEY (author_id) REFERENCES Authors(author_id),
  FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE BorrowRecords (
  record_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  book_id INT,
  borrow_date DATE,
  return_date DATE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
