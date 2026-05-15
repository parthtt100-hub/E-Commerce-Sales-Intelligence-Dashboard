create database E_Commerce;

use E_Commerce;


select * from sales ;

SELECT
AVG(sales) AS avg_order_value
FROM sales;

select count(distinct order_id) from sales ;

select count(distinct customer_id) from sales ;

SELECT order_id, product_id, COUNT(*)
FROM sales
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

SELECT *
FROM sales
LIMIT 10;

SELECT *
FROM sales
WHERE customer_id IS NULL
   OR sales IS NULL
   OR profit IS NULL;

select
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM sales;

SELECT
category,
SUM(sales) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT
category,
SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

SELECT
product_name,
SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
product_name,
SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
HAVING total_profit < 0
ORDER BY total_profit;

SELECT
region,
SUM(profit) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit DESC;

SELECT
discount,
SUM(profit) AS total_profit
FROM sales
GROUP BY discount
ORDER BY discount;

SELECT
ship_mode,
AVG(shipping_cost) AS avg_shipping_cost,
SUM(profit) AS total_profit
FROM sales
GROUP BY ship_mode;

SELECT
customer_name,
SUM(sales) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
customer_id,
customer_name,
SUM(sales) AS lifetime_value
FROM sales
GROUP BY customer_id, customer_name
ORDER BY lifetime_value DESC;

SELECT
customer_id, 
COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY customer_id
HAVING total_orders > 1;

SELECT
customer_id,
COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY customer_id
HAVING total_orders = 1;

SELECT
customer_id,
MAX(order_date) AS last_purchase
FROM sales
GROUP BY customer_id;

SELECT
customer_id,
MAX(order_date) AS last_purchase
FROM sales
GROUP BY customer_id
HAVING DATEDIFF(MAX(order_date), MIN(order_date)) > 90;

SELECT
customer_id,
COUNT(order_id) AS purchase_frequency
FROM sales
GROUP BY customer_id
ORDER BY purchase_frequency DESC;

SELECT
YEAR(order_date) AS year,
MONTH(order_date) AS month,
SUM(sales) AS total_sales
FROM sales
GROUP BY year, month
ORDER BY year, month;

SELECT
YEAR(order_date) AS year,
MONTH(order_date) AS month,
SUM(profit) AS total_profit
FROM sales
GROUP BY year, month
ORDER BY year, month;

SELECT
MONTH(order_date) AS month,
SUM(sales) AS total_sales
FROM sales
GROUP BY month
ORDER BY total_sales DESC;

SELECT
QUARTER(order_date) AS quarter,
SUM(sales) AS total_sales
FROM sales
GROUP BY quarter
ORDER BY quarter;

SELECT
product_name,
SUM(profit) AS total_profit,
RANK() OVER (ORDER BY SUM(profit) DESC) AS profit_rank
FROM sales
GROUP BY product_name;

SELECT
customer_name,
SUM(sales) AS total_sales,
DENSE_RANK() OVER (ORDER BY SUM(sales) DESC) AS customer_rank
FROM sales
GROUP BY customer_name;

SELECT
product_name,
SUM(profit) AS total_profit,
CASE
    WHEN SUM(profit) > 5000 THEN 'High Profit'
    WHEN SUM(profit) > 0 THEN 'Medium Profit'
    ELSE 'Loss'
END AS profit_status
FROM sales
GROUP BY product_name;

WITH category_sales AS (
SELECT
category,
product_name,
SUM(sales) AS total_sales
FROM sales
GROUP BY category, product_name
)
SELECT *,
RANK() OVER(PARTITION BY category ORDER BY total_sales DESC) AS rank_num
FROM category_sales;

SELECT
order_date,
sales,
SUM(sales) OVER (ORDER BY order_date) AS running_total
FROM sales;


select * from sales ;

