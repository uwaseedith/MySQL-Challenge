-- Create a view to show overdue projects with the number of days overdue
CREATE VIEW OverdueProjects AS
SELECT Projects.ProjectID, Projects.ProjectName, Projects.Requirements, Projects.Deadline, DATEDIFF(CURDATE(), Projects.Deadline) AS DaysOverdue
FROM Projects
WHERE Projects.Deadline < CURDATE();
