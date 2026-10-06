/*
    EC_IT143 6.3 Fun with Functions - First Name - S4
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Research and test the SQL functions used.
*/
/*
    Research:
    https://learn.microsoft.com/en-us/sql/t-sql/functions/left-transact-sql
    https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql

    Test case: Antonio Moreno -> Antonio
*/
SELECT
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;

