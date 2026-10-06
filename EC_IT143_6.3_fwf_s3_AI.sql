/*
    EC_IT143 6.3 Fun with Functions
    Step 3 - Create an Ad Hoc SQL Query
    Author: AI
    Date: 2026-10-05

    Question:
    How do you extract the first name from the contact name?
*/

SELECT
    ContactName,
    LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;