use sql_challenge;

--1.Question: Find number of orders placed daily.
select order_date, COUNT(order_id) as total_orders
from clean_orders
group by order_date
order by order_date;

--2.Question: Find monthly order trend.
select MONTH(order_date) as month_no, MONTHNAME(order_date) as month_name, count(order_id) as total_orders
from clean_orders
group by month_no, month_name 
order by month_no;

--3.Question: Find the highest value order.
select o.order_id, SUM(p.payment_amount) as order_value
from clean_orders o
join clean_payments p on o.order_id = p.order_id
group by o.order_id
order by order_value desc
limit 5;

--4.Question: Find the lowest value order.
select o.order_id, SUM(p.payment_amount) as order_value
from clean_orders o
join clean_payments p on o.order_id = p.order_id
group by o.order_id
order by order_value asc
limit 5;

--5.Question: Find average quantity per order.
select avg(order_quantity) as avg_order_size
from (
    SELECT order_id, SUM(quantity) as order_quantity
    from clean_order_details
    group by order_id
    ) t;

--6.Question: Categorize orders by quantity size (Small / Medium / Large Orders).
select 
    CASE
        when quantity <= 2
        then 'small order'

        when quantity <= 5
        then 'medium order'

        else 'large order'
    end as order_type, count(*) as total_orders
from clean_order_details
group by order_type;

--7.Question: Find the day with the highest number of orders.
select order_date, COUNT(order_id) as total_orders
from clean_orders
group by order_date
order by total_orders DESC
limit 5;