CREATE DATABASE online_retail_db;

USE online_retail_db;


1.Create the transactions table
USE online_retail_db;

CREATE TABLE IF NOT EXISTS retail_transactions (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(30),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(12, 2),
    CustomerID BIGINT NULL,
    Country VARCHAR(100),
    Revenue DECIMAL(14, 2),
    Year INT,
    Month INT,
    MonthName VARCHAR(20),
    YearMonth VARCHAR(7),
    Day INT,
    DayOfWeek VARCHAR(20),
    Hour INT
);


SHOW TABLES;

DESCRIBE retail_transactions;
