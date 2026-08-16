CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

CREATE TABLE Publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE Book (
    isbn VARCHAR(13) PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    edition VARCHAR(20),
    publication_year YEAR,
    category VARCHAR(50),
    publisher_id INT,
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE BookAuthor (
    isbn VARCHAR(13),
    author_id INT,
    PRIMARY KEY (isbn, author_id),
    FOREIGN KEY (isbn) REFERENCES Book(isbn) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Author(author_id) ON DELETE CASCADE
);

CREATE TABLE BookCopy (
    copy_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(13) NOT NULL,
    shelf_location VARCHAR(30),
    status ENUM('Available','Issued','Lost','Damaged') DEFAULT 'Available',
    FOREIGN KEY (isbn) REFERENCES Book(isbn) ON DELETE CASCADE
);

CREATE TABLE Member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(200),
    membership_date DATE DEFAULT (CURRENT_DATE),
    membership_type ENUM('Student','Faculty','General') NOT NULL
);

CREATE TABLE Librarian (
    librarian_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE
);

CREATE TABLE Loan (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    copy_id INT NOT NULL,
    member_id INT NOT NULL,
    librarian_id INT NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (copy_id) REFERENCES BookCopy(copy_id),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (librarian_id) REFERENCES Librarian(librarian_id)
);

CREATE TABLE Fine (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT NOT NULL UNIQUE,
    amount DECIMAL(6,2) NOT NULL,
    paid_status ENUM('Paid','Unpaid') DEFAULT 'Unpaid',
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)
);
