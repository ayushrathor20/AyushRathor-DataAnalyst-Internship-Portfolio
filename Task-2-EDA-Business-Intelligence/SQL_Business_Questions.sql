
-- ApexPlanet Task 2: SQL Business Questions
-- Dataset: Cleaned ApexPlanet Sales Dataset

-- Q1. What is the total sales revenue generated from all orders?
SELECT
    ROUND(SUM(Total_Sales), 2) AS Total_Revenue
FROM sales;


-- Q2. Which product category generates the highest total revenue?
SELECT
    Category,
    ROUND(SUM(Total_Sales), 2) AS Total_Revenue,
    SUM(Quantity) AS Total_Units_Sold
FROM sales
GROUP BY Category
ORDER BY Total_Revenue DESC;


-- Q3. Which products are generating the highest revenue?
SELECT
    Product,
    Category,
    ROUND(SUM(Total_Sales), 2) AS Total_Revenue,
    SUM(Quantity) AS Total_Units_Sold
FROM sales
GROUP BY Product, Category
ORDER BY Total_Revenue DESC
LIMIT 10;


-- Q4. How does total sales revenue change month by month?
SELECT
    Year,
    Month,
    Month_Name,
    ROUND(SUM(Total_Sales), 2) AS Total_Revenue,
    SUM(Quantity) AS Total_Units_Sold
FROM sales
GROUP BY Year, Month, Month_Name
ORDER BY Year, Month;


-- Q5. Which customers generate the highest total revenue?
-- JOIN between sales and customers tables
SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.City,
    ROUND(SUM(s.Total_Sales), 2) AS Total_Revenue,
    SUM(s.Quantity) AS Total_Units_Sold
FROM sales s
JOIN customers c
    ON s.Customer_ID = c.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name,
    c.City
ORDER BY Total_Revenue DESC
LIMIT 10;
