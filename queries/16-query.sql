-- Create a function to calculate the number of days remaining until a project deadline
DELIMITER $$

CREATE FUNCTION DaysUntilDeadline(ProjectID INT) RETURNS INT
BEGIN
    DECLARE days INT;
    SELECT DATEDIFF(Deadline, CURDATE()) INTO days FROM Projects WHERE ProjectID = ProjectID;
    RETURN days;
END$$

DELIMITER ;
