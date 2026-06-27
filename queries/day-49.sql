use sql_challenge;

--1.Query: Find Top 5 Customers by Revenue using CTE.
with customer_revenue as
(
select o.customer_id, c.customer_name, SUM(p.payment_amount) as customerwise_revenue
from clean_customers c
join clean_orders o on c.customer_id = o.customer_id
join clean_payments p on o.order_id = p.order_id
group by c.customer_name, o.customer_id
)

select * from customer_revenue
order by customerwise_revenue desc
limit 5;

--2.Query: Find Top 5 Products by Quantity Sold using CTE.
with product_sales AS
(
select od.product_id, p.product_name, SUM(od.quantity) as total_quantity_sold
from clean_order_details od
join clean_products p on od.product_id = p.product_id
group by od.product_id, p.product_name
)
select * from product_sales
order by total_quantity_sold desc
limit 5;

--3.Query: Rank customers based on generated revenue using DENSE_RANK().
select customer_id, customer_name, customerwise_revenue, DENSE_RANK() over (order by customerwise_revenue desc) as customer_rank
from
(
    select o.customer_id, c.customer_name, SUM(p.payment_amount) as customerwise_revenue
    from clean_customers c
    join clean_orders o on c.customer_id = o.customer_id
    join clean_payments p on o.order_id = p.order_id
    group by c.customer_name, o.customer_id
    
) as t;

--OR--

select o.customer_id, c.customer_name, SUM(p.payment_amount) as customerwise_revenue, DENSE_RANK() over (order by SUM(p.payment_amount) desc) as customer_rank
from clean_customers c
join clean_orders o on c.customer_id = o.customer_id
join clean_payments p on o.order_id = p.order_id
group by c.customer_name, o.customer_id;
    
--4.Query: Rank products based on quantity sold using RANK().
SELECT product_id, product_name, total_quantity_sold, RANK() OVER (ORDER BY total_quantity_sold DESC) AS product_rank
FROM (
    SELECT od.product_id, p.product_name, SUM(od.quantity) AS total_quantity_sold
    FROM clean_order_details od
    JOIN clean_products p ON od.product_id = p.product_id
    GROUP BY od.product_id, p.product_name
) AS t;

--OR--

SELECT od.product_id, p.product_name, SUM(od.quantity) AS total_quantity_sold, RANK() OVER (ORDER BY SUM(od.quantity) DESC) AS product_rank
FROM clean_order_details od
JOIN clean_products p ON od.product_id = p.product_id
GROUP BY od.product_id, p.product_name;

--5.Query: Find category-wise revenue using CTE.
with cat_rev as
(
select p.category, SUM(od.quantity * p.price) as categorywise_revenue
from clean_order_details od 
join clean_products p on od.product_id = p.product_id
group by p.category
)

select * from cat_rev
order by categorywise_revenue desc;

--6.Query: Categorize customers into High, Medium, and Low Revenue groups using CASE.
select customer_id, SUM(payment_amount) as total_spent,
       CASE
       WHEN SUM(payment_amount) > 5000
       THEN 'High revenue'

       WHEN SUM(payment_amount) > 2000
       THEN 'Medium revenue'

       ELSE 'Low revenue'
       END AS revenue_category
from clean_orders o
join clean_payments p on o.order_id = p.order_id
group by customer_id;

--7.Query: Create Stored Procedure for Customer Revenue Report.
create procedure customer_revenue_report()
begin
    select c.customer_id, c.customer_name, SUM(p.payment_amount) as total_revenue
    from clean_customers c
    join clean_orders o on c.customer_id = o.customer_id
    join clean_payments p on o.order_id = p.order_id
    group by c.customer_id, c.customer_name
    order by total_revenue desc;
end;

call customer_revenue_report();