

/*
    EC_IT143 6.3 Fun with Triggers
    Step 3 - Research and Test a Solution
    Author: AI
    Date: 2026-10-05

    Question:
    How do you keep track of when a record was last modified?

    Research:
    Microsoft Learn - DML Triggers:
    https://learn.microsoft.com/en-us/sql/relational-databases/triggers/dml-triggers

    Microsoft Learn - Inserted and Deleted Tables:
    https://learn.microsoft.com/en-us/sql/relational-databases/triggers/use-the-inserted-and-deleted-tables

    Research conclusion:
    An AFTER UPDATE trigger can automatically run after
    a record is updated. The inserted table identifies
    the rows affected by the update.
*/

-- Add the tracking columns if they do not already exist.

IF COL_LENGTH('dbo.t_w3_schools_customers', 'LastModifiedDate') IS NULL
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers
    ADD LastModifiedDate DATETIME2 NULL;
END;

IF COL_LENGTH('dbo.t_w3_schools_customers', 'LastModifiedBy') IS NULL
BEGIN
    ALTER TABLE dbo.t_w3_schools_customers
    ADD LastModifiedBy NVARCHAR(128) NULL;
END;