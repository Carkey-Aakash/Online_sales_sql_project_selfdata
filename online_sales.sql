-- create database name
CREATE DATABASE onlineretaildb;

-- creating table customers;
DROP TABLE IF exists customers;

CREATE TABLE customers (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zipcode VARCHAR(20),
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- creating table categories 
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
    category_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- creating table products
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category_id INT REFERENCES categories(category_id),
    price NUMERIC(10,2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- creating table orders
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10,2) NOT NULL
);
-- creating table order_item
DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (
    order_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    price NUMERIC(10,2)
);

-- ALTERING columns firstname and lastname
ALTER TABLE customers RENAME firstname TO first_name;
ALTER TABLE customers RENAME lastname TO last_name;

-- INSERTING 20 RECORDS INTO customers table--

INSERT INTO customers
(first_name, last_name, email, phone, address, city, state, zipcode, country)
VALUES
('Aakash', 'Sharma', 'aakash@gmail.com', '9841000001', 'Boudha', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('Ram', 'Thapa', 'ram@gmail.com', '9841000002', 'Lakeside', 'Pokhara', 'Gandaki', '33700', 'Nepal'),
('Sita', 'Gurung', 'sita@gmail.com', '9841000003', 'Baneshwor', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('John', 'Smith', 'john@gmail.com', '9841000004', 'Main Street', 'London', 'England', 'SW1A', 'UK'),
('Priya', 'Sharma', 'priya@gmail.com', '9841000005', 'Andheri', 'Mumbai', 'Maharashtra', '400001', 'India'),
('Bikash', 'Karki', 'bikash@gmail.com', '9841000006', 'Kalanki', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('Anisha', 'Rai', 'anisha@gmail.com', '9841000007', 'Dharan Road', 'Dharan', 'Koshi', '56700', 'Nepal'),
('Suman', 'Adhikari', 'suman@gmail.com', '9841000008', 'Butwal Road', 'Butwal', 'Lumbini', '32900', 'Nepal'),
('Nisha', 'Shrestha', 'nisha@gmail.com', '9841000009', 'Patan', 'Lalitpur', 'Bagmati', '44700', 'Nepal'),
('Rohan', 'KC', 'rohan@gmail.com', '9841000010', 'Koteshwor', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('Sneha', 'Joshi', 'sneha@gmail.com', '9841000011', 'Bharatpur', 'Chitwan', 'Bagmati', '44200', 'Nepal'),
('Sanjay', 'Tamang', 'sanjay@gmail.com', '9841000012', 'Bouddha', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('Manish', 'Poudel', 'manish@gmail.com', '9841000013', 'New Road', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('Puja', 'Maharjan', 'puja@gmail.com', '9841000014', 'Jawalakhel', 'Lalitpur', 'Bagmati', '44700', 'Nepal'),
('Kiran', 'Bista', 'kiran@gmail.com', '9841000015', 'Mahendrapul', 'Pokhara', 'Gandaki', '33700', 'Nepal'),
('Ashish', 'Rana', 'ashish@gmail.com', '9841000016', 'Dillibazar', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('Mina', 'Gurung', 'mina@gmail.com', '9841000017', 'Lakeside', 'Pokhara', 'Gandaki', '33700', 'Nepal'),
('Raj', 'Shahi', 'raj@gmail.com', '9841000018', 'Biratnagar Road', 'Biratnagar', 'Koshi', '56600', 'Nepal'),
('Sabina', 'Thapa', 'sabina@gmail.com', '9841000019', 'Chabahil', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('Deepak', 'Magar', 'deepak@gmail.com', '9841000020', 'Hetauda Road', 'Hetauda', 'Bagmati', '44100', 'Nepal');

-- INSERTING 20 RECORDS INTO categories table--

INSERT INTO categories
(category_name, description)
VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Men and women clothing'),
('Books', 'Books and educational materials'),
('Furniture', 'Home and office furniture'),
('Sports', 'Sports equipment and accessories'),
('Beauty', 'Beauty and personal care products'),
('Grocery', 'Daily grocery and food items'),
('Footwear', 'Shoes and footwear products'),
('Toys', 'Toys and games for children'),
('Automotive', 'Automotive parts and accessories'),
('Kitchen', 'Kitchen appliances and equipment'),
('Jewelry', 'Jewelry and fashion accessories'),
('Health', 'Health and wellness products'),
('Stationery', 'Stationery and office supplies'),
('Garden', 'Gardening tools and supplies'),
('Pet Supplies', 'Products for pets and animals'),
('Bags', 'Backpacks and travel bags'),
('Cameras', 'Cameras and photography equipment'),
('Music', 'Musical instruments and accessories'),
('Accessories', 'Computer and mobile accessories');

-- INSERTING 20 RECORDS INTO products table--

INSERT INTO products
(product_name, category_id, price, stock)
VALUES
('Laptop', 1, 85000.00, 10),
('T-Shirt', 2, 1500.00, 50),
('Python Book', 3, 2500.00, 20),
('Office Chair', 4, 12000.00, 15),
('Football', 5, 1800.00, 30),
('Face Cream', 6, 1200.00, 40),
('Rice 25kg', 7, 2200.00, 25),
('Running Shoes', 8, 4500.00, 18),
('Remote Car', 9, 1800.00, 30),
('Car Battery', 10, 15000.00, 8),
('Mixer Grinder', 11, 6500.00, 12),
('Silver Necklace', 12, 8500.00, 6),
('Vitamin Tablets', 13, 900.00, 35),
('Notebook Pack', 14, 500.00, 60),
('Garden Shovel', 15, 1100.00, 20),
('Dog Food', 16, 2500.00, 15),
('Travel Backpack', 17, 3500.00, 22),
('Digital Camera', 18, 55000.00, 5),
('Guitar', 19, 18000.00, 7),
('Wireless Mouse', 20, 1500.00, 45);

-- INSERTING 20 RECORDS INTO orders table--
INSERT INTO orders
(customer_id, total_amount)
VALUES
(1, 88000.00),
(2, 5500.00),
(3, 3600.00),
(4, 12000.00),
(5, 6300.00),
(6, 15000.00),
(7, 6500.00),
(8, 18000.00),
(9, 3000.00),
(10, 8500.00),
(11, 4600.00),
(12, 6500.00),
(13, 36000.00),
(14, 3000.00),
(15, 8500.00),
(16, 55000.00),
(17, 5000.00),
(18, 15000.00),
(19, 9000.00),
(20, 7000.00);

-- INSERTING 20 RECORDS INTO order_items table--
INSERT INTO order_items
(order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 85000.00),
(1, 20, 2, 1500.00),

(2, 3, 1, 2500.00),
(2, 2, 2, 1500.00),

(3, 5, 1, 1800.00),
(3, 9, 1, 1800.00),

(4, 4, 1, 12000.00),

(5, 8, 1, 4500.00),
(5, 13, 2, 900.00),

(6, 10, 1, 15000.00),

(7, 11, 1, 6500.00),

(8, 19, 1, 18000.00),

(9, 20, 2, 1500.00),

(10, 12, 1, 8500.00),

(11, 6, 2, 1200.00),
(11, 7, 1, 2200.00),

(12, 11, 1, 6500.00),

(13, 19, 2, 18000.00),

(14, 2, 2, 1500.00),

(15, 17, 1, 3500.00),
(15, 16, 2, 2500.00),

(16, 18, 1, 55000.00),

(17, 16, 2, 2500.00),

(18, 10, 1, 15000.00),

(19, 8, 2, 4500.00),

(20, 17, 2, 3500.00);

-- SELECTING ALL FROM customers table--
SELECT * FROM customers;

-- SELECTING ALL FROM categories table--
SELECT * FROM categories;

-- SELECTING ALL FROM products table--
SELECT * FROM products;

-- SELECTING ALL FROM order table--
SELECT * FROM orders;

-- SELECTING ALL FROM ORDER_ITEMS table
SELECT * FROM order_items;





--Query 1: Retrieve all orders for a specific customer

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_id,
    p.product_name,
    oi.quantity,
    p.price,
    o.order_date
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON oi.order_id = o.order_id
JOIN products p
    ON p.product_id = oi.product_id
WHERE c.customer_id = 1;

-- Query 2 Find the total sales for each product -- 
SELECT 
p.product_id,
p.product_name,
SUM(oi.quantity * oi.price) AS total_sales
FROM products p
JOIN order_items oi
	ON oi.product_id = p.product_id
GROUP BY p.product_id , p.product_name
ORDER BY total_sales DESC ;


-- Query 3 -Query 3: Calculate the average order value
SELECT AVG(total_amount) AS average_order_amount
FROM orders;

--Query 4: List the top 5 customers by total spending
SELECT
c.customer_id,
c.first_name,
c.last_name,
SUM(o.total_amount) AS total_spending
FROM customers c 
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY
	c.customer_id,c.first_name
ORDER BY 
	total_spending DESC LIMIT 5;

--Query 5: Retrieve the most popular product category
SELECT 
c.category_id,
c.category_name,
SUM(oi.quantity) AS popular_product
FROM categories c
JOIN products p
	ON c.category_id = p.category_id
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY 
	c.category_id, c.category_name
ORDER BY popular_product DESC
LIMIT 5;

-- Query 6: List all products that are out of stock, i.e. stock = 0
SELECT * FROM products WHERE stock = 0;

--Query 7: Find customers who placed orders in the last 30 days
SELECT DISTINCT c.customer_id,c.first_name FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE order_date >= CURRENT_TIMESTAMP - INTERVAL '30 days' ;


--Query 8: Calculate the total number of orders placed each month

-- two ways to solve this problem 
SELECT 
EXTRACT(MONTH FROM order_date) AS month,
COUNT(order_id) as order_placed
FROM orders
GROUP BY  
EXTRACT(MONTH FROM order_date)
ORDER BY order_placed DESC;

-- another way--
SELECT 
	DATE_TRUNC('month',order_date) as months,
	COUNT(order_id) AS order_placed
FROM orders
GROUP BY 
	DATE_TRUNC('month',order_date)
ORDER BY 
	order_placed DESC


--Query 9: Retrieve the details of the most recent order.
SELECT 
o.order_id,
c.first_name,
c.last_name,
p.product_name,
oi.quantity,
oi.price,
o.order_date
FROM orders o
JOIN customers c 
	ON c.customer_id = o.customer_id
JOIN order_items oi 
	ON o.order_id = oi.order_id
JOIN products p
	ON p.product_id = oi.product_id
ORDER BY o.order_date DESC LIMIT 1;

--Query 10: Find the average price of products in each category

SELECT
c.category_id,
c.category_name,
ROUND(AVG(p.price),2) AS avg_price
FROM products p
JOIN categories c 
	ON p.category_id = c .category_id
GROUP BY c.category_id , c.category_name

--Query 11: List customers who have never placed an order

-- Let's add one record for this 

INSERT INTO customers
(first_name, last_name, email, phone, address, city, state, zipcode, country)
VALUES
('Akash', 'Karki', 'akash@gmail.com', '9841200001', 'Boudha1', 'Kathmandu', 'Bagmati', '44600', 'Nepal')

-- now query

SELECT
c.customer_id,
c.first_name,
c.last_name,
c.email,
c.address,
c.state,
o.order_id
FROM customers c
  LEFT JOIN orders o 
	ON c.customer_id = o.customer_id
WHERE o.order_id IS  NULL

--Query 12: Retrieve the total quantity sold for each product

SELECT 
p.product_id,
p.product_name,
SUM(quantity) as total_quantity
FROM products p
JOIN order_items  oi
	ON	p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC

--Query 13: Calculate the total revenue generated from each category

SELECT
c.category_id,
c.category_name,
SUM(oi.quantity * oi.price) as total_revenue
FROM categories c
JOIN products p
	ON c.category_id = p.category_id
JOIN order_items oi
	ON 	oi.product_id = p.product_id
GROUP BY c.category_id,c.category_name
ORDER BY total_revenue DESC

--Query 14: Find the highest-priced product in each category
-- one way
SELECT
category_id,
category_name,
product_name,
price
FROM
(
SELECT
c.category_id,
c.category_name,
p.product_name,
p.price,
RANK() OVER(PARTITION BY c.category_id ORDER BY p.price DESC) AS price_rank

FROM products p 
JOIN categories c 
	ON p.category_id = c.category_id
) ranked_products
WHERE price_rank =1

-- another way
SELECT 
c.category_id,
c.category_name,
p.product_name,
p.price
FROM products p
JOIN categories c
	ON p.category_id = c.category_id

WHERE p.price = (
					SELECT MAX(p2.price) 
					FROM products p2
					WHERE p2.product_id = p.product_id )
ORDER BY p.price DESC



--Query 15: Retrieve orders with a total amount greater than a specific value (e.g., 10500)

SELECT c.customer_id, o.order_id, c.first_name,c.last_name,c.email,o.total_amount FROM orders o
JOIN customers c 
	ON 	o.customer_id = c.customer_id
WHERE o.total_amount > 10500
ORDER BY o.total_amount DESC


--Query 16: List products along with the number of orders they appear in
SELECT p.product_id,
p.product_name,
COUNT(oi.order_id) AS order_count
FROM products p 
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id,p.product_name
ORDER BY order_count DESC


--Query 17: Find the top 3 most frequently ordered products
SELECT p.product_id,
p.product_name,
COUNT( DISTINCT oi.order_id) AS order_count
FROM products p 
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id,p.product_name
ORDER BY order_count DESC LIMIT 3


-- Query 18: Calculate the total number of customers from each country
SELECT country,
COUNT(*) AS total_customer
FROM customers
GROUP BY country
ORDER BY total_customer DESC

--Query 19: Retrieve the list of customers along with their total spending
SELECT c.customer_id,
c.first_name,
c.last_name,
SUM(o.total_amount)  AS total_spending
FROM customers c 
JOIN orders o 
	ON c.customer_id = o.customer_id
GROUP BY 
	c.customer_id
ORDER BY
	total_spending DESC


--Query 20: List orders with more than a specified number of items (e.g., 2 items)

SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    SUM(oi.quantity) AS total_items
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY 
    o.order_id,
    o.customer_id,
    o.order_date
HAVING SUM(oi.quantity) > 2
ORDER BY total_items DESC;

-- LOG MAINTANENCE -- 

/*
We'll start by adding a table to keep logs of updates and deletions.

Step 1: Create a Log Table
Step 2: Create Triggers for Each Table
	
	A. Triggers for Products Table
		-- Trigger for INSERT on Products table
		-- Trigger for UPDATE on Products table
		-- Trigger for DELETE on Products table

	B. Triggers for Customers Table
		-- Trigger for INSERT on Customers table
		-- Trigger for UPDATE on Customers table
		-- Trigger for DELETE on Customers table
*/

-- Creating a Log Table
CREATE TABLE ChangeLog(
log_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
table_name VARCHAR(20),
operation VARCHAR(20),
record_id INT,
change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
changed_by VARCHAR(50)
);

-- creating a trigger function
CREATE OR REPLACE FUNCTION	log_product_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO	ChangeLog(table_name,operation,record_id,changed_by)
	VALUES('products','INSERT',NEW.product_id,CURRENT_USER);

	RAISE NOTICE 'Insert operation logged for Products table' ;

	RETURN NEW;
	
END;
$$;

-- CREATING A TRIGGER
CREATE TRIGGER trg_insert_product
AFTER INSERT 
ON 	products
FOR EACH ROW
EXECUTE FUNCTION log_product_insert()

-- lets us insert products
INSERT INTO products
(product_name, category_id, price, stock)
VALUES
('Wireless Mouse', 1, 5000.00, 10)

INSERT INTO products
(product_name, category_id, price, stock)
VALUES
('Football', 3, 15000.00, 5)

-- let's check products -- 
SELECT * FROM products;

-- let's check into log 
SELECT * FROM ChangeLog;


-- UPDATE TRIGGER FUNCTION--
CREATE OR REPLACE FUNCTION 	log_product_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO ChangeLog(table_name, operation, record_id, changed_by)
	VALUES ('products','UPDATE',NEW.product_id,CURRENT_USER);
	
	RAISE NOTICE 'Update operation logged for product table';
	RETURN NEW;
END;
$$;

-- creating trigger for update -- 
CREATE TRIGGER trg_update_product
AFTER UPDATE 
ON 	products
FOR EACH ROW
EXECUTE FUNCTION log_product_update();

-- let's us update products 
UPDATE products SET price = 50000 where product_id = 2;
UPDATE products SET product_name = 'Laptop' where product_id = 4;

-- lets check into product first-- 
SELECT * FROM products;

-- lets check into log -- 
SELECT * FROM ChangeLog ;

-- DELETE TRIGGER FUNCTION -- 
CREATE OR REPLACE FUNCTION 	log_product_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('products','DELETE',OLD.product_id,CURRENT_USER);

	RAISE NOTICE 'Delete operation logged for products table';
	RETURN OLD;
END;
$$;

-- Creating trigger for delete --
CREATE TRIGGER trg_delete_product
AFTER DELETE
ON products 
FOR EACH ROW
EXECUTE FUNCTION log_product_delete()

-- deleting records 
DELETE FROM products WHERE product_id =22;

-- checking in products table -- 
SELECT * FROM products;

-- checking in changeLog table--
SELECT * FROM ChangeLog;



-- CREATING  A TRIGGER FUNCTION FOR customers table 
CREATE OR REPLACE FUNCTION log_customer_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
 	 
	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('customers', 'INSERT',NEW.customer_id,CURRENT_USER);

	RAISE NOTICE 'Insert operation logged for customer table';

	RETURN NEW;

END;
$$;

-- creating trigger-- 
CREATE TRIGGER trg_insert_customer
AFTER INSERT 
ON customers
FOR EACH ROW 
EXECUTE FUNCTION log_customer_insert()

-- Inserting muntiple values into customer table 

INSERT INTO customers
(first_name, last_name, email, phone, address, city, state, zipcode, country)
VALUES
('Subekshya', 'Thapa', 'subekshya@gmail.com', '9824168064', 'Boudha', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('Niruta', 'Karki', 'niruta@gmail.com', '9841016002', 'Lakeside', 'Pokhara', 'Gandaki', '33700', 'Nepal')

-- checking into customers table
SELECT * FROM customers;

--checking into  ChangeLog--
SELECT * FROM ChangeLog;

--CREATING TRIGGER FUNCTION FOR UPDATE

CREATE OR REPLACE FUNCTION log_customer_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('customers','UPDATE',NEW.customer_id,CURRENT_USER);

	RAISE NOTICE 'Update operation logged for customer table';

	RETURN NEW;

END;
$$;

-- creating trigger -- 

CREATE TRIGGER trg_update_customer
AFTER UPDATE 
ON customers
FOR EACH ROW 
EXECUTE FUNCTION log_customer_update()

-- updating recent added columns 
UPDATE customers SET first_name = 'Devi' WHERE customer_id = 22;

-- checking in customer table 
SELECT * FROM customers;

-- checking into ChangeLog
SELECT * FROM ChangeLog;



--CREATING TRIGGER FUNCTION FOR DELETE

CREATE OR REPLACE FUNCTION log_customer_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('customers','DELETE',OLD.customer_id,CURRENT_USER);

	RAISE NOTICE 'Delete operation logged for customer table';

	RETURN OLD;

END;
$$;

-- creating trigger -- 

CREATE TRIGGER trg_delete_customer
AFTER DELETE 
ON customers
FOR EACH ROW 
EXECUTE FUNCTION log_customer_delete()

-- updating recent added columns 
DELETE FROM  customers  WHERE customer_id = 25;

-- checking in customer table 
SELECT * FROM customers;

-- checking into ChangeLog
SELECT * FROM ChangeLog;

-- CREATING TRIGGER FUNCTION FOR orders table for INSERT--
CREATE OR REPLACE FUNCTION log_order_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('orders','INSERT',NEW.order_id,CURRENT_USER);

	RAISE NOTICE 'Insert operation logged for order table';

	RETURN NEW;
	
END;
$$;

-- CREATING TRIGGER
CREATE TRIGGER trg_insert_order
AFTER INSERT
ON orders
FOR EACH ROW
EXECUTE FUNCTION log_order_insert()

-- lets insert some record into it and check

INSERT INTO orders
(customer_id, total_amount)
VALUES
(22, 88000.00)

-- checking orders - 
SELECT * FROM orders;

-- checking into changelog
SELECT * FROM changeLog;

-- CREATING TRIGGER FUNCTION FOR orders table for update--
CREATE OR REPLACE FUNCTION log_order_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('orders','UPDATE',NEW.order_id,CURRENT_USER);

	RAISE NOTICE 'Update operation logged for order table';

	RETURN NEW;
	
END;
$$;

-- CREATING TRIGGER
CREATE TRIGGER trg_update_order
AFTER UPDATE
ON orders
FOR EACH ROW
EXECUTE FUNCTION log_order_update()

-- lets update some record into it and check

UPDATE orders SET total_amount = 50000.00 WHERE order_id =21;

-- checking orders - 
SELECT * FROM orders;

-- checking into changelog
SELECT * FROM changeLog;


-- CREATING TRIGGER FUNCTION FOR orders table for DELETE--
CREATE OR REPLACE FUNCTION log_order_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('orders','DELETE',OLD.order_id,CURRENT_USER);

	RAISE NOTICE 'DELETE operation logged for order table';

	RETURN OLD;
	
END;
$$;

-- CREATING TRIGGER
CREATE TRIGGER trg_delete_order
AFTER DELETE
ON orders
FOR EACH ROW
EXECUTE FUNCTION log_order_delete()

-- lets update some record into it and check

DELETE FROM orders WHERE order_id =21;

-- checking orders - 
SELECT * FROM orders;

-- checking into changelog
SELECT * FROM changeLog;


-- CREATING TRIGGER FUNCTION FOR categories table for INSERT--
CREATE OR REPLACE FUNCTION log_categories_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('categories','INSERT',NEW.category_id,CURRENT_USER);

	RAISE NOTICE 'Insert operation logged for categories table';

	RETURN NEW;
	
END;
$$;

-- CREATING TRIGGER
CREATE TRIGGER trg_insert_categories
AFTER INSERT
ON categories
FOR EACH ROW
EXECUTE FUNCTION log_categories_insert()

-- lets insert some record into it and check
INSERT INTO categories
(category_name, description)
VALUES
('Shoes', 'Men and Women shoes branded')

-- checking orders - 
SELECT * FROM categories;

-- checking into changelog
SELECT * FROM changeLog;


-- CREATING TRIGGER FUNCTION FOR categories table for update--
CREATE OR REPLACE FUNCTION log_categories_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('categories','UPDATE',NEW.category_id,'Aakash');

	RAISE NOTICE 'Update operation logged for categories table';

	RETURN NEW;
	
END;
$$;

-- CREATING TRIGGER
CREATE TRIGGER trg_update_categories
AFTER UPDATE
ON categories
FOR EACH ROW
EXECUTE FUNCTION log_categories_update()

-- lets update some record into it and check

UPDATE categories SET description = 'Men and Women shoes' WHERE category_id =22;

-- checking orders - 
SELECT * FROM categories;

-- checking into changelog
SELECT * FROM changeLog;


-- CREATING TRIGGER FUNCTION FOR categories table for DELETE--
CREATE OR REPLACE FUNCTION log_categories_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('categories','DELETE',OLD.category_id,'Akash karki');

	RAISE NOTICE 'DELETE operation logged for categories table';

	RETURN OLD;
	
END;
$$;

-- CREATING TRIGGER
CREATE TRIGGER trg_delete_categories
AFTER DELETE
ON categories
FOR EACH ROW
EXECUTE FUNCTION log_categories_delete()

-- lets update some record into it and check

DELETE FROM categories WHERE category_id =22;

-- checking orders - 
SELECT * FROM categories;

-- checking into changelog
SELECT * FROM changeLog;



select * from order_items;

--CREATING TRIGGER FUNCTION FOR INSERT	OPERATION FOR order_items table--
CREATE OR REPLACE FUNCTION log_order_items_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES('order_items','INSERT',NEW.order_item_id,'Akash Karki');

	RAISE NOTICE 'Insert operation logged for order_items table ';

	RETURN NEW;
END;
$$;

-- CREATING TRIGGER 
CREATE TRIGGER trg_insert_order_items
AFTER INSERT 
ON order_items
FOR EACH ROW 
EXECUTE FUNCTION log_order_items_insert()


-- lets insert record into order items
INSERT INTO order_items
(order_id, product_id, quantity, price)
VALUES
(22, 1, 1, 5000.00),
(22, 20, 2, 7500.00)

-- lets check into order_items _table 
SELECT * FROM order_items;

-- chccking into changeLog
SELECT * FROM ChangeLog;


-- CREATING TRIGGER FUNCTION FOR order_items table for update--
CREATE OR REPLACE FUNCTION log_order_items_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES ('order_items','UPDATE',NEW.order_item_id,'Aakash');

	RAISE NOTICE 'Update operation logged for order_items table';

	RETURN NEW;
	
END;
$$;

-- CREATING TRIGGER
CREATE TRIGGER trg_update_order_items
AFTER UPDATE
ON order_items
FOR EACH ROW
EXECUTE FUNCTION log_order_items_update()

-- lets update some record into it and check

UPDATE order_items SET quantity = 2 WHERE order_item_id =27;

-- checking orders - 
SELECT * FROM order_items;

-- checking into changelog
SELECT * FROM changeLog;

-- CREATING TRIGGER FUNCTION FOR DELETE FOR ORDER_ITEMS _TABLE

CREATE OR REPLACE FUNCTION log_order_items_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

	INSERT INTO ChangeLog(table_name,operation,record_id,changed_by)
	VALUES('order_items','DELETE',OLD.order_item_id,'Akash');

	RAISE NOTICE 'Delete operation logged for order_items table';
	RETURN OLD;
END;
$$;

-- CREATING TRIGGER FOR ORDER_ITEMS
CREATE TRIGGER trg_delete_order_items
AFTER DELETE
ON order_items
FOR EACH ROW
EXECUTE FUNCTION log_order_items_delete()


-- deleting record for order items
DELETE FROM	 order_items WHERE order_item_id IN(28,27)

-- checcking into order_items_table
SELECT * FROM order_items;

-- checking into ChangeLog
SELECT * FROM ChangeLog;

-- INDEXING __ 
-- Let's check existing index for customers table-- 
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'customers';

-- Cluster customers using the primary-key index -- 
CLUSTER customers USING customers_pkey;

-- CREATING A NORMAL INDEX -- 
CREATE INDEX  idx_customers_country
ON customers(country);

-- now lets check again existing columm--
SELECT indexname,indexdef
FROM pg_indexes
WHERE tablename='customers';

--  Faster way to check  --
EXPLAIN ANALYZE
SELECT *
FROM customers
WHERE country = 'Nepal';

-- Indexing for categories table-- 
SELECT indexname,indexdef
FROM pg_indexes
WHERE tablename='categories'

-- see here we have 4 columns of which one is pk and another is unique so remains description and created_at 
-- so here i am not creating normal index for it so directly checking 
EXPLAIN ANALYZE
SELECT *
FROM categories
WHERE category_name = 'Electronics';

-- see this -- 

-- INDEXING FOR products table 
SELECT indexname,indexdef
FROM pg_indexes
WHERE tablename='products'

-- lets test this first 
EXPLAIN ANALYZE
SELECT *
FROM products
WHERE category_id = 1;

-- now creating an  index category_id --
CREATE INDEX	idx_products_category_id
ON products(category_id)

-- lets check again
SELECT indexname,indexdef
FROM pg_indexes
WHERE tablename='products'

-- cluster the table
CLUSTER products USING products_pkey;

-- now rerenning this code
EXPLAIN ANALYZE
SELECT *
FROM products
WHERE category_id = 1;

/*
===============================
Implementing Views
===============================

	Views are virtual tables that represent the result of a query. 
	They can simplify complex queries and enhance security by restricting access to specific data.

*/

-- View for Product Details: A view combining product details with category names.
CREATE VIEW vw_product_details AS 
SELECT 
p.product_id,
p.product_name,
p.price,
p.stock,
c.category_name
FROM products p 
JOIN categories c 
	ON p.category_id = c.category_id
	

-- displaying  everything from current view
SELECT * FROM vw_product_details;

-- View for Customer Orders : A view to get a summary of orders placed by each customer.
CREATE VIEW vw_customer_orders AS
SELECT c.customer_id,
c.first_name,
c.last_name,
c.phone,
c.address,
COUNT(DISTINCT o.order_id) as total_orders,
SUM(oi.quantity*oi.price) as total_amount
FROM customers c 
JOIN orders o 
	ON c.customer_id = o.customer_id
JOIN order_items oi 
	on o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_amount DESC 

-- DISPLAYING 
SELECT * FROM vw_customer_orders;


-- View for Recent Orders: A view to display orders placed in the last 35 days.
CREATE VIEW vw_recent_orders AS
SELECT * FROM orders
WHERE order_date > CURRENT_DATE - INTERVAL '35 days';

-- DISPLAYING 
SELECT * FROM vw_recent_orders;

--Query 31: Retrieve All Products with Category Names
--Using the vw_ProductDetails view to get a list of all products along with their category names.
SELECT * FROM vw_product_details;

--Query 32: Retrieve Products within a Specific Price Range
--Using the vw_ProductDetails view to find products priced between 5000 and 50000.
SELECT * FROM vw_product_details 
WHERE price BETWEEN 5000 and 50000;


--Query 33: Count the Number of Products in Each Category
--Using the vw_ProductDetails view to count the number of products in each category.
SELECT category_name,
COUNT(*)  AS total_products
FROM vw_product_details
GROUP BY category_name
ORDER BY total_products DESC;

--Query 34: Retrieve Customers with More Than 1 Orders
--Using the vw_CustomerOrders view to find customers who have placed more than 1 orders.

SELECT
customer_id,
first_name
FROM vw_customer_orders
WHERE total_orders > 1;


--Query 35: Retrieve the Total Amount Spent by Each Customer
--Using the vw_CustomerOrders view to get the total amount spent by each customer.
SELECT 
first_name,last_name,total_amount
FROM  vw_customer_orders
ORDER BY total_amount DESC;

--Query 36: Retrieve Recent Orders Above a Certain Amount
--Using the vw_RecentOrders view to find recent orders where the total amount is greater than 10000.
SELECT * FROM vw_recent_orders
WHERE total_amount >10000
ORDER BY total_amount DESC;

--Query 37: Retrieve the Latest Order for Each Customer
--Using the vw_RecentOrders view to find the latest order placed by each customer.
with latest_order as
(

SELECT customer_id,
order_id,
order_date,
total_amount,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) as rank
FROM vw_recent_orders
)

SELECT customer_id,
order_id,
order_date,
total_amount FROM latest_order 
WHERE rank = 1
ORDER BY total_amount DESC

--Query 38: Retrieve Products in a Specific Category
--Using the vw_ProductDetails view to get all products in a specific category, such as 'Electronics'.
SELECT * FROM  vw_product_details 
WHERE category_name = 'Electronics'


--Query 39: Retrieve Total Sales for Each Category
--Using the vw_ProductDetails and order_items  to calculate the total sales for each category.
SELECT 
pd.category_name,
SUM(oi.quantity * oi.price) as total_amount
FROM order_items oi 
JOIN vw_product_details pd
	ON oi.product_id = pd.product_id
GROUP BY pd.category_name
ORDER BY total_amount DESC;


--Query 40: Retrieve Customer Orders with Product Details
--Using the vw_CustomerOrders and vw_ProductDetails views to get customer orders along with the details
SELECT 
    co.customer_id,
    co.first_name,
    co.last_name,
    o.order_id,
    o.order_date,
    pd.product_id,
    pd.product_name,
    oi.quantity,
    oi.price,
    pd.stock,
    pd.category_name,
    (oi.quantity * oi.price) AS product_total
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN vw_customer_orders co
    ON co.customer_id = o.customer_id
JOIN vw_product_details pd
    ON pd.product_id = oi.product_id
ORDER BY co.customer_id, o.order_date DESC;


--Query 41: Retrieve Top 5 Customers by Total Spending
--Using the vw_CustomerOrders view to find the top 5 customers based on their total spending.
SELECT 
customer_id,
first_name,
total_amount
FROM vw_customer_orders
ORDER BY total_amount DESC
LIMIT 5 

--Query 42: Retrieve Products with Low Stock
--Using the vw_ProductDetails view to find products with stock below a certain threshold, such as 10 units.
SELECT * FROM vw_product_details
WHERE stock < 10;

--Query 43: Retrieve Orders Placed in the Last 15 Days
--Using the vw_RecentOrders view to find orders placed in the last 15 days.

SELECT * FROM vw_recent_orders
WHERE order_date > CURRENT_DATE - INTERVAL '15 days'

--Query 44: Retrieve Products Sold in the Last Month
--Using the vw_RecentOrders view to find products sold in the last month.

SELECT 
    rc.order_id,
    p.product_id,
    p.product_name,
    oi.quantity,
    oi.price
FROM vw_recent_orders rc
JOIN order_items oi 
    ON oi.order_id = rc.order_id
JOIN products p 
    ON p.product_id = oi.product_id
WHERE rc.order_date > CURRENT_DATE - INTERVAL '30 days';


/*
=========================================================
Implementing Security / Role-Based Access Control (RBAC)
=========================================================

			
*/
-- STEP 1: Create Login/User
CREATE ROLE sales_user
LOGIN
PASSWORD 'strongpassword';

-- STEP 2: Allow user to connect to database
GRANT CONNECT ON DATABASE "OnlineRetailDB_Test"
TO sales_user

-- step 3: create permission role
CREATE ROLE sale_role;

-- STEP 4: ALLOW role to_use PUBLIC schema 
GRANT USAGE ON SCHEMA PUBLIC
TO sale_role;

-- STEP 5 : GIVE SELECT PERMISSION ON CUSTOMERS 
GRANT SELECT
ON TABLE customers
TO sale_role;

-- STEP 6 : ADD sale_user to sale_role
GRANT sale_role
TO sales_user

--- further steps adding some permission on others table
-- GIVING INSERT AND UPDATE operation on orders table
GRANT INSERT 
ON TABLE orders
TO sale_role;

GRANT UPDATE 
ON TABLE orders
TO sale_role;

-- GIVING SELECT OPERATION ON products table

GRANT SELECT 
ON TABLE products
TO sale_role

-- GIVING INSERT OPERATION ON ChangeLog --
GRANT INSERT
ON TABLE ChangeLog
TO sale_role;

-- REVOKING UPDATE FROM ORDERS TABLE
REVOKE UPDATE 
ON TABLE orders
FROM sale_role;


-- Check all the permissions I've been practicing
SELECT
    has_table_privilege(current_user, 'public.customers', 'SELECT') AS customers_select,
    has_table_privilege(current_user, 'public.orders', 'INSERT') AS orders_insert,
    has_table_privilege(current_user, 'public.orders', 'UPDATE') AS orders_update,
    has_table_privilege(current_user, 'public.products', 'SELECT') AS products_select,
    has_table_privilege(current_user, 'public.changelog', 'INSERT') AS changelog_insert;


/*
1. Create Login Roles: Create roles with LOGIN and passwords to authenticate users.
2. Grant Database Access: Allow login roles to connect to the required database.
3. Create Permission Roles: Create roles to group users with similar permissions.
4. Assign Users to Roles: Grant permission roles to login roles.
5. Grant Permissions: Grant SELECT, INSERT, UPDATE, etc. to permission roles.
6. Revoke Permissions: Remove specific permissions using REVOKE.
7. View Effective Permissions: Check users' effective table permissions using PostgreSQL privilege functions or information_schema.
*/

-- CHECKING DIFFERENT SCENARIO  OF ACCESS CONTROL --
-- Scenario 1 — Read-only access to all tables

CREATE ROLE readonly_role;
GRANT USAGE ON SCHEMA public
TO readonly_role;

GRANT SELECT 
ON ALL TABLES IN SCHEMA public
TO readonly_role

-- SCENARIO 2 - Data Entry Clerk
-- Insert only into categories and order_items
CREATE ROLE data_entry_role;

GRANT USAGE ON SCHEMA public
TO data_entry_role;

GRANT INSERT 
ON TABLE categories
TO data_entry_role;

GRANT INSERT 
ON TABLE order_items
TO data_entry_role;

-- Scenario 3 — Product Manager
-- Full CRUD access to products and categories:
--since we have to give same access on both table so instead of writing separate writing in same one.
CREATE ROLE product_manager_role;

GRANT USAGE ON SCHEMA public 
TO  product_manager_role;

GRANT SELECT,INSERT,UPDATE,DELETE
ON TABLE categories,products
TO product_manager_role;

-- Scenario 4 — Order Processor
-- Read and update orders:

CREATE ROLE order_processor_role;

GRANT USAGE ON SCHEMA public 
TO order_processor_role;

GRANT SELECT,UPDATE
ON TABLE orders
TO order_processor_role;

-- Scenario 5 — Customer Support
-- Read customers and orders:

CREATE ROLE customer_support_role;

GRANT USAGE ON SCHEMA PUBLIC 
TO customer_support_role;

GRANT SELECT 
ON TABLE orders,customers
TO customer_support_role;


-- Scenario 6 — Marketing Analyst
-- Read-only access to all tables:

CREATE ROLE marketing_analyst_role;

GRANT USAGE ON SCHEMA PUBLIC
TO marketing_analyst_role;

GRANT SELECT
ON ALL TABLES IN SCHEMA PUBLIC
TO marketing_analyst_role;

--  Scenario 7 — Sales Analyst
-- Read access to orders and order_items:

CREATE ROLE sales_analyst_role;

GRANT USAGE ON SCHEMA PUBLIC 
TO sales_analyst_role;

GRANT SELECT
ON TABLE orders,order_items
TO sales_analyst_role;

-- Scenario 8 — Inventory Manager
-- Full access to products

CREATE ROLE inventory_manager_role;

GRANT USAGE ON SCHEMA PUBLIC 
TO  inventory_manager_role;

GRANT SELECT,INSERT,UPDATE,DELETE
ON TABLE products
TO inventory_manager_role;

-- Scenario 9 — Finance Manager
-- Read and update orders

CREATE ROLE finance_manager_role;

GRANT USAGE ON SCHEMA PUBLIC 
TO finance_manager_role;

GRANT SELECT,UPDATE
ON TABLE orders
TO finance_manager_role;

-- Scenario 10 — Backup Operator
CREATE ROLE backup_operator_role;

GRANT CONNECT
ON DATABASE "OnlineRetailDB_Test"
TO backup_operator_role;

-- Scenario 11 — Restricted Read Access
-- Only allow FirstName, LastName, and Email:

CREATE ROLE restricted_read_role;

GRANT USAGE ON SCHEMA PUBLIC 
TO restricted_read_role;

GRANT SELECT(first_name,last_name,email)
ON TABLE customers
TO restricted_read_role;


 -- Scenario 14 — Temporary Access

 CREATE ROLE temporary_access_role;

 GRANT USAGE  ON SCHEMA public 
 TO temporary_access_role ;

 GRANT SELECT 
 ON ALL TABLES  IN SCHEMA PUBLIC
 TO temporary_access_role;
-- then we can revoke like 

REVOKE SELECT 
ON ALL TABLES IN  SCHEMA PUBLIC
FROM temporary_access_role;

-- Scenario 15 — Application Role

CREATE ROLE application_role
LOGIN 
PASSWORD 'strong';


GRANT CONNECT
ON DATABASE "OnlineRetailDB_Test"
TO application_role;

GRANT USAGE ON SCHEMA PUBLIC 
TO application_role;

-- THEN GIVING SOME ROLE TO IT 
GRANT product_manager_role 
TO application_role;
