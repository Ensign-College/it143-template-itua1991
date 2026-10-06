/*
    Last Modified By Trigger
    Author: AI

    Purpose:
    Store the SQL Server login that performed the update.
*/

CREATE OR ALTER TRIGGER dbo.trg_t_w3_schools_customers_LastModifiedBy
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE c
    SET LastModifiedBy = SUSER_SNAME()
    FROM dbo.t_w3_schools_customers AS c
    INNER JOIN inserted AS i
        ON c.CustomerID = i.CustomerID;

END;