/*
    EC_IT143 6.3 Fun with Functions - Last Name - S5
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Create a scalar user-defined function for last name.
*/
CREATE OR ALTER FUNCTION dbo.ufn_GetLastName
(
    @ContactName NVARCHAR(100)
)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @CleanName NVARCHAR(100) = RTRIM(@ContactName);

    RETURN CASE
        WHEN CHARINDEX(' ', @CleanName) = 0 THEN @CleanName
        ELSE RIGHT(@CleanName, CHARINDEX(' ', REVERSE(@CleanName)) - 1)
    END;
END;
GO

