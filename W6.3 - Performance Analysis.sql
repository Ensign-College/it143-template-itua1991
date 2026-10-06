/*
    W6.4 - Performance Analysis
    Database: AdventureWorks2022

    Purpose:
    1. Analyze execution plans.
    2. Identify missing-index recommendations.
    3. Create recommended indexes.
    4. Compare execution plans before and after indexing.
*/


USE AdventureWorks2022;
GO


/* ============================================================
   QUERY 1 - Person.Address
   Filter: City = 'Bothell'
   ============================================================ */


/* Step 1: Run this query with Actual Execution Plan enabled.
   Before creating the index, SQL Server recommended an index
   on the City column.

   Missing Index Impact observed: 97.9636%
*/

SELECT
    AddressID,
    AddressLine1,
    AddressLine2,
    City,
    PostalCode
FROM Person.Address
WHERE City = 'Bothell';
GO


/* Step 2: Create the recommended index. */

CREATE NONCLUSTERED INDEX IX_Address_City
ON Person.Address (City);
GO


/* Step 3: Run the same query again with Actual Execution Plan
   enabled to compare the results. */

SELECT
    AddressID,
    AddressLine1,
    AddressLine2,
    City,
    PostalCode
FROM Person.Address
WHERE City = 'Bothell';
GO


/*
   Query 1 observations after creating the index:

   - The execution plan uses an Index Seek.
   - Statement Estimated Subtree Cost: 0.0305711
   - Index Seek Estimated Subtree Cost: 0.00329227
   - Actual rows returned: 26
   - Actual elapsed time: approximately 3 ms
*/


/* ============================================================
   QUERY 2 - Production.Product
   Filter: Color = 'Black'
   ============================================================ */


/* Step 1: Run this query with Actual Execution Plan enabled.
   SQL Server identified the Color column as a candidate
   for indexing.
*/

SELECT
    ProductID,
    Name,
    ProductNumber,
    Color,
    ListPrice
FROM Production.Product
WHERE Color = 'Black';
GO


/* Step 2: Create the recommended index on Color.

   IMPORTANT:
   Replace the index name below with the exact name of the
   index you created if you used a different name.
*/

CREATE NONCLUSTERED INDEX IX_Product_Color
ON Production.Product (Color);
GO


/* Step 3: Run the same query again with Actual Execution Plan
   enabled to compare the results. */

SELECT
    ProductID,
    Name,
    ProductNumber,
    Color,
    ListPrice
FROM Production.Product
WHERE Color = 'Black';
GO


/*
   Query 2 observations after creating the index:

   - SQL Server continued to use a Clustered Index Scan.
   - Statement Estimated Subtree Cost: 0.0127253
   - Actual rows returned: 93
   - Actual rows read: 504
   - Actual elapsed time: 0 ms
   - Logical reads: 15

   The optimizer did not use the new Color index.
   The Production.Product table contains only 504 rows,
   so SQL Server determined that scanning the clustered
   index was still an efficient plan.
*/


/* ============================================================
   SQL SERVER PROFILER - NOTES
   ============================================================

   SQL Server Profiler can be used to monitor SQL Server activity,
   investigate slow queries, troubleshoot performance problems,
   and capture database events.

   Major steps:

   1. Open SQL Server Profiler.
   2. Connect to the SQL Server instance.
   3. Select a trace template.
   4. Configure events and filters.
   5. Start the trace.
   6. Perform or monitor database activity.
   7. Stop the trace.
   8. Review the captured events to identify performance issues.

   Note: SQL Server Profiler is a legacy tool. Extended Events
   is the preferred modern SQL Server monitoring technology.
*/