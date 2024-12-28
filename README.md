# library-management-system
This project is a SQL-based relational database designed to manage library operations efficiently. It tracks books, members, and transactions, enabling streamlined management of book issuances, returns, and overdue tracking.
Library Management System
Overview
The Library Management System is a relational database project implemented using SQL. This project is designed to manage library operations efficiently, including tracking books, members, and transactions.

Features
Books Table: Stores information about books, including their title, author, genre, and availability.
Members Table: Maintains details of library members, such as name, contact information, and membership date.
Transactions Table: Tracks book issuance and return records, with relationships to books and members.
Database Structure
The database contains the following tables:

Books:

BookID (Primary Key)
Title
Author
Genre
PublishedYear
CopiesAvailable
Members:

MemberID (Primary Key)
Name
Email
PhoneNumber
MembershipDate
Transactions:

TransactionID (Primary Key)
BookID (Foreign Key)
MemberID (Foreign Key)
IssueDate
ReturnDate
Prerequisites
A SQL-compatible database system (e.g., MySQL, PostgreSQL).
Basic knowledge of SQL and database management.
