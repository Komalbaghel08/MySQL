-- 🏁 STEP 1: Create and use database
CREATE DATABASE groupby;
USE groupby;

-- 🏗️ STEP 2: Create tables

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 🧩 STEP 3: Insert data

INSERT INTO customers (customer_id, customer_name, country, city) VALUES
(1, 'Aryan Sharma', 'India', 'Mumbai'),
(2, 'Priya Patel', 'India', 'Delhi'),
(3, 'John Smith', 'USA', 'New York'),
(4, 'Emily Davis', 'USA', 'Chicago'),
(5, 'Carlos Lopez', 'Mexico', 'Monterrey'),
(6, 'Sophia Lee', 'UK', 'London'),
(7, 'Liam Brown', 'UK', 'Manchester'),
(8, 'Mia Chen', 'China', 'Beijing'),
(9, 'David Kim', 'South Korea', 'Seoul'),
(10, 'Olivia Wilson', 'Australia', 'Sydney');

INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 70000.00),
(102, 'Smartphone', 'Electronics', 40000.00),
(103, 'Tablet', 'Electronics', 25000.00),
(104, 'Headphones', 'Accessories', 3000.00),
(105, 'Office Chair', 'Furniture', 8000.00),
(106, 'Desk Lamp', 'Furniture', 2500.00),
(107, 'T-Shirt', 'Clothing', 1200.00),
(108, 'Shoes', 'Clothing', 3500.00);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1001, 1, '2025-01-05', 140000.00),
(1002, 2, '2025-01-15', 41000.00),
(1003, 3, '2025-02-10', 78000.00),
(1004, 4, '2025-02-18', 58000.00),
(1005, 5, '2025-03-02', 30000.00),
(1006, 6, '2025-03-12', 55000.00),
(1007, 7, '2025-04-01', 24000.00),
(1008, 8, '2025-04-18', 15000.00),
(1009, 9, '2025-05-10', 22000.00),
(1010, 10, '2025-05-20', 64000.00);

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 101, 2, 70000.00),
(2, 1002, 104, 2, 3000.00),
(3, 1002, 107, 5, 1200.00),
(4, 1003, 102, 1, 40000.00),
(5, 1003, 103, 1, 25000.00),
(6, 1003, 104, 4, 3000.00),
(7, 1004, 105, 5, 8000.00),
(8, 1004, 106, 2, 2500.00),
(9, 1005, 108, 3, 3500.00),
(10, 1005, 107, 10, 1200.00),
(11, 1006, 103, 2, 25000.00),
(12, 1006, 104, 1, 3000.00),
(13, 1006, 106, 2, 2500.00),
(14, 1007, 107, 8, 1200.00),
(15, 1007, 108, 2, 3500.00),
(16, 1008, 104, 5, 3000.00),
(17, 1008, 106, 2, 2500.00),
(18, 1009, 108, 4, 3500.00),
(19, 1010, 101, 1, 70000.00),
(20, 1010, 104, 2, 3000.00);

-- 🔍 STEP 4: View tables
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_details;

-- 📊 STEP 5: Analytical queries (using GROUP BY)

-- 1️Count total orders per customer
SELECT c.customer_name, COUNT(o.customer_id) AS total_orders
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 2️ Total amount spent by each customer (Top 5)
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 3️ Number of orders from each country
SELECT c.country, COUNT(o.customer_id) AS order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country;

-- Q1
SELECT 
    customer_id AS Customer,
    COUNT(order_id) AS Total_Orders
FROM 
    orders
GROUP BY 
    customer_id;

-- Q2
--  Total purchase amount per customer
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS total_purchase_amount
FROM 
    customers c
JOIN 
    orders o 
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, 
    c.customer_name
ORDER BY 
    total_purchase_amount DESC;
    
    -- Q 3 Show total sales grouped by country.
    select c.country,sum(o.total_amount) as total_sale
    from customers c inner join orders o 
    on c.customers_id = o.customers_id group by country order by total_sale desc limit 5;
    
    -- Q4 . Find the average order value (AOV) per customer.
SELECT 
    c.customer_id,
    c.customer_name,
AVG(o.total_amount) AS average_order_value
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY average_order_value DESC;

-- Q5  Show each product and total units sold.
SELECT p.product_id,p.product_name,SUM(od.quantity) AS total_units_sold
FROM products p
JOIN order_details od
ON p.product_id = od.product_id
GROUP BY od.product_id
ORDER BY total_units_sold DESC;

-- Q 6- Find total revenue generated per product category.
SELECT p.category,SUM(od.quantity * od.unit_price) AS total_revenue
FROM products p JOIN order_details od ON p.product_id = od.product_id
GROUP BY category;   

-- 8. Group by month from order_date and show total order count.
-- select date_format(order_date,"%n) as order_month  OR 
select monthname(order_date) as order_month,
count(customer_id) as total_count
from orders group by order_month;