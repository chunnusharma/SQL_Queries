CREATE TABLE Salary_Audit (
    EmployeeID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    UpdatedAt TIMESTAMP
);

DELIMITER //

CREATE TRIGGER SalaryUpdateTrigger
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO Salary_Audit
    VALUES(
        OLD.EmployeeID,
        OLD.Salary,
        NEW.Salary,
        NOW()
    );
END //

DELIMITER ;
