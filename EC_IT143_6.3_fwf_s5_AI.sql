/*
    EC_IT143 6.3 Fun with Functions
    Step 5 - Create a User-Defined Scalar Function
    Author: AI
    Date: 2026-10-05

    Purpose:
    Return the first name from a full contact name.

    Example:
    'Maria Anders' returns 'Maria'.
*/

CREATE OR ALTER FUNCTION dbo.ufn_GetFirstName
(
    @ContactName NVARCHAR(100)
)
RETURNS NVARCHAR(100)
AS
BEGIN

    -- Find the first space and return everything before it.
    RETURN LEFT(
        @ContactName,
        CHARINDEX(' ', @ContactName + ' ') - 1
    );

END;