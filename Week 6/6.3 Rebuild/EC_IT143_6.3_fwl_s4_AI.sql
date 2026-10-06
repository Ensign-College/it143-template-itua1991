/*
    EC_IT143 6.3 Fun with Functions - Last Name - S4
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Research and test the SQL functions used.
*/
/*
    Research:
    https://learn.microsoft.com/en-us/sql/t-sql/functions/right-transact-sql
    https://learn.microsoft.com/en-us/sql/t-sql/functions/reverse-transact-sql
    https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql
*/
SELECT
    ContactName,
    RIGHT(RTRIM(ContactName), CHARINDEX(' ', REVERSE(RTRIM(ContactName))) - 1) AS LastName
FROM dbo.t_w3_schools_customers;

