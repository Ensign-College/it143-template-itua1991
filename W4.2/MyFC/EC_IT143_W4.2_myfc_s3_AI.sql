/*
Step 3 - Create an Ad Hoc SQL Query

Question:
What is the total player salary per month?

Purpose:
Calculate the total monthly salary for all players
in the MyFC database.

Database:
MyFC_Restored

Table:
dbo.tblPlayerFact

Field:
mtd_salary
*/

USE MyFC_Restored;
GO

SELECT
    SUM(mtd_salary) AS total_player_salary
FROM dbo.tblPlayerFact;