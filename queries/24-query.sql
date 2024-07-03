-- Create a stored procedure to update project team members (remove existing, add new ones)
DELIMITER $$

CREATE PROCEDURE UpdateProjectTeamMembers(
    IN projectID INT,
    IN newTeamMembers TEXT
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE newMemberID INT;
    DECLARE teamMember CURSOR FOR SELECT EmployeeID FROM Employees WHERE FIND_IN_SET(EmployeeID, newTeamMembers);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    DELETE FROM TeamMembers WHERE ProjectID = projectID;
    
    OPEN teamMember;
    read_loop: LOOP
        FETCH teamMember INTO newMemberID;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO TeamMembers (ProjectID, EmployeeID) VALUES (projectID, newMemberID);
    END LOOP;
    CLOSE teamMember;
END$$

DELIMITER ;
