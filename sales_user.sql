SELECT current_user;

SELECT current_database();

SELECT * FROM customers;

DELETE FROM customers where customer_id = 1;

UPDATE orders SET  total_amount = 80000 WHERE order_id = 22;

SELECT * FROM products

SELECT
    has_table_privilege(
        'sales_user',
        'public.orders',
        'SELECT'
    );


INSERT INTO customers
(first_name, last_name, email, phone, address, city, state, zipcode, country)
VALUES
('kash', 'Sharma', 'kash@gmail.com', '98410001', 'Boudha', 'Kathmandu', 'Bagmati', '44600', 'Nepal')


UPDATE orders
SET total_amount = 70000
WHERE order_id = 26;


-- INSERTING 20 RECORDS INTO orders table--
INSERT INTO orders
(customer_id, total_amount)
VALUES
(26, 80000.00)