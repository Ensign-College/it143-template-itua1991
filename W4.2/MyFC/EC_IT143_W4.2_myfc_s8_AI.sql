/*
Step 8 - Call the Stored Procedure

Question:
What is the total player salary per month?

Purpose:
Execute the stored procedure and display the
updated total player salary.

Database:
MyFC_Restored
*/

USE MyFC_Restored;
GO

-- Execute the stored procedure
EXEC dbo.usp_MyFC_Load_Total_Player_Salary;
GO

-- Display the results
SELECT *
FROM dbo.tbl_MyFC_Total_Player_Salary;