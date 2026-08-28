-- ============================================================
-- PROJECT: Online Bookstore Management System
-- ============================================================

/*
OBJECTIVES COVERED:
1. Database Design using DDL
2. Data Management using DML
3. Data Retrieval using JOINs
4. Advanced Queries using Subqueries & Aggregation
5. Automation, JSON Handling & Reliability
*/

-- ============================================================
-- OBJECTIVE 1: DESIGN AND DEFINE DATABASE STRUCTURE (DDL)
-- ============================================================
-- Task 1: Creating Database Tables for Online Bookstore
-- Create database
CREATE DATABASE online_bookstore;
USE online_bookstore;

-- --------------------
-- USERS TABLE
-- --------------------
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(20) CHECK (role IN ('Customer','Admin'))
);

DESCRIBE users;

-- --------------------
-- AUTHORS TABLE
-- --------------------
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    country VARCHAR(50)
);

DESCRIBE authors;

-- --------------------
-- CATEGORIES TABLE
-- --------------------
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

DESCRIBE categories;

-- --------------------
-- BOOKS TABLE
-- --------------------
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    price DECIMAL(8,2) CHECK (price > 0),
    stock INT CHECK (stock >= 0),
    author_id INT,
    category_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

DESCRIBE books;

-- --------------------
-- ORDERS TABLE
-- --------------------
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_status VARCHAR(20),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

DESCRIBE orders;

-- --------------------
-- ORDER_ITEMS TABLE
-- --------------------
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    quantity INT CHECK (quantity > 0),
    order_id INT,
    book_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

DESCRIBE order_items;

-- --------------------
-- PAYMENTS TABLE
-- --------------------
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    payment_method VARCHAR(30),
    amount DECIMAL(8,2) CHECK (amount >= 0),
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

DESCRIBE payments;

-- --------------------
-- REVIEWS TABLE
-- --------------------
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(255),
    user_id INT,
    book_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

DESCRIBE reviews;

SHOW TABLES;

-- Task 2: Adding Online_Bookstore Records into Tables

-- Insert data into USERS
INSERT INTO users VALUES
(1,'Amit Sharma','amit@gmail.com','Customer'),
(2,'Neha Verma','neha@gmail.com','Customer'),
(3,'Rahul Mehta','rahul@gmail.com','Customer'),
(4,'Sneha Patil','sneha@gmail.com','Customer'),
(5,'Admin One','admin1@bookstore.com','Admin'),
(6,'Admin Two','admin2@bookstore.com','Admin'),
(7,'Karan Joshi','karan7@gmail.com','Customer'),
(8,'Riya Shah','riya8@gmail.com','Customer'),
(9,'Manish Gupta','manish9@gmail.com','Customer'),
(10,'Anjali Kulkarni','anjali10@gmail.com','Customer');

SELECT * FROM users;

-- Insert data into AUTHORS
INSERT INTO authors VALUES
(1,'Robert Martin','USA'),
(2,'J.K. Rowling','UK'),
(3,'George Orwell','UK'),
(4,'Yuval Noah Harari','Israel'),
(5,'James Clear','USA'),
(6,'Dan Brown','USA'),
(7,'Paulo Coelho','Brazil'),
(8,'Stephen King','USA'),
(9,'Mark Manson','USA'),
(10,'Chetan Bhagat','India');

SELECT * FROM authors;

-- Insert data into CATEGORIES
INSERT INTO categories VALUES
(1,'Programming'),
(2,'Fiction'),
(3,'History'),
(4,'Self Development'),
(5,'Thriller'),
(6,'Fantasy'),
(7,'Psychology'),
(8,'Business'),
(9,'Philosophy'),
(10,'Mythology');

SELECT * FROM categories;

-- Insert data into BOOKS
INSERT INTO books VALUES
(1,'Clean Code',550,20,1,1),
(2,'Harry Potter',450,30,2,2),
(3,'1984',300,25,3,2),
(4,'Sapiens',600,15,4,3),
(5,'Atomic Habits',500,40,5,4),
(6,'Inferno',520,25,6,5),
(7,'The Alchemist',399,30,7,9),
(8,'The Hobbit',650,15,8,6),
(9,'Rich Dad Poor Dad',499,40,9,8),
(10,'Five Point Someone',300,45,10,2);

SELECT * FROM books;

-- Insert data into ORDERS
INSERT INTO orders VALUES
(1,'2026-01-05','Delivered',1),
(2,'2026-01-07','Delivered',2),
(3,'2026-01-10','Shipped',3),
(4,'2026-01-12','Placed',4),
(5,'2026-01-15','Delivered',1),
(6,'2026-01-18','Placed',2),
(7,'2026-02-01','Delivered',7),
(8,'2026-02-02','Delivered',8),
(9,'2026-02-03','Delivered',9),
(10,'2026-02-04','Shipped',10);

SELECT * FROM orders;

-- Insert data into ORDER_ITEMS
INSERT INTO order_items VALUES
(1,1,1,1),(2,2,1,3),(3,1,2,2),(4,1,2,5),
(5,2,3,4),(6,1,4,6),(7,1,5,7),(8,2,6,8),
(9,1,7,9),(10,2,8,10);

SELECT * FROM order_items;

-- Insert data into PAYMENTS
INSERT INTO payments VALUES
(1,'UPI',1150,1),
(2,'Card',950,2),
(3,'Debit Card',1200,3),
(4,'UPI',650,5),
(5,'Card',1240,6),
(6,'UPI',399,7),
(7,'Card',520,8),
(8,'UPI',650,9),
(9,'Card',550,10);

SELECT * FROM payments;

-- Insert data into REVIEWS
INSERT INTO reviews VALUES
(1,5,'Excellent book',1,1),
(2,4,'Very engaging',2,2),
(3,5,'Thought provoking',3,3),
(4,4,'Highly informative',4,4),
(5,5,'Life changing',1,5),
(6,4,'Short but impactful',2,7),
(7,5,'Amazing book',7,9),
(8,4,'Worth reading',8,10);

SELECT * FROM reviews;

-- ============================================================
-- OBJECTIVE 2: MANAGE AND MODIFY DATA USING DML
-- ============================================================
-- Task 1: Retrieve Data from Tables (SELECT using multiple tables)

SELECT * FROM users;
SELECT * FROM books;

-- Task 2: Update Data in Tables (UPDATE using different tables)

UPDATE books
SET price = price + 100
WHERE category_id = 2;

SELECT * FROM books;

UPDATE orders
SET order_status = 'Delivered'
WHERE order_id = 6;

SELECT * FROM orders;

-- Task 3: Delete Data from Tables (DELETE using different tables)
INSERT INTO reviews VALUES (9,2,'Good',9,10);
SET SQL_SAFE_UPDATES = 0;

DELETE FROM reviews
WHERE rating < 3;

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM reviews;

SET SQL_SAFE_UPDATES = 0;
INSERT INTO books VALUES (11,'Someone Special',99,45,6,2);
DELETE FROM books
WHERE price < 100;

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM books;

-- ============================================================
-- OBJECTIVE 3: COMBINE DATA USING JOINS
-- ============================================================
-- Task 1: Retrieve Customer and Order Details Using INNER JOIN
-- Customer order details
SELECT u.name, o.order_id, o.order_status
FROM users u
JOIN orders o ON u.user_id = o.user_id;

-- Task 2: Display Order and Book Information Using Multiple JOINs
-- Order details with books
SELECT u.name, b.title, oi.quantity
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN books b ON oi.book_id = b.book_id;

-- Task 3: Identify Users Without Orders Using LEFT JOIN
-- Users without orders
SELECT u.name, o.order_id
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id;

-- ============================================================
-- OBJECTIVE 4: SUBQUERIES AND AGGREGATION
-- ============================================================
-- Task 1: Analyze Book Prices Using Subqueries
-- Books priced above average
SELECT title, price
FROM books
WHERE price > (SELECT AVG(price) FROM books);

-- Task 2: Identify Best-Selling Books Using Aggregation Functions
-- Best selling books
SELECT b.title, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id
GROUP BY b.title
ORDER BY total_sold DESC;

-- Task 3: Find High-Value Customers Using GROUP BY and HAVING
-- High value customers
SELECT name
FROM users
WHERE user_id IN (
    SELECT o.user_id
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    GROUP BY o.user_id
    HAVING SUM(p.amount) > 1000
);

-- ============================================================
-- OBJECTIVE 5: AUTOMATION, JSON & RELIABILITY
-- ============================================================
-- Task 1: Store and Retrieve Semi-Structured Data Using JSON
-- Add JSON column to store order metadata
ALTER TABLE orders
ADD COLUMN order_metadata JSON;

-- Insert JSON data into orders table
UPDATE orders
SET order_metadata = JSON_OBJECT(
    'delivery_type','Express',
    'discount','10%'
)
WHERE order_id = 1;

-- View orders with JSON data
SELECT * FROM orders;

-- Extract specific JSON value
SELECT order_id, order_metadata->>'$.delivery_type' AS delivery
FROM orders;

-- Task 2: Automate Inventory Management Using Database Triggers
-- Trigger to auto reduce stock after order
DELIMITER //

CREATE TRIGGER ReduceStock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE books
    SET stock = stock - NEW.quantity
    WHERE book_id = NEW.book_id
    AND stock >= NEW.quantity;
END //

DELIMITER ;

DROP TRIGGER IF EXISTS ReduceStock;

-- Verify trigger creation
SHOW TRIGGERS FROM online_bookstore;

-- Check stock before trigger execution
SELECT book_id, title, stock
FROM books
WHERE book_id = 1;

-- Insert new order item to activate trigger
INSERT INTO order_items (order_item_id, quantity, order_id, book_id)
VALUES (11, 2, 9, 1);

-- Check stock after trigger execution
SELECT book_id, title, stock
FROM books
WHERE book_id = 1;

SELECT * FROM books;

-- Task 3: Ensure Data Consistency Using Transactions and Rollback
-- Transaction example
START TRANSACTION;

INSERT INTO payments (payment_id, payment_method, amount, order_id)
VALUES (99, 'Test_Payment', 9999, 1);

-- Rollback to prevent incorrect payment entry
ROLLBACK;

-- Verify rollback
SELECT * 
FROM payments
WHERE order_id = 1;

SELECT * 
FROM payments
WHERE payment_id = 99;

-- Task 4: Generate Summary Reports Using Database Views
-- Create reporting view
CREATE VIEW Order_Report AS
SELECT u.name, o.order_id, p.amount
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN payments p ON o.order_id = p.order_id;

-- View generated report
SELECT * FROM Order_Report;

-- ============================================================
-- OBJECTIVE 6: OPTIMIZE PERFORMANCE AND STRENGTHEN DATA SECURITY
-- ============================================================

-- ------------------------------------------------------------
-- Task 1: Improve Query Performance Using Indexes
-- ------------------------------------------------------------

-- Create index on email column for faster user lookup
CREATE INDEX idx_users_email
ON users(email);

-- Create index on order_date for faster date filtering
CREATE INDEX idx_orders_order_date
ON orders(order_date);

-- Create index on book_id in order_items for optimized joins
CREATE INDEX idx_orderitems_book_id
ON order_items(book_id);

-- Create composite index for frequent JOIN between orders and users
CREATE INDEX idx_orders_user_id
ON orders(user_id);

-- Verify indexes
SHOW INDEX FROM users;
SHOW INDEX FROM orders;
SHOW INDEX FROM order_items;


-- Example optimized query using indexed columns
SELECT *
FROM users
WHERE email = 'amit@gmail.com';

SELECT *
FROM orders
WHERE order_date = '2026-01-05';


-- ------------------------------------------------------------
-- Task 2: Enhance Data Security and Access Control
-- ------------------------------------------------------------

-- Role-Based Access Control (Simulated using database users)

-- Create database user for Admin
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin@123';

-- Grant full access to Admin
GRANT ALL PRIVILEGES ON online_bookstore.* 
TO 'admin_user'@'localhost';

-- Create database user for Customer
CREATE USER 'customer_user'@'localhost' IDENTIFIED BY 'Customer@123';

-- Grant limited access to Customer (Read-only access)
GRANT SELECT 
ON online_bookstore.* 
TO 'customer_user'@'localhost';

FLUSH PRIVILEGES;


-- Controlled Transaction to Prevent Unauthorized Updates

START TRANSACTION;

-- Attempt controlled update
UPDATE books
SET price = price + 10
WHERE book_id = 1;

-- If validation fails, rollback
ROLLBACK;

-- Verify no change occurred
SELECT * FROM books WHERE book_id = 1;


-- Additional Data Validation Trigger (Prevent Negative Stock)

DELIMITER //

CREATE TRIGGER PreventNegativeStock
BEFORE UPDATE ON books
FOR EACH ROW
BEGIN
    IF NEW.stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock cannot be negative!';
    END IF;
END //

DELIMITER ;

-- Verify trigger
SHOW TRIGGERS FROM online_bookstore;

