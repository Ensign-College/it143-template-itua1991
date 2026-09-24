/*
Step 7 - Turn the Ad Hoc Script into a Stored Procedure

Question:
What is the total transaction amount by category?

Purpose:
Create a stored procedure that refreshes the
Simpsons transaction summary table from the view.

Database:
Simpsons_Restored
*/

USE Simpsons_Restored;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Simpsons_Load_Total_Transaction_By_Category
AS
BEGIN

    -- Remove existing data
    TRUNCATE TABLE dbo.tbl_Simpsons_Total_Transaction_By_Category;

    -- Load the current totals from the view
    INSERT INTO dbo.tbl_Simpsons_Total_Transaction_By_Category
    (
        Category,
        total_transaction_amount
    )
    SELECT
        Category,
        total_transaction_amount
    FROM dbo.vw_Simpsons_Total_Transaction_By_Category;

END;
GO