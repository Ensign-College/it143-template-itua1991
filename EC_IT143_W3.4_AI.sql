/***********************************************************************************
NAME: EC_IT143_W3.4_ITUA
PURPOSE: AdventureWorks 2022 questions and SQL answers for EC IT143 Week 3.4.

MODIFICATION LOG:
Ver Date       Author             Description
---- ---------- ----------------- ------------------------------------------------
1.0 09/17/2026 Itua A Thank-God    Built this script for EC IT143 W3.4.
-----------------------------------------------------------------------------------
RUNTIME:
Varies by query

NOTES:
This script answers eight questions using the AdventureWorks 2022 database.
The questions include two Marginal, two Moderate, two Increased, and two
Metadata questions. Two questions are my own, and six questions were created
by other students. Each question includes the original author.

Database: AdventureWorks2022
***********************************************************************************/

USE AdventureWorks2022;
GO


/******************************************************************************
QUESTION 1 - BUSINESS USER: MARGINAL
Original Author: Itua A Thank-God

Question:
What are the ten most expensive products based on list price?

Answer:
This query returns the ten products with the highest list prices.
******************************************************************************/

-- Q1: What are the ten most expensive products based on list price?
-- A1: This query returns the ten products with the highest list prices.

SELECT TOP 10
    ProductID,
    Name AS ProductName,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
GO


/******************************************************************************
QUESTION 2 - BUSINESS USER: MARGINAL
Original Author: Alice Sharon Chamdimba

Question:
Which products currently have lowest standard costs?

Answer:
This query lists the ten products with the lowest standard costs.
******************************************************************************/

-- Q2: Which products currently have lowest standard costs?
-- A2: This query returns the ten products with the lowest standard costs.

SELECT TOP 10
    ProductID,
    Name AS ProductName,
    StandardCost
FROM Production.Product
ORDER BY StandardCost ASC;
GO


/******************************************************************************
QUESTION 3 - BUSINESS USER: MODERATE
Original Author: Itua A Thank-God

Question:
Which products are currently being sold, and what are their list prices
and product categories?

Answer:
This query identifies products that have not reached their sell end date
and displays their list prices and product categories.
******************************************************************************/

-- Q3: Which products are currently being sold, and what are their list
-- prices and product categories?
-- A3: This query identifies active products and their categories and prices.

SELECT
    p.ProductID,
    p.Name AS ProductName,
    p.ListPrice,
    pc.Name AS ProductCategory,
    ps.Name AS ProductSubcategory
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE p.SellEndDate IS NULL
  AND p.ListPrice > 0
ORDER BY p.ListPrice DESC;
GO


/******************************************************************************
QUESTION 4 - BUSINESS USER: MODERATE
Original Author: Alice Sharon Chamdimba

Question:
Which five customers have placed the greatest number of sales orders,
and how many orders has each customer placed?

Answer:
This query counts sales orders for each customer and returns the five
customers with the highest number of orders.
******************************************************************************/

-- Q4: Which five customers have placed the greatest number of sales orders,
-- and how many orders has each customer placed?
-- A4: This query counts each customer's sales orders and returns the top five.

SELECT TOP 5
    CustomerID,
    COUNT(DISTINCT SalesOrderID) AS NumberOfOrders
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY NumberOfOrders DESC;
GO


/******************************************************************************
QUESTION 5 - BUSINESS USER: INCREASED
Original Author: Hali Neville

Question:
I need to understand more about mountain bike orders during Q2 of 2021.
Specifically, I would like to know how much mountain bike sales looked like
by frame color during that time period. Can you create a list that tells me
the quantity sold, list price, standard cost, and estimated net revenue?

NOTE:
AdventureWorks sample sales data is historical. The original question uses
2021, but the AdventureWorks dataset may not contain sales for that year.
The query below uses Q2 2013, which is within the historical AdventureWorks
sales data, so the question can be answered using the sample database.

Answer:
This query summarizes mountain bike sales by month and frame color,
including quantity sold, average list price, average standard cost,
and estimated net revenue.
******************************************************************************/

-- Q5: Reworked from Hali Neville's question to use Q2 2013 because the
-- AdventureWorks sample database contains historical sales data for that period.
-- A5: This query summarizes mountain bike sales by month and frame color.

SELECT
    YEAR(soh.OrderDate) AS SalesYear,
    MONTH(soh.OrderDate) AS SalesMonth,
    p.Color AS FrameColor,
    SUM(sod.OrderQty) AS QuantitySold,
    AVG(p.ListPrice) AS AverageListPrice,
    AVG(p.StandardCost) AS AverageStandardCost,
    SUM(sod.OrderQty * (p.ListPrice - p.StandardCost))
        AS EstimatedNetRevenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bikes'
  AND ps.Name = 'Mountain Bikes'
  AND soh.OrderDate >= '2013-04-01'
  AND soh.OrderDate < '2013-07-01'
GROUP BY
    YEAR(soh.OrderDate),
    MONTH(soh.OrderDate),
    p.Color
ORDER BY
    SalesYear,
    SalesMonth,
    QuantitySold DESC;
GO


/******************************************************************************
QUESTION 6 - BUSINESS USER: INCREASED
Original Author: Alice Sharon Chamdimba

Question:
The marketing team is evaluating customer purchasing patterns across
different regions. Identify the five sales territories with the highest
sales revenue and show the total revenue and number of orders associated
with each territory.

Answer:
This query calculates total sales revenue and the number of sales orders
for each territory and returns the top five territories.
******************************************************************************/

-- Q6: Which five sales territories have the highest sales revenue, and what
-- are the total revenue and number of orders associated with each territory?
-- A6: This query summarizes sales revenue and order counts by territory.

SELECT TOP 5
    st.TerritoryID,
    st.Name AS TerritoryName,
    SUM(sod.LineTotal) AS TotalSalesRevenue,
    COUNT(DISTINCT soh.SalesOrderID) AS NumberOfOrders
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Sales.SalesTerritory AS st
    ON soh.TerritoryID = st.TerritoryID
GROUP BY
    st.TerritoryID,
    st.Name
ORDER BY
    TotalSalesRevenue DESC;
GO


/******************************************************************************
QUESTION 7 - METADATA
Original Author: Alice Sharon Chamdimba

Question:
List all tables in the AdventureWorks database that contain a column named
ProductID using the INFORMATION_SCHEMA.COLUMNS view.

Answer:
This query searches the INFORMATION_SCHEMA.COLUMNS view for columns named
ProductID and displays the related schemas and tables.
******************************************************************************/

-- Q7: List all tables in the AdventureWorks database that contain a column
-- named ProductID using the INFORMATION_SCHEMA.COLUMNS view.
-- A7: This query identifies every table containing a ProductID column.

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID'
ORDER BY
    TABLE_SCHEMA,
    TABLE_NAME;
GO


/******************************************************************************
QUESTION 8 - METADATA
Original Author: Benedict Dzidzorfe

Question:
Can you create a list of tables in AdventureWorks that contain a column
with one of these names: TerritoryID or SalesOrderID?

Answer:
This query searches the INFORMATION_SCHEMA.COLUMNS view for tables that
contain either TerritoryID or SalesOrderID.
******************************************************************************/

-- Q8: Can you create a list of tables in AdventureWorks that contain a
-- column with one of these names: TerritoryID or SalesOrderID?
-- A8: This query identifies tables containing TerritoryID or SalesOrderID.

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN ('TerritoryID', 'SalesOrderID')
ORDER BY
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME;
GO


/******************************************************************************
END OF SCRIPT

Summary:
Q1 - Marginal    - My question
Q2 - Marginal    - Alice Sharon Chamdimba
Q3 - Moderate    - My question
Q4 - Moderate    - Alice Sharon Chamdimba
Q5 - Increased   - Hali Neville
Q6 - Increased   - Alice Sharon Chamdimba
Q7 - Metadata    - Alice Sharon Chamdimba
Q8 - Metadata    - Benedict Dzidzorfe

Total:
2 questions created by me
6 questions created by other students
2 questions in each required category
******************************************************************************/