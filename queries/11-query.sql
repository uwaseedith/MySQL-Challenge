-- Create a view to simplify retrieving client contact 
CREATE VIEW ClientContact AS
SELECT ClientName, ContactName, ContactEmail FROM Clients;
