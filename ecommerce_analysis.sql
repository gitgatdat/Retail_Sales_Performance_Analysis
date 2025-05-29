-- Query 1: Total sales by product category
SELECT category, SUM(discounted_price) as Total_Sales
FROM amazon_sales
GROUP BY category
ORDER BY Total_Sales DESC;

-- Query 2: Average discount by category
SELECT category, AVG(discount_percentage) as Avg_Discount
FROM amazon_sales
GROUP BY category
ORDER BY Avg_Discount DESC;

-- Query 3: Top 5 products by rating and sales
SELECT product_name, rating, SUM(discounted_price) as Total_Sales
FROM amazon_sales
GROUP BY product_name, rating
ORDER BY rating DESC, Total_Sales DESC
LIMIT 5;
