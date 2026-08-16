-- 1. Table Modification (ALTER Queries)
ALTER TABLE Member ADD COLUMN phone VARCHAR(20);
ALTER TABLE Book MODIFY COLUMN title VARCHAR(200);
ALTER TABLE Librarian RENAME COLUMN phone TO contact_number;
ALTER TABLE BookCopy DROP COLUMN shelf_location;

-- 2. Data Retrieval (SELECT Queries)
SELECT title, category, publication_year FROM Book;

SELECT m.full_name, b.title, l.issue_date, l.due_date
FROM Loan l
JOIN BookCopy bc ON l.copy_id = bc.copy_id
JOIN Book b ON bc.isbn = b.isbn
JOIN Member m ON l.member_id = m.member_id;

-- 3. SQL Clauses and Operators
SELECT * FROM Book WHERE category = 'Fiction';
SELECT title, publication_year FROM Book ORDER BY publication_year DESC;
SELECT category, COUNT(*) AS total_books FROM Book GROUP BY category;
SELECT category, COUNT(*) AS total_books FROM Book GROUP BY category HAVING COUNT(*) > 1;
SELECT full_name, email FROM Member WHERE full_name LIKE 'A%';
SELECT title FROM Book ORDER BY publication_year ASC LIMIT 3;

SELECT COUNT(*) AS total_loans, SUM(amount) AS total_fines, 
       AVG(amount) AS avg_fine, MIN(amount) AS min_fine, MAX(amount) AS max_fine 
FROM Fine;

SELECT full_name FROM Member WHERE member_id IN (SELECT member_id FROM Loan WHERE return_date IS NULL);
SELECT DISTINCT category FROM Book;
SELECT title FROM Book WHERE category IN ('Fiction', 'Technology');
SELECT title, publication_year FROM Book WHERE publication_year BETWEEN 2000 AND 2026;
SELECT loan_id, member_id FROM Loan WHERE return_date IS NULL;

-- 4. Referential Integrity Constraints (Demonstrations)
-- INSERT INTO Loan (copy_id, member_id, librarian_id, issue_date, due_date) VALUES (1, 999, 1, '2026-06-30', '2026-07-14'); -- Fails (Foreign Key constraint)
UPDATE Publisher SET publisher_id = 10 WHERE publisher_id = 2;
DELETE FROM Publisher WHERE publisher_id = 10;
DELETE FROM Book WHERE isbn = '9780141439518';

-- 5. Joins Demonstration
SELECT m.full_name, b.title, l.issue_date 
FROM Loan l 
INNER JOIN BookCopy bc ON l.copy_id = bc.copy_id 
INNER JOIN Book b ON bc.isbn = b.isbn 
INNER JOIN Member m ON l.member_id = m.member_id;

SELECT m.full_name, l.loan_id, l.issue_date FROM Member m LEFT JOIN Loan l ON m.member_id = l.member_id;
SELECT m.full_name, l.loan_id FROM Member m RIGHT JOIN Loan l ON m.member_id = l.member_id;

SELECT m.full_name, l.loan_id FROM Member m LEFT JOIN Loan l ON m.member_id = l.member_id 
UNION 
SELECT m.full_name, l.loan_id FROM Member m RIGHT JOIN Loan l ON m.member_id = l.member_id;

SELECT a1.first_name AS author1, a2.first_name AS author2, a1.nationality 
FROM Author a1 JOIN Author a2 ON a1.nationality = a2.nationality AND a1.author_id < a2.author_id;

SELECT title, status FROM Book NATURAL JOIN BookCopy;
