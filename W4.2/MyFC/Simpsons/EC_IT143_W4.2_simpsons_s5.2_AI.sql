/*
Step 5.2 - Refine the Table

Question:
What is the total transaction amount by category?

Purpose:
Refine the table created in Step 5.1 by adding
a primary key and appropriate data types.

Database:
Simpsons_Restored
*/

USE Simpsons_Restored;
GO

-- Remove the table created in Step 5.1
DROP TABLE IF EXISTS dbo.tbl_Simpsons_Total_Transaction_By_Category;
GO

-- Recreate the table with a primary key
CREATE TABLE dbo.tbl_Simpsons_Total_Transaction_By_Category
(
    transaction_summary_id INT IDENTITY(1,1) PRIMARY KEY,
    Category NVARCHAR(255),
    total_transaction_amount DECIMAL(18,2)
);
GO

-- Check the table structure
SELECT *
FROM dbo.tbl_Simpsons_Total_Transaction_By_Category;