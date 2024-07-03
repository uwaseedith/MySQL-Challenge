-- Create a view to display the total number of projects assigned to each employee.
CREATE VIEW EmployeeProjectCount AS
SELECT Employees.EmployeeName, COUNT(ProjectTeam.ProjectID) AS TotalProjects
FROM Employees 
JOIN ProjectTeam ON Employees.EmployeeID = ProjectTeam.EmployeeID 
GROUP BY Employees.EmployeeName;
