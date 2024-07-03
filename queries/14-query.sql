-- Create a view to show project names and client contact information for projects with a deadline in November 2024.
CREATE VIEW NovemberProjects AS
SELECT Projects.ProjectName, Clients.ContactName, Clients.ContactEmail
FROM Projects 
JOIN Clients ON Projects.ClientID = Clients.ClientID 
WHERE Deadline BETWEEN '2024-11-01' AND '2024-11-30';
