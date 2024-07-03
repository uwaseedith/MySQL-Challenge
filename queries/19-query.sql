-- Create a stored procedure to move completed projects (past deadlines) to an archive table
DELIMITER $$

CREATE PROCEDURE ArchiveCompletedProjects()
BEGIN
    INSERT INTO ArchivedProjects (ProjectID, ProjectName, Requirements, Deadline, ClientID)
    SELECT ProjectID, ProjectName, Requirements, Deadline, ClientID 
    FROM Projects 
    WHERE Deadline < CURDATE();
    
    DELETE FROM Projects 
    WHERE Deadline < CURDATE();
END$$

DELIMITER ;
