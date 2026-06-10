-- =========================================
-- Project: E-Commerce RFM Customer Segmentation
-- Database: PostgreSQL
-- Author: Anand
-- =========================================

CREATE TABLE online_retail (
InvoiceNo VARCHAR(20),
StockCode VARCHAR(20),
Description TEXT,
Quantity VARCHAR(20),
InvoiceDate TIMESTAMP,
UnitPrice NUMERIC(10, 2),
CustomerID VARCHAR(20),
Country VARCHAR(20),
TotalPrice NUMERIC(10, 2)
);


SELECT COUNT(*) FROM online_retail;

ALTER TABLE online_retail
ALTER COLUMN Quantity TYPE INT
USING Quantity::INT;



-- =========================================
-- QUERY 1: Total Business Overview
-- =========================================

SELECT
COUNT(DISTINCT InvoiceNo) AS total_orders,
COUNT(DISTINCT CustomerID) AS total_customers,
COUNT(DISTINCT StockCode) AS total_products,
ROUND(SUM(TotalPrice)) AS total_revenue
FROM online_retail;



-- =========================================
-- QUERY 2: Top 10 Countries by Revenue
-- =========================================

SELECT country,
COUNT(DISTINCT CustomerID) AS customers,
ROUND(SUM(TotalPrice)) AS revenue
FROM online_retail
GROUP BY country
ORDER BY revenue DESC
LIMIT 10; 



-- =========================================
-- QUERY 3: Monthly Revenue Trend
-- =========================================

SELECT
    TO_CHAR(InvoiceDate, 'YYYY-MM') AS month,
	COUNT(DISTINCT InvoiceNo) AS total_orders,
	ROUND(SUM(TotalPrice)) AS Revenue
FROM online_retail
GROUP BY month
ORDER BY month;



-- =========================================
-- QUERY 4: Top 10 Best-Selling Products
-- =========================================

SELECT
    Description AS product, 
	SUM(Quantity) AS total_sold,
	ROUND(SUM(TotalPrice)) AS revenue
FROM online_retail 
GROUP BY description
ORDER BY total_sold DESC
LIMIT 10;



-- =========================================
-- QUERY 5: Top 10 Customer by Revenue
-- =========================================

SELECT CustomerID,
    COUNT(DISTINCT InvoiceNo) AS total_orders, 
	ROUND(SUM(TotalPrice)) AS total_revenue
FROM online_retail
GROUP BY CustomerID
ORDER BY total_revenue DESC
LIMIT 10;



-- =========================================
-- QUERY 6: Repeat vs One-Time Customers
-- =========================================

WITH customer_orders AS (
    SELECT CustomerID, 
	COUNT(DISTINCT InvoiceNo) AS order_count
	FROM online_retail
	GROUP BY CustomerID
)
SELECT
    CASE
	    WHEN order_count = 1 THEN 'One-Time Customer'
		ELSE 'Repeat Customer'
	END AS customer_type,
	COUNT(*) AS total_customers
FROM customer_orders
GROUP BY customer_type;



-- =========================================
-- QUERY 7: RFM Base Table
-- =========================================

SELECT
    CustomerID,
	MAX(InvoiceDate::DATE) AS last_purchase_date,
	(SELECT MAX(InvoiceDate::DATE) FROM online_retail)
	    - MAX(InvoiceDate::DATE) AS recency_days,
	COUNT(DISTINCT InvoiceNo) AS frequency, 
	ROUND(SUM(TotalPrice)::NUMERIC, 2) AS monetary
FROM online_retail
GROUP BY CustomerID
ORDER BY monetary DESC
LIMIT 10;
