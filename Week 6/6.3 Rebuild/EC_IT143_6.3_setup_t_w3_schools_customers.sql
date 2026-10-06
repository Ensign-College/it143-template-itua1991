/*
    EC_IT143 6.3 Setup
    Purpose: Materialize the W3 Schools Customers view into a table.
    Run this script once before the function and trigger scripts.
*/
USE EC_IT143_DA;
GO

SELECT *
INTO dbo.t_w3_schools_customers
FROM dbo.v_w3_schools_customers;
GO
