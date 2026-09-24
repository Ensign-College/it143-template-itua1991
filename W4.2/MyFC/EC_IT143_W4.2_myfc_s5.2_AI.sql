/*
Step 5.2 - Refine the Table

Question:
What is the total player salary per month?

Purpose:
Refine the table created in Step 5.1 by recreating it
with a primary key.

Database:
MyFC_Restored
*/

USE MyFC_Restored;
GO

-- Remove the table created in Step 5.1
DROP TABLE IF EXISTS dbo.tbl_MyFC_Total_Player_Salary;
GO

-- Recreate the table with a primary key
CREATE TABLE dbo.tbl_MyFC_Total_Player_Salary
(
    salary_summary_id INT IDENTITY(1,1) PRIMARY KEY,
    total_player_salary DECIMAL(18,2)
);
GO

-- Check the table structure
SELECT *
FROM dbo.tbl_MyFC_Total_Player_Salary;