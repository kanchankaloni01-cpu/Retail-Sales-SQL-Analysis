CREATE DATABASE retail_project;
USE retail_project;
CREATE TABLE retail_sales(
transcation_id INT PRIMARY KEY,
sale_date DATE,
customer_id VARCHAR(50),
gender VARCHAR (20),
age INT,
product_category VARCHAR (30),
quantity INT,
price_per_unit INT,
total_amount INT);


SELECT COUNT(*) transcation_id FROM retail_sales;


SELECT COUNT(*) AS total_order, product_category FROM retail_sales GROUP BY product_category;
SELECT * FROM retail_sales
WHERE total_amount >= 1500; 

SELECT gender, AVG(age) FROM retail_sales GROUP BY gender;
SELECT * FROM retail_sales 
WHERE age < 30 AND
product_category = 'Beauty';

SELECT * FROM retail_sales ORDER BY total_amount DESC LIMIT 5;
SELECT product_category, SUM(total_amount) AS total_revenue FROM retail_sales GROUP BY product_category
ORDER BY total_revenue DESC;

SELECT customer_id, SUM(total_amount) AS total_revenue FROM retail_sales GROUP BY customer_id
HAVING total_revenue > 1500;

SELECT DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
COUNT(transcation_id) AS total_orders,
SUM(total_amount) AS monthly_revenue
FROM retail_sales
WHERE YEAR (sale_date) = 2023
GROUP BY sale_month
ORDER BY sale_month;

SELECT product_category, gender, 
SUM(total_amount) FROM retail_sales GROUP BY product_category, gender;

SELECT 
CASE WHEN age < 35 THEN 'Young'
ELSE 'Senior'
END AS age_group,
COUNT(transcation_id) FROM retail_sales
GROUP BY age_group;







