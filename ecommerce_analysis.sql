-- Query 1: Total sales by category
SELECT Category, SUM(Amount) as Total_Sales
FROM amazon_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Query 2: Monthly sales trends
SELECT strftime('%Y-%m', Date) as Month, SUM(Amount) as Total_Sales
FROM amazon_sales
GROUP BY Month
ORDER BY Month;

-- Query 3: Sales by fulfillment method
SELECT Fulfilment, SUM(Amount) as Total_Sales, SUM(Qty) as Total_Quantity
FROM amazon_sales
GROUP BY Fulfilment
ORDER BY Total_Sales DESC;

-- Query 4: Top 5 products by sales
SELECT SKU, Category, SUM(Amount) as Total_Sales
FROM amazon_sales
GROUP BY SKU, Category
ORDER BY Total_Sales DESC
LIMIT 5;
