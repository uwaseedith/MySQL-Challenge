-- Create a trigger to ensure a team lead assigned to a project is a valid employee
DELIMITER $$

CREATE TRIGGER ValidateTeamLead
BEFORE INSERT ON ProjectTeam
FOR EACH ROW
BEGIN
    IF NEW.TeamLead = TRUE THEN
        IF (SELECT COUNT(*) FROM Employees WHERE EmployeeID = NEW.EmployeeID) = 0 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid team lead';
        END IF;
    END IF;
END$$

DELIMITER ;
