
CREATE DATABASE IF NOT EXISTS demo;
USE demo;

-- Create Table for Item Entity
CREATE TABLE IF NOT EXISTS item (
    item_code VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(150) NOT NULL,
    unit_price DOUBLE NOT NULL,
    updated_date DATE NOT NULL
);

-- Insert Sample Records for Testing
INSERT INTO item (item_code, item_name, unit_price, updated_date) VALUES
('ITM001', 'Wireless Mouse', 2500.00, '2026-07-20'),
('ITM002', 'Mechanical Keyboard', 12500.00, '2026-07-21'),
('ITM003', 'HD LED Monitor 24 inch', 38000.00, '2026-07-22'),
('ITM004', 'USB-C Docking Station', 18500.00, '2026-07-23'),
('ITM005', 'External Hard Drive 1TB', 16000.00, '2026-07-24');