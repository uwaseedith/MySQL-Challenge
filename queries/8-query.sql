-- List employees who are not currently team leads on any project.
SELECT EmployeeName FROM Employees 
WHERE EmployeeID NOT IN (
    SELECT EmployeeID FROM ProjectTeam WHERE TeamLead = TRUE
);
