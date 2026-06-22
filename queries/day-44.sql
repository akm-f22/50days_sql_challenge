use sql_challenge;

--1.Total Customers
SELECT COUNT(*) AS total_customer
FROM clean_customers;

--2.Total Orders
SELECT COUNT(*) AS total_orders
FROM clean_orders;

--3. Total Revenue
SELECT SUM(payment_amount) AS total_revenue
FROM clean_payments;

--4.Avg Order Value
SELECT AVG(payment_amount) AS avg_order_value
FROM clean_payments;

--5.Total Products Sold
SELECT SUM(quantity) AS total_products_sold
FROM clean_order_details;

--6.Orders Per Customer
SELECT customer_id, COUNT(order_id) AS customerwise_orders
FROM clean_orders
GROUP BY customer_id;
