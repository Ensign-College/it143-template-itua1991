/*
Step 6 - Load the Table from the View

Question:
What is the total player salary per month?

Purpose:
Load the current salary total from the view into
the refined table.

Database:
MyFC_Restored
*/

USE MyFC_Restored;
GO

-- Remove any existing data from the table
TRUNCATE TABLE dbo.tbl_MyFC_Total_Player_Salary;
GO

-- Load the data from the view
INSERT INTO dbo.tbl_MyFC_Total_Player_Salary
(
    total_player_salary
)
SELECT
    total_player_salary
FROM dbo.vw_MyFC_Total_Player_Salary;
GO

-- Verify the result
SELECT *
FROM dbo.tbl_MyFC_Total_Player_Salary;