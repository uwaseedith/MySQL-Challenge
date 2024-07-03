-- Create a trigger to prevent deleting a project that still has assigned team members
DELIMITER $$

CREATE TRIGGER PreventProjectDeletion
BEFORE DELETE ON Projects
FOR EACH ROW
BEGIN
    DECLARE memberCount INT;
    SELECT COUNT(*) INTO memberCount FROM TeamMembers WHERE ProjectID = OLD.ProjectID;
    IF memberCount > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete project with assigned team members';
    END IF;
END$$

DELIMITER ;
