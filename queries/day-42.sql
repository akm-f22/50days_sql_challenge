use sql_challenge;

create table clean_customers
as
select * from raw_customers;

create table clean_orders
as
select * from raw_orders;

create table clean_products
as
select * from raw_products;

create table clean_order_details
as
select * from raw_order_details;

create table clean_payments
as
select * from raw_payments;




select * from clean_customers;
--removing spaces
update clean_customers
set customer_id = trim(customer_id),
    customer_name = trim(customer_name),
    city = trim(city),
    signup_date = trim(signup_date);

--standardize text
update clean_customers
set customer_name = upper(customer_name),
    city = upper(city);

--replace NULL values
update clean_customers
set city = 'UNKNOWN'
where city is null;

update clean_customers
set customer_name = 'UNKNOWN'
where customer_name is null;

update clean_customers
set signup_date = '01-01-2024'
where signup_date is null;

--remove duplicates
delete from clean_customers
where customer_id IN (
    select customer_id from(
        select customer_id, ROW_NUMBER() over (partition by customer_id order by customer_id) as rn
        from clean_customers
    ) t
    where rn > 1
)




select * from clean_orders;
--removing spaces
update clean_orders
set order_id = trim(order_id),
    customer_id = trim(customer_id),
    order_date = trim(order_date);
--standardize text
--replace NULL values
update clean_orders
set order_id = 'UNKNOWN'
where order_id is null;

update clean_orders
set customer_id = 'UNKNOWN'
where customer_id is null;

update clean_orders
set order_date = '01-01-2024'
where order_date is null;
--remove duplicates
delete from clean_orders
where order_id IN (
    select order_id from(
        select order_id, ROW_NUMBER() over (partition by order_id order by order_id) as rn
        from clean_orders
    ) t
    where rn > 1
)



select * from clean_products;
--removing spaces
update clean_products
set product_id = trim(product_id),
    product_name = trim(product_name),
    category = trim(category),
    price = trim(price);
--standardize text
update clean_products
set product_name = upper(product_name),
    category = upper(category);
--replace NULL values
update clean_products
set product_id = 'UNKNOWN'
where product_id is null;

update clean_products
set product_name = 'UNKNOWN'
where product_name is null;

update clean_products
set category = 'UNKNOWN'
where category is null;

update clean_products
set price = 'UNKNOWN'
where price is null;
--remove duplicates
delete from clean_products
where product_id IN (
    select product_id from(
        select product_id, ROW_NUMBER() over (partition by product_id order by product_id) as rn
        from clean_products
    ) t
    where rn > 1
)



select * from clean_order_details;
--removing spaces
update clean_order_details
set order_detail_id = trim(order_detail_id),
    order_id = trim(order_id),
    product_id = trim(product_id),
    quantity = trim(quantity);
--standardize text
--replace NULL values
update clean_order_details
set order_detail_id = 'UNKNOWN'
where order_detail_id is null;

update clean_order_details
set order_id = 'UNKNOWN'
where order_id is null;

update clean_order_details
set product_id = 'UNKNOWN'
where product_id is null;

update clean_order_details
set quantity = 'UNKNOWN'
where quantity is null;
--remove duplicates
delete from clean_order_details
where order_detail_id IN (
    select order_detail_id from(
        select order_detail_id, ROW_NUMBER() over (partition by order_detail_id order by order_detail_id) as rn
        from clean_order_details
    ) t
    where rn > 1
)




select * from clean_payments;
--removing spaces
update clean_payments
set payment_id = trim(payment_id),
    order_id = trim(order_id),
    payment_date = trim(payment_date),
    payment_amount = trim(payment_amount);
--standardize text
--replace NULL values
update clean_payments
set payment_id = 'UNKNOWN'
where payment_id is null;

update clean_payments
set order_id = 'UNKNOWN'
where order_id is null;

update clean_payments
set payment_date = '01-01-2024'
where payment_date is null;

update clean_payments
set payment_amount = 'UNKNOWN'
where payment_amount is null;
--remove duplicates
delete from clean_payments
where payment_id IN (
    select payment_id from(
        select payment_id, ROW_NUMBER() over (partition by payment_id order by payment_id) as rn
        from clean_payments
    ) t
    where rn > 1
)