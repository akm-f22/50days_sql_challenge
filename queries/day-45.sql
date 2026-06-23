use sql_challenge;

--1.Find top customers by number of orders
select c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders
from clean_customers c
join clean_orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_orders desc;

--2.Find top customers by generated revenue
select c.customer_id, c.customer_name, SUM(p.payment_amount) as total_revenue
from clean_customers c
join clean_orders o on c.customer_id = o.customer_id
join clean_payments p on o.order_id = p.order_id
group by c.customer_id, c.customer_name
order by total_revenue desc;

--3.Find customers with no orders
select  c.customer_id, c.customer_name
from clean_customers c
LEFT JOIN clean_orders o on c.customer_id = o.customer_id
where o.order_id is null;

--4.Analyze new customer signup trend month-wise
select MONTH(signup_date) as month_no, MONTHNAME(signup_date) as month_name, COUNT(customer_id) as new_customers
from clean_customers
group by MONTH(signup_date), MONTHNAME(signup_date)
order by month_no;

--5.Find repeat customers with multiple orders
select customer_id, count(order_id) as total_orders
from clean_orders
group by customer_id
having count(order_id) > 1;

--6.Calculate customer lifetime value
select  c.customer_id, c.customer_name, sum(p.payment_amount) as lifetime_value
from clean_customers c
join clean_orders o on c.customer_id = o.customer_id
join clean_payments p on o.order_id = p.order_id
group by c.customer_id, c.customer_name
order by lifetime_value desc;

--7.Calculate average spend per customer
select c.customer_id, c.customer_name, avg(p.payment_amount) as avg_spend
from clean_customers c
join clean_orders o on c.customer_id = o.customer_id
join clean_payments p on o.order_id = p.order_id
group by c.customer_id, c.customer_name;

--8.Find total customers per city
select city, count(customer_id) as total_customers
from clean_customers
group by city
order by total_customers desc;