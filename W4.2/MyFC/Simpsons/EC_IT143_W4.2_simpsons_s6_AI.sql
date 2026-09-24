/*
Step 6 - Load the Table from the View

Question:
What is the total transaction amount by category?

Purpose:
Load the current transaction totals from the view
into the refined table.

Database:
Simpsons_Restored
*/

USE Simpsons_Restored;
GO

-- Remove any existing data from the table
TRUNCATE TABLE dbo.tbl_Simpsons_Total_Transaction_By_Category;
GO

-- Load the data from the view
INSERT INTO dbo.tbl_Simpsons_Total_Transaction_By_Category
(
    Category,
    total_transaction_amount
)
SELECT
    Category,
    total_transaction_amount
FROM dbo.vw_Simpsons_Total_Transaction_By_Category;
GO

-- Verify the results
SELECT *
FROM dbo.tbl_Simpsons_Total_Transaction_By_Category
ORDER BY Category;