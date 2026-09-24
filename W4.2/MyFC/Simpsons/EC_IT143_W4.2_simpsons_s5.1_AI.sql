/*
Step 5.1 - Turn the View into a Table

Question:
What is the total transaction amount by category?

Purpose:
Create a physical table from the Simpsons transaction view.

Database:
Simpsons_Restored

Source View:
dbo.vw_Simpsons_Total_Transaction_By_Category
*/

USE Simpsons_Restored;
GO

SELECT
    Category,
    total_transaction_amount
INTO dbo.tbl_Simpsons_Total_Transaction_By_Category
FROM dbo.vw_Simpsons_Total_Transaction_By_Category;
GO

-- Test the new table
SELECT *
FROM dbo.tbl_Simpsons_Total_Transaction_By_Category
ORDER BY Category;