
-- Show all tables in the database
SHOW TABLES;

-- Show structure of each table (to confirm column names)
DESC employee;
DESC department;
DESC customers;
DESC payments;
DESC author;
DESC book;
DESC bookauthor;

-- ============================================
-- 📘 Queries
-- ============================================

-- 1. Employees with their Departments
-- ⚠️ If employee has "firstname" and "lastname" instead of "emp_name", adjust accordingly
SELECT e.firstname, e.lastname, e.email, d.departmentName
FROM employee e
INNER JOIN department d 
    ON e.departmentID = d.departmentID
LIMIT 10;

-- 2. Customers with High Payments
SELECT c.customerName, p.amount, p.paymentDate
FROM customers c
INNER JOIN payments p 
    ON c.customerID = p.customerID
WHERE p.amount > 5000
ORDER BY p.amount DESC;

-- 3. Employee Count per Department
SELECT d.departmentName, COUNT(e.employeeID) AS totalEmployees
FROM department d
LEFT JOIN employee e 
    ON d.departmentID = e.departmentID
GROUP BY d.departmentName
ORDER BY totalEmployees DESC;

-- 4. Books and Authors (many-to-many)
SELECT b.title, a.name AS authorName
FROM book b
INNER JOIN bookauthor ba 
    ON b.bookID = ba.bookID
INNER JOIN author a 
    ON ba.authorID = a.authorID
ORDER BY b.title;

-- 5. Total Payments by Customers
SELECT c.customerName, SUM(p.amount) AS totalPayments
FROM customers c
INNER JOIN payments p 
    ON c.customerID = p.customerID
GROUP BY c.customerName
ORDER BY totalPayments DESC;

