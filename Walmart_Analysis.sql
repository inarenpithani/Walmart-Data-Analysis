
-- Walmart Project Queries - MySQL

use walmart_db;
SELECT * FROM walmart;
SELECT COUNT(*) FROM walmart;


-- Count payment methods and number of transactions by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments
FROM walmart
GROUP BY payment_method;

-- Count distinct branches
SELECT COUNT(DISTINCT branch) FROM walmart;

-- Find the minimum quantity sold
SELECT MIN(quantity) FROM walmart;

-- Project Question #1: What are the different payment methods, and how many transactions and 
-- items were sold with each method?

SELECT 
	payment_method, 
    COUNT(*) AS TOT_trans, 
    SUM(quantity) AS tot_qty
FROM walmart 
GROUP BY payment_method;


-- Project Question #2: Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating

SELECT branch, category, avg_rating
FROM (
	SELECT 
		branch,
		category,
		ROUND(AVG(rating),1) AS avg_rating,
		RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS raank
	FROM walmart
	GROUP BY branch, category
) AS ranked
WHERE raank = 1;


-- Project Question #3: Identify the busiest day for each branch based on the number of transactions

