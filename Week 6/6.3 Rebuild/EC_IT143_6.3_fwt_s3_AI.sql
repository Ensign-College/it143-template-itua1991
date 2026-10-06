/*
    EC_IT143 6.3 Fun with Triggers - S3
    Author: itua1991
    Date: 2026-10-07

    Purpose:
    Research triggers and prepare the tracking columns.
*/
/*
    Research:
    https://learn.microsoft.com/en-us/sql/relational-databases/triggers/dml-triggers
    https://learn.microsoft.com/en-us/sql/relational-databases/tables/use-the-inserted-and-deleted-tables
*/
IF COL_LENGTH('dbo.t_w3_schools_customers', 'LastModifiedDate') IS NULL
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers ADD LastModifiedDate DATETIME2 NULL;
END;
GO
IF COL_LENGTH('dbo.t_w3_schools_customers', 'LastModifiedBy') IS NULL
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers ADD LastModifiedBy NVARCHAR(128) NULL;
END;
GO

