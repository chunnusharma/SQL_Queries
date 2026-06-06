-- Top 3 highest paid employees

SELECT *
FROM Employees
ORDER BY Salary DESC
LIMIT 3;


-- Second Highest Salary

SELECT MAX(Salary)
FROM Employees
WHERE Salary <
(
    SELECT MAX(Salary)
    FROM Employees
);


-- Employees earning above department average

SELECT *
FROM Employees e
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department = e.Department
);


-- Find duplicate emails

SELECT Email,
       COUNT(*)
FROM Employees
GROUP BY Email
HAVING COUNT(*) > 1;
