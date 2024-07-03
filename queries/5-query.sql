-- Count the number of projects assigned to David Lee.
SELECT COUNT(*) AS ProjectCount FROM Projects 
JOIN ProjectTeam ON Projects.ProjectID = ProjectTeam.ProjectID 
JOIN Employees ON ProjectTeam.EmployeeID = Employees.EmployeeID 
WHERE EmployeeName = 'David Lee';
