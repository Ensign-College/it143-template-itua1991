/*
Step 4 - Turn the Ad Hoc Query into a View

Question:
What is the total player salary per month?

Purpose:
Create a reusable view that calculates the total
monthly salary for all players.

Database:
MyFC_Restored

Source Table:
dbo.tblPlayerFact

Source Field:
mtd_salary
*/

USE MyFC_Restored;
GO

CREATE VIEW dbo.vw_MyFC_Total_Player_Salary
AS
SELECT
    SUM(mtd_salary) AS total_player_salary
FROM dbo.tblPlayerFact;
GO

-- Test the view
SELECT *
FROM dbo.vw_MyFC_Total_Player_Salary;