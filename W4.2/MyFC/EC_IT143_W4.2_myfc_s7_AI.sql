/*
Step 7 - Turn the Ad Hoc Script into a Stored Procedure

Question:
What is the total player salary per month?

Purpose:
Create a stored procedure that refreshes the
MyFC salary table from the salary view.

Database:
MyFC_Restored
*/

USE MyFC_Restored;
GO

CREATE OR ALTER PROCEDURE dbo.usp_MyFC_Load_Total_Player_Salary
AS
BEGIN

    -- Remove existing data
    TRUNCATE TABLE dbo.tbl_MyFC_Total_Player_Salary;

    -- Load the current total from the view
    INSERT INTO dbo.tbl_MyFC_Total_Player_Salary
    (
        total_player_salary
    )
    SELECT
        total_player_salary
    FROM dbo.vw_MyFC_Total_Player_Salary;

END;
GO