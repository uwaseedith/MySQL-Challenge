-- Create a stored procedure to add a new client and their first project in one call
DELIMITER $$

CREATE PROCEDURE AddClientAndProject(
    IN clientName VARCHAR(100), 
    IN contactName VARCHAR(100), 
    IN contactEmail VARCHAR(100), 
    IN projectName VARCHAR(100), 
    IN requirements TEXT, 
    IN deadline DATE
)
BEGIN
    DECLARE newClientID INT;
    INSERT INTO Clients (ClientName, ContactName, ContactEmail) VALUES (clientName, contactName, contactEmail);
    SET newClientID = LAST_INSERT_ID();
    INSERT INTO Projects (ProjectName, Requirements, Deadline, ClientID) VALUES (projectName, requirements, deadline, newClientID);
END$$

DELIMITER ;
