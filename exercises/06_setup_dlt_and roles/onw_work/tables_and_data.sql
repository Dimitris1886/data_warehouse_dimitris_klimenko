USE ROLE AUTO_WRITER;

USE WAREHOUSE dw;

USE SCHEMA AUTO_DB.PUBLIC;
USE ROLE ACCOUNTADMIN;
SELECT CURRENT_ROLE();
DROP TABLE TRANSACTIONS;





CREATE TABLE models (
    model_id INT AUTOINCREMENT,
    model_name STRING,
    price DECIMAL(8, 2),
    PRIMARY KEY (model_id)
);

-- Create a table for customers
CREATE TABLE customers (
    customer_id INT AUTOINCREMENT,
    customer_name STRING,
    email STRING,
    PRIMARY KEY (customer_id)
);


-- Create a table for transactions
CREATE TABLE transactions (
    transaction_id INT AUTOINCREMENT,
    customer_id INT,
    model_id INT,
    quantity INT,
    transaction_date TIMESTAMP,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (model_id) REFERENCES models (model_id)
);

USE ROLE AUTO_WRITER;
SELECT CURRENT_ROLE();


-- insert data to database

INSERT INTO models (model_name, price)
VALUES 
    ('Toyota Camry', 24425.00),
    ('Honda Accord', 26720.00),
    ('Ford Mustang', 55300.00),
    ('Chevrolet Corvette', 60100.00),
    ('BMW 3 Series', 41250.00);

INSERT INTO customers (customer_name, email)
VALUES 
    ('Michael Johnson', 'michael.johnson@example.com'),
    ('Samantha Green', 'samantha.green@example.com'),
    ('Robert Williams', 'robert.williams@example.com'),
    ('Emily Davis', 'emily.davis@example.com'),
    ('Daniel Brown', 'daniel.brown@example.com');

 
INSERT INTO transactions (customer_id, model_id, quantity, transaction_date)
VALUES 
    (1, 3, 1, '2024-08-25 14:35:00'),  -- Michael Johnson buys 1 Ford Mustang
    (2, 1, 1, '2024-08-20 09:00:00'),  -- Samantha Green buys 1 Toyota Camry
    (3, 4, 2, '2024-08-22 11:30:00'),  -- Robert Williams buys 2 Chevrolet Corvettes
    (4, 5, 1, '2024-08-23 13:45:00'),  -- Emily Davis buys 1 BMW 3 Series
    (5, 2, 1, '2024-08-27 16:20:00');  -- Daniel Brown buys 1 Honda Accord


-- QUERIES

SELECT * FROM models;
SELECT * FROM customers;

use role auto_reader;
select * from transactions;