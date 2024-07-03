-- Create a view to display project details along with the total number of team members assigned
CREATE VIEW ProjectDetailsWithTeamMembers AS
SELECT Projects.ProjectID, Projects.ProjectName, Projects.Requirements, Projects.Deadline, COUNT(TeamMembers.EmployeeID) AS TotalTeamMembers
FROM Projects
LEFT JOIN TeamMembers ON Projects.ProjectID = TeamMembers.ProjectID
GROUP BY Projects.ProjectID, Projects.ProjectName, Projects.Requirements, Projects.Deadline;
