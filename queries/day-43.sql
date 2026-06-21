use sql_challenge;

UPDATE clean_customers
SET signup_date = DATE_FORMAT(
                     STR_TO_DATE(signup_date,'%d-%m-%Y'),
                     '%Y-%m-%d'
                  )
WHERE signup_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

UPDATE clean_orders
SET order_date = DATE_FORMAT(
                     STR_TO_DATE(order_date,'%d-%m-%Y'),
                     '%Y-%m-%d'
                  )
WHERE order_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

UPDATE clean_payments
SET payment_date = DATE_FORMAT(
                     STR_TO_DATE(payment_date,'%d-%m-%Y'),
                     '%Y-%m-%d'
                  )
WHERE payment_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

ALTER TABLE clean_customers
MODIFY customer_id INT PRIMARY KEY,
MODIFY customer_name VARCHAR(100),
MODIFY city VARCHAR(100),
MODIFY signup_date DATE;

ALTER TABLE clean_products
MODIFY product_id INT PRIMARY KEY,
MODIFY product_name VARCHAR(100),
MODIFY category VARCHAR(100),
MODIFY price DECIMAL(10,2);

ALTER TABLE clean_orders
MODIFY order_id INT PRIMARY KEY,
MODIFY customer_id INT,
MODIFY order_date DATE;

ALTER TABLE clean_orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES clean_customers (customer_id);

ALTER TABLE clean_order_details
MODIFY order_detail_id INT PRIMARY KEY,
MODIFY order_id INT,
MODIFY product_id INT,
MODIFY quantity INT;

ALTER TABLE clean_order_details
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id)
REFERENCES clean_orders(order_id);

ALTER TABLE clean_order_details
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES clean_products(product_id);

ALTER TABLE clean_payments
MODIFY payment_id INT PRIMARY KEY,
MODIFY order_id INT,
MODIFY payment_amount DECIMAL(10,2),
MODIFY payment_date DATE;

ALTER TABLE clean_payments
ADD CONSTRAINT fk_payment_order
FOREIGN KEY (order_id)
REFERENCES clean_orders(order_id);