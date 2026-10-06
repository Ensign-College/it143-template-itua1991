/*
    EC_IT143 6.3 Fun with Functions - Last Name - S6
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Compare the last-name UDF with the original ad hoc SQL.
*/
SELECT
    ContactName,
    RIGHT(RTRIM(ContactName), CHARINDEX(' ', REVERSE(RTRIM(ContactName))) - 1) AS AdHocLastName,
    dbo.ufn_GetLastName(ContactName) AS UdfLastName
FROM dbo.t_w3_schools_customers;

