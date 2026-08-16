INSERT INTO Publisher (name, address, phone, email) VALUES
('Pearson Education', 'Lahore, Pakistan', '042-111222333', 'contact@pearson.com'),
('O’Reilly Media', 'Sebastopol, USA', '001-707-827400', 'info@oreilly.com'),
('Penguin Books', 'London, UK', '044-207-7100', 'info@penguin.co.uk'),
('Oxford University Press', 'Oxford, UK', '044-186-5556', 'info@oup.com'),
('Wiley', 'New Jersey, USA', '001-201-7486000', 'info@wiley.com');

INSERT INTO Author (first_name, last_name, nationality, date_of_birth) VALUES
('Robert', 'Martin', 'American', '1952-12-05'),
('Martin', 'Fowler', 'British', '1963-12-18'),
('George', 'Orwell', 'British', '1903-06-25'),
('Yuval Noah', 'Harari', 'Israeli', '1976-02-24'),
('Jane', 'Austen', 'British', '1775-12-16');

INSERT INTO Book (isbn, title, edition, publication_year, category, publisher_id) VALUES
('9780132350884', 'Clean Code', '1st', 2008, 'Technology', 2),
('9780201485677', 'Refactoring', '2nd', 2018, 'Technology', 5),
('9780451524935', '1984', '1st', 1949, 'Fiction', 3),
('9780062316097', 'Sapiens', '1st', 2011, 'Non-Fiction', 3),
('9780141439518', 'Pride and Prejudice', '3rd', 1813, 'Fiction', 4);

INSERT INTO BookAuthor (isbn, author_id) VALUES
('9780132350884', 1), ('9780201485677', 2), ('9780451524935', 3),
('9780062316097', 4), ('9780141439518', 5);

INSERT INTO BookCopy (isbn, shelf_location, status) VALUES
('9780132350884', 'A1-12', 'Available'),
('9780201485677', 'A1-15', 'Issued'),
('9780451524935', 'B2-04', 'Available'),
('9780062316097', 'C3-09', 'Issued'),
('9780141439518', 'B2-08', 'Available');

INSERT INTO Member (full_name, email, address, membership_date, membership_type) VALUES
('Ali Raza', 'ali.raza@email.com', 'Johar Town, Lahore', '2024-01-15', 'Student'),
('Sara Khan', 'sara.khan@email.com', 'DHA, Lahore', '2023-09-10', 'Faculty'),
('Bilal Ahmed', 'bilal.a@email.com', 'Gulberg, Lahore', '2024-03-22', 'Student'),
('Hina Tariq', 'hina.t@email.com', 'Model Town, Lahore', '2022-11-05', 'General'),
('Usman Sheikh', 'usman.s@email.com', 'Wapda Town, Lahore', '2025-02-18', 'Student');

INSERT INTO Librarian (full_name, email, phone, hire_date) VALUES
('Ahmed Saeed', 'ahmed.saeed@library.com', '0300-1234567', '2019-06-01'),
('Fatima Noor', 'fatima.noor@library.com', '0301-2345678', '2020-08-15'),
('Hassan Iqbal', 'hassan.iqbal@library.com', '0302-3456789', '2021-01-10'),
('Ayesha Malik', 'ayesha.malik@library.com', '0303-4567890', '2018-03-20'),
('Zain Abbas', 'zain.abbas@library.com', '0304-5678901', '2022-09-05');

INSERT INTO Loan (copy_id, member_id, librarian_id, issue_date, due_date, return_date) VALUES
(2, 1, 1, '2026-05-01', '2026-05-15', '2026-05-20'),
(4, 2, 2, '2026-05-10', '2026-05-24', NULL),
(1, 3, 1, '2026-04-20', '2026-05-04', '2026-05-03'),
(3, 4, 3, '2026-06-01', '2026-06-15', NULL),
(5, 5, 2, '2026-03-15', '2026-03-29', '2026-04-02');

INSERT INTO Fine (loan_id, amount, paid_status) VALUES
(1, 25.00, 'Paid'),
(5, 20.00, 'Unpaid');
