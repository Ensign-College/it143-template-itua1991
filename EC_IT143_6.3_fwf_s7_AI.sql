/*
    EC_IT143 6.3 Fun with Functions
    Step 7 - 0 Results Expected Test
    Author: AI
    Date: 2026-10-05

    Purpose:
    Return records only when the ad hoc query and UDF
    produce different results.

    Expected result:
    0 rows.
*/

WITH cte AS
(
    SELECT
        ContactName,

        LEFT(
            ContactName,
            CHARINDEX(' ', ContactName + ' ') - 1
        ) AS ExpectedFirstName,

        dbo.ufn_GetFirstName(ContactName) AS ActualFirstName

    FROM dbo.t_w3_schools_customers
)
SELECT
    ContactName,
    ExpectedFirstName,
    ActualFirstName
FROM cte
WHERE
       ExpectedFirstName <> ActualFirstName
    OR (ExpectedFirstName IS NULL AND ActualFirstName IS NOT NULL)
    OR (ExpectedFirstName IS NOT NULL AND ActualFirstName IS NULL);