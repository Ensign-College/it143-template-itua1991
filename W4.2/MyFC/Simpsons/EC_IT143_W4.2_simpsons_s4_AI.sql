/*
Step 4 - Turn the Ad Hoc Query into a View

Question:
What is the total transaction amount by category?

Purpose:
Create a reusable view that calculates the total
transaction amount for each category.

Database:
Simpsons_Restored

Source Table:
dbo.Planet_Express

Fields:
Amount
Category
*/

USE Simpsons_Restored;
GO

CREATE VIEW dbo.vw_Simpsons_Total_Transaction_By_Category
AS
SELECT
    Category,
    SUM(Amount) AS total_transaction_amount
FROM dbo.Planet_Express
GROUP BY Category;
GO

-- Test the view
SELECT *
FROM dbo.vw_Simpsons_Total_Transaction_By_Category
ORDER BY Category;