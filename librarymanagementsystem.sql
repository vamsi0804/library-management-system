-- Step 1: Create the Database
CREATE DATABASE LibraryManagementSystem;

-- Step 2: Use the Database
USE LibraryManagementSystem;

-- Step 3: Create Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    PublishedYear INT,
    CopiesAvailable INT
);

-- Step 4: Create Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    MembershipDate DATE
);

-- Step 5: Create Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Step 6: Insert Sample Data into Books Table
INSERT INTO Books (BookID, Title, Author, Genre, PublishedYear, CopiesAvailable)
VALUES 
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 5),
(2, '1984', 'George Orwell', 'Dystopian', 1949, 3),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, 4),
(4, 'Moby Dick', 'Herman Melville', 'Adventure', 1851, 2);

-- Step 7: Insert Sample Data into Members Table
INSERT INTO Members (MemberID, Name, Email, PhoneNumber, MembershipDate)
VALUES 
(1, 'Alice Johnson', 'alice.johnson@example.com', '1234567890', '2023-01-15'),
(2, 'Bob Smith', 'bob.smith@example.com', '9876543210', '2023-02-20'),
(3, 'Charlie Brown', 'charlie.brown@example.com', '4567891230', '2023-03-10');

-- Step 8: Insert Sample Data into Transactions Table
INSERT INTO Transactions (TransactionID, BookID, MemberID, IssueDate, ReturnDate)
VALUES 
(1, 1, 1, '2023-10-01', '2023-10-15'),
(2, 2, 2, '2023-10-05', '2023-10-20'),
(3, 3, 1, '2023-10-10', '2023-10-25');

-- Step 9: Example Queries

-- 1. Retrieve all books in a specific genre (e.g., 'Fiction').
SELECT * FROM Books WHERE Genre = 'Fiction';

-- 2. Find members who borrowed a specific book (e.g., BookID = 1).
SELECT Members.Name, Members.Email
FROM Transactions
JOIN Members ON Transactions.MemberID = Members.MemberID
WHERE Transactions.BookID = 1;

-- 3. Update the number of copies available after a book is issued.
UPDATE Books 
SET CopiesAvailable = CopiesAvailable - 1
WHERE BookID = 1;

-- 4. Count the total number of books borrowed in October 2023.
SELECT COUNT(*) AS TotalBooksBorrowed
FROM Transactions
WHERE IssueDate BETWEEN '2023-10-01' AND '2023-10-31';

-- 5. List the most borrowed books.
SELECT Books.Title, COUNT(Transactions.BookID) AS BorrowCount
FROM Transactions
JOIN Books ON Transactions.BookID = Books.BookID
GROUP BY Books.Title
ORDER BY BorrowCount DESC;
