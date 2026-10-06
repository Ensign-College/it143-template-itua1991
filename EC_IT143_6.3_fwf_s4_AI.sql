/*
    EC_IT143 6.3 Fun with Functions
    Step 4 - Research and Test a Solution
    Author: AI
    Date: 2026-10-05

    Question:
    How do you extract the first name from the contact name?

    Research:
    Microsoft Learn - CREATE FUNCTION:
    https://learn.microsoft.com/en-us/sql/t-sql/statements/create-function-transact-sql

    Microsoft Learn - User-Defined Functions:
    https://learn.microsoft.com/en-us/sql/relational-databases/user-defined-functions/create-user-defined-functions-database-engine

    Testing:
    The ad hoc query uses CHARINDEX to find the first space
    and LEFT to return the characters before the space.

    Example:
    Maria Anders -> Maria
    Ana Trujillo -> Ana
    Antonio Moreno -> Antonio
*/

SELECT
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;