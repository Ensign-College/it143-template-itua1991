/*
Step 3 - Create an Ad Hoc SQL Query

Question:
What is the total transaction amount by category?

Purpose:
Calculate the total transaction amount for each
transaction category.

Database:
Simpsons_Restored

Table:
dbo.Planet_Express

Fields:
Amount
Category
*/

USE Simpsons_Restored;
GO

SELECT
    Category,
    SUM(Amount) AS total_transaction_amount
FROM dbo.Planet_Express
GROUP BY Category
ORDER BY Category;