/*
    EC_IT143 6.3 Fun with Functions - Last Name - S7
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Verify that the UDF and ad hoc SQL return the same value.
*/
WITH NameComparison AS
(
    SELECT
        ContactName,
        RIGHT(RTRIM(ContactName), CHARINDEX(' ', REVERSE(RTRIM(ContactName))) - 1) AS AdHocLastName,
        dbo.ufn_GetLastName(ContactName) AS UdfLastName
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM NameComparison
WHERE ISNULL(AdHocLastName, '') <> ISNULL(UdfLastName, '');
-- Expected result: 0 rows.

