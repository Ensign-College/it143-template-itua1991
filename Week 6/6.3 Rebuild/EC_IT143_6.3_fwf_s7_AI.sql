/*
    EC_IT143 6.3 Fun with Functions - First Name - S7
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Verify that the UDF and ad hoc SQL return the same value.
*/
WITH NameComparison AS
(
    SELECT
        ContactName,
        LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHocFirstName,
        dbo.ufn_GetFirstName(ContactName) AS UdfFirstName
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM NameComparison
WHERE ISNULL(AdHocFirstName, '') <> ISNULL(UdfFirstName, '');
-- Expected result: 0 rows.

