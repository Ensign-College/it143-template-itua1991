/*
    EC_IT143 6.3 Fun with Triggers
    Step 4 - Create an AFTER UPDATE Trigger
    Author: AI
    Date: 2026-10-05

    Purpose:
    Update LastModifiedDate whenever a customer record
    is modified.

    The trigger uses the inserted table to identify
    the records affected by the UPDATE statement.
*/

CREATE OR ALTER TRIGGER dbo.trg_t_w3_schools_customers_LastModifiedDate
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE c
    SET LastModifiedDate = SYSDATETIME()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i
        ON c.CustomerID = i.CustomerID;

END;