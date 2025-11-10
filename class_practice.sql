CREATE DATABASE customer_db;
USE customer_db;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    phone BIGINT,
    age INT CHECK (age >= 18)  
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    quantity INT NOT NULL CHECK (quantity > 0), 
    price INT NOT NULL CHECK (price > 0),   
    total INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (name, city, phone, age)
VALUES
('Komal', 'Bhopal', 9876543210, 22),
('Riya', 'Indore', 9123456789, 21),
('Aman', 'Rewa', 9988776655, 25);

INSERT INTO orders (customer_id, quantity, price, total)
VALUES
(1, 2, 500, 1000),
(1, 1, 800, 800),
(2, 3, 400, 1200),
(3, 5, 250, 1250);

SELECT customers.name, customers.city, orders.quantity, orders.price, orders.total
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;
