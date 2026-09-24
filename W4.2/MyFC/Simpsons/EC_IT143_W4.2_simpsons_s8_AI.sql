/*
Step 8 - Call the Stored Procedure

Question:
What is the total transaction amount by category?

Purpose:
Execute the stored procedure and display the
updated transaction totals by category.

Database:
Simpsons_Restored
*/

USE Simpsons_Restored;
GO

-- Execute the stored procedure
EXEC dbo.usp_Simpsons_Load_Total_Transaction_By_Category;
GO

-- Display the results
SELECT *
FROM dbo.tbl_Simpsons_Total_Transaction_By_Category
ORDER BY Category;