-- retrieve the total number of customers from each region.
SELECT Region, COUNT(DISTINCT `CustomerId`) AS Total_Customers
FROM sub_db
GROUP BY Region;

-- find the most popular subscription type by the number of customers.
SELECT SubscriptionType, COUNT(DISTINCT `CustomerId`) AS TotalCustomers
FROM sub_db
GROUP BY SubscriptionType
ORDER BY TotalCustomers DESC
LIMIT 1;

-- find customers who canceled their subscription within 6 months - NOT WORKING
SELECT `CustomerId`
FROM sub_db
WHERE Canceled = 'TRUE'
AND TIMESTAMPDIFF(MONTH, STR_TO_DATE(SubscriptionStart, '%m/%d/%Y'), STR_TO_DATE(SubscriptionEnd, '%m/%d/%Y')) <= 6;


-- calculate the average subscription duration for all customers
SELECT AVG(TIMESTAMPDIFF(MONTH, STR_TO_DATE(SubscriptionStart, '%m/%d/%Y'), 
                         IFNULL(STR_TO_DATE(SubscriptionEnd, '%m/%d/%Y'), CURDATE()))) AS AvgDurationMonths
FROM sub_db;

-- find customers with subscriptions longer than 12 months - NOT WORKING
SELECT `CustomerId`
FROM sub_db
WHERE TIMESTAMPDIFF(MONTH, STR_TO_DATE(SubscriptionStart, '%m/%d/%Y'), 
                         IFNULL(STR_TO_DATE(SubscriptionEnd, '%m/%d/%Y'), CURDATE())) > 12;

-- calculate total revenue by subscription type - NO VLAUE FOR QUANTIY AND PRICE
SELECT SubscriptionType, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM sub_db
GROUP BY SubscriptionType;

-- find the top 3 regions by subscription cancellations.
SELECT Region, COUNT(`CustomerId`) AS TotalCancellations
FROM sub_db
WHERE Canceled = 'TRUE'
GROUP BY Region
ORDER BY TotalCancellations DESC
LIMIT 3;

-- find the total number of active and canceled subscriptions
SELECT Canceled, COUNT(`CustomerId`) AS TotalSubscriptions
FROM sub_db
GROUP BY Canceled;

RENAME TABLE lita2 TO sub_db;










