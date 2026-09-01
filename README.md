📚 Online Bookstore Management System

📌 Project Overview

The Online Bookstore Management System is a SQL-based database
project designed to manage and analyze the core operations of an online
bookstore. It stores information about users, authors, categories,
books, orders, order items, payments, and reviews.

The project demonstrates practical SQL concepts including DDL, DML,
JOINs, subqueries, aggregation, JSON handling, triggers, transactions,
and database views.

🎯 Project Objectives

Design and Define Bookstore Database Structure (DDL)

Manage Bookstore Data Using DML Operations (DML)

Retrieve and Combine Data Using SQL Joins (JOINS)

Analyze Bookstore Data Using Subqueries and Aggregation

Automate Operations and Ensure Data Reliability (Automation &
Reliability)

🛠️ Technologies Used

MySQL

SQL

Relational Database Management System (RDBMS)

🗃️ Database Structure

Database name: online_bookstore

Table           Description

users         Stores customer and admin information
authors       Stores author details
categories    Stores book categories
books         Stores book details, prices, and stock
orders        Stores customer order information
order_items   Stores books included in each order
payments      Stores payment details
reviews       Stores customer reviews and ratings

📋 Objectives and Tasks

Objective 1: Design and Define Bookstore Database Structure (DDL)

Task 1: Creating Database Tables for Online Bookstore - Created the
online_bookstore database. - Designed tables using primary keys,
foreign keys, unique constraints, and check constraints. - Used
DESCRIBE and SHOW TABLES to verify the structure.

Task 2: Adding Online Bookstore Records into Tables - Inserted
sample records into all major tables. - Verified the inserted records
using SELECT statements.

Objective 2: Manage Bookstore Data Using DML Operations (DML)

Task 1: Retrieve Data from Tables - Retrieved records from multiple
tables using SELECT.

Task 2: Update Data in Tables - Updated book prices and order status
using UPDATE.

Task 3: Delete Data from Tables - Demonstrated deletion of records
from reviews and books using DELETE.

Objective 3: Retrieve and Combine Data Using SQL Joins (JOINS)

Task 1: Retrieve Customer and Order Details Using INNER JOIN -
Combined customer and order information using an INNER JOIN.

Task 2: Display Order and Book Information Using Multiple JOINs -
Combined users, orders, order items, and books to display purchased book
information.

Task 3: Identify Users Without Orders Using LEFT JOIN - Used LEFT
JOIN to identify users without associated orders.

Objective 4: Analyze Bookstore Data Using Subqueries and Aggregation

Task 1: Analyze Book Prices Using Subqueries - Identified books
priced above the average book price.

Task 2: Identify Best-Selling Books Using Aggregation Functions -
Used SUM(), GROUP BY, and ORDER BY to determine sales quantities.

Task 3: Find High-Value Customers Using GROUP BY and HAVING -
Identified customers whose total payment amount exceeded ₹1,000.

Objective 5: Automate Operations and Ensure Data Reliability

Task 1: Store and Retrieve Semi-Structured Data Using JSON - Added a
JSON column to the orders table. - Stored and extracted order metadata
such as delivery type and discount.

Task 2: Automate Inventory Management Using Database Triggers -
Created a trigger to automatically reduce book stock when an order item
is inserted.

Task 3: Ensure Data Consistency Using Transactions and Rollback -
Used transactions and ROLLBACK to prevent an incorrect payment entry
from being permanently stored.

Task 4: Generate Summary Reports Using Database Views - Created the
Order_Report view to provide a summarized customer, order, and payment
report.

🔍 Key SQL Concepts Demonstrated

Database and table creation

Primary and foreign keys

Unique and CHECK constraints

INSERT, SELECT, UPDATE, and DELETE

INNER JOIN and LEFT JOIN

Subqueries

Aggregate functions

GROUP BY, HAVING, and ORDER BY

JSON data handling

Database triggers

Transactions and rollback

Database views

Data integrity and consistency

📊 Sample Analysis

The project can answer questions such as:

Which books are priced above the average price?

Which books have the highest sales quantity?

Which customers have spent more than ₹1,000?

Which users have placed orders?

Which users have no orders?

How does an order affect book inventory?

What payment and order information is available for reporting?

🧩 ER Diagram

The database follows a relational structure where:

Users place orders and write reviews.

Orders contain order items.

Order items are associated with books.

Books belong to authors and categories.

Orders are associated with payments.

Reviews are associated with users and books.

This structure helps maintain relationships between bookstore entities
while reducing data redundancy.

⚙️ How to Run the Project

Install MySQL Server and MySQL Workbench.

Open MySQL Workbench and connect to your MySQL server.

Open the project .sql file.

Execute the complete script from top to bottom.

Verify the tables and query outputs.

The script creates the database, tables, sample records, DML operations,
JOIN queries, analytical queries, JSON functionality, trigger,
transaction example, and reporting view.

⚠️ Important Note

This project is written for MySQL. Features such as JSON operators,
triggers, DELIMITER, and transaction syntax may require changes when
using another database system.

If the database already exists, modify the CREATE DATABASE statement
before rerunning the script.

📈 Project Outcomes

Built a structured relational database for an online bookstore.

Practiced CRUD operations using SQL.

Retrieved meaningful information from multiple related tables.

Performed sales and customer analysis using advanced queries.

Automated inventory updates using triggers.

Used transactions to maintain data reliability.

Created reusable reporting through database views.

🚀 Future Enhancements

Add an admin dashboard for bookstore management.

Implement stored procedures and functions.

Add customer authentication and authorization.

Add order cancellation and refund management.

Introduce indexes for better query performance.

Add detailed sales and inventory reports.

Connect the database with a web or desktop application.

👨‍💻 Author

Megh Malvankar

Project: Online Bookstore Management System

⭐ Conclusion

This project provides practical experience in designing and managing a
relational database using MySQL. It combines fundamental and advanced
SQL techniques to create a reliable system for managing bookstore
operations, analyzing business data, and automating inventory
activities.
