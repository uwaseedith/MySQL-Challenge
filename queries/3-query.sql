--  Find the team lead for the "Mobile App for Learning" project
SELECT EmployeeName FROM Employees 
JOIN ProjectTeam ON Employees.EmployeeID = ProjectTeam.EmployeeID 
JOIN Projects ON ProjectTeam.ProjectID = Projects.ProjectID 
WHERE ProjectName = 'Mobile App for Learning' AND TeamLead = TRUE;
