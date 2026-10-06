/*
    EC_IT143 6.3 Fun with Triggers
    Step 5 - Test Results
    Author: AI
    Date: 2026-10-05

    Purpose:
    Test whether the AFTER UPDATE trigger correctly
    records the date and time of the modification.
*/

-- Select a record before the update.
SELECT
    CustomerID,
    CustomerName,
    ContactName,
    LastModifiedDate
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;


-- Perform a test update.
UPDATE dbo.t_w3_schools_customers
SET ContactName = ContactName
WHERE CustomerID = 1;


-- Check the record after the update.
SELECT
    CustomerID,
    CustomerName,
    ContactName,
    LastModifiedDate
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;