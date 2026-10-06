/*
    EC_IT143 6.3 Fun with Functions - First Name - S3
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Test the answer with ad hoc SQL.
*/
SELECT
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;

