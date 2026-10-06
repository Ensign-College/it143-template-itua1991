/*
    EC_IT143 6.3 Fun with Functions - First Name - S5
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Create a scalar user-defined function.
*/
CREATE OR ALTER FUNCTION dbo.ufn_GetFirstName
(
    @ContactName NVARCHAR(100)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN LEFT(@ContactName, CHARINDEX(' ', @ContactName + ' ') - 1);
END;
GO

