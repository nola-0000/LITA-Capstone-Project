select *
from sales_db;

-- retrieve the total sales for each product category
SELECT Product, SUM(Quantity * UnitPrice) AS TotalSales
FROM sales_db
GROUP BY Product;

-- find the number of sales transactions in each region.
SELECT Region, COUNT(OrderID) AS NumberOfSales
FROM sales_db
GROUP BY Region;


-- find the highest-selling product by total sales value.
SELECT Product, SUM(Quantity * UnitPrice) AS TotalSales
FROM sales_db
GROUP BY Product
ORDER BY TotalSales DESC
LIMIT 1;


-- calculate total revenue per product.
SELECT Product, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM sales_db
GROUP BY Product;

-- calculate monthly sales totals for the current year - CONFIRMING IF THEY WANT THEM TO DO FEATURE ENGINEERING
SELECT MONTH(OrderDate) AS Month, SUM(Quantity * UnitPrice) AS MonthlySales
FROM sales_db
WHERE YEAR(OrderDate) = YEAR(CURDATE())
GROUP BY MONTH(OrderDate);

-- find the top 5 customers by total purchase amount.
SELECT `Customer Id`, SUM(Quantity * UnitPrice) AS TotalPurchase
FROM sales_db
GROUP BY `Customer Id`
ORDER BY TotalPurchase DESC
LIMIT 5;

-- calculate the percentage of total sales contributed by each region.
SELECT Region, 
       SUM(Quantity * UnitPrice) / (SELECT SUM(Quantity * UnitPrice) FROM sales_db) * 100 AS SalesPercentage
FROM sales_db
GROUP BY Region;

-- identify products with no sales in the last quarter.
SELECT DISTINCT Product
FROM sales_db
WHERE Product NOT IN (
   SELECT Product
   FROM sales_db
   WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
);

SELECT DISTINCT Product
FROM sales_db
WHERE Product NOT IN (
   SELECT Product
   FROM sales_db
   WHERE STR_TO_DATE(OrderDate, '%m/%d/%Y') >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
);

RENAME TABLE lita TO sales_db;












