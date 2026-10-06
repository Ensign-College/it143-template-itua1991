/*
    EC_IT143 6.3 Fun with Functions
    Step 6 - Compare UDF Results to Ad Hoc Query Results
    Author: AI
    Date: 2026-10-05

    Purpose:
    Compare the original ad hoc solution with the
    user-defined scalar function.
*/

SELECT
    ContactName,

    -- Original ad hoc solution
    LEFT(
        ContactName,
        CHARINDEX(' ', ContactName + ' ') - 1
    ) AS AdHocFirstName,

    -- User-defined function
    dbo.ufn_GetFirstName(ContactName) AS UdfFirstName

FROM dbo.t_w3_schools_customers;