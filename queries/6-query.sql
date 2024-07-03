--  Find the total number of employees working on each project.
SELECT ProjectName, COUNT(EmployeeID) AS TotalEmployees FROM Projects 
JOIN TeamMembers ON Projects.ProjectID = TeamMembers.ProjectID 
GROUP BY ProjectName;
