/*
    EC_IT143 6.3 Fun with Functions - First Name - S6
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Compare the scalar UDF with the original ad hoc SQL.
*/
SELECT
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHocFirstName,
    dbo.ufn_GetFirstName(ContactName) AS UdfFirstName
FROM dbo.t_w3_schools_customers;

