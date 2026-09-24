/*
Step 5.1 - Turn the View into a Table

Question:
What is the total player salary per month?

Purpose:
Create a physical table from the MyFC salary view.

Database:
MyFC_Restored

Source View:
dbo.vw_MyFC_Total_Player_Salary
*/

USE MyFC_Restored;
GO

SELECT
    total_player_salary
INTO dbo.tbl_MyFC_Total_Player_Salary
FROM dbo.vw_MyFC_Total_Player_Salary;
GO

-- Test the new table
SELECT *
FROM dbo.tbl_MyFC_Total_Player_Salary;