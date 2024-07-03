-- Find all clients with projects having a deadline after October 31st, 2024.
SELECT DISTINCT ClientName FROM Clients 
JOIN Projects ON Clients.ClientID = Projects.ClientID 
WHERE Deadline > '2024-10-31';
