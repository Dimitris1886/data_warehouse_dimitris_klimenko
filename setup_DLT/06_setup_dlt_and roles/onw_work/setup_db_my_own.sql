USE ROLE accountadmin;

CREATE DATABASE auto_db;

CREATE WAREHOUSE dw
WITH
WAREHOUSE_SIZE = "XSMALL"
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = "Warehouse for development and analysis of databases";

USE WAREHOUSE dw;

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

