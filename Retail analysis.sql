-- SQL Retail Sales Analysis - P1
CREATE DATABASE sql_project;

USE sql_project;

-- Create TABLE
CREATE TABLE retail_sales
		(
			transactions_id	INT PRIMARY KEY,
			sale_date DATE,
			sale_time TIME,
			customer_id	INT,
            gender VARCHAR(15),
			age INT,
			category VARCHAR(15), 
			quantiy INT,
			price_per_unit FLOAT,
			cogs FLOAT,
			total_sale FLOAT
);

Select * from retail_sales;

Select * from retail_sales
LIMIT 10;

Select 
	COUNT(*) 
 from retail_sales;

SELECT * FROM retail_sales
WHERE 
    transactions_id = ''
    OR
    sale_date is NULL
    OR 
    sale_time = ''
    OR
    gender = ''
    OR
    category = ''
    OR
    quantiy = ''
    OR
    price_per_unit = ''
    OR
    cogs = ''
    OR
    total_sale = '';
    

-- Data Exploration

-- How many sales we have? 1987
SELECT COUNT(*) as total_sale FROM retail_sales;

-- How many uniuque customers we have? 155
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales;

-- Beauty, Clothing, Electronics only 3 categories
SELECT DISTINCT category FROM retail_sales;

-- Data Analysis & Business Key Problems & Answers

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- 12 sales done on this date
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- 0 sales for quantity sold more than 10 and 4 but 18 sales for quantity sold more than 3 
SELECT * FROM retail_sales
WHERE 
    category = 'Clothing'
    AND quantiy > 3
	AND MONTH(sale_date) = 11
	AND YEAR(sale_date) = 2022;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Beauty: netsale 286790 and total orders 611; Clothing: 309995 and 698; Electronics: 311445 and 678. 
SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- 40.42 is the average age of customers 
SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- 307 transactions where total sale is greater than 1000
SELECT * FROM retail_sales
WHERE total_sale > 1000;









