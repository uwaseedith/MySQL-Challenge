-- Create a trigger to log any updates made to project records in a separate table for auditing purposes
DELIMITER $$

CREATE TRIGGER LogProjectUpdates
AFTER UPDATE ON Projects
FOR EACH ROW
BEGIN
    INSERT INTO ProjectUpdatesLog (ProjectID, OldDeadline, NewDeadline, UpdateTime)
    VALUES (OLD.ProjectID, OLD.Deadline, NEW.Deadline, NOW());
END$$

DELIMITER ;
