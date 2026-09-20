CREATE DATABASE IF NOT EXISTS shop_sync;
USE shop_sync;

-- Shopkeepers
CREATE TABLE IF NOT EXISTS shopkeeper (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    shop_name VARCHAR(150) NOT NULL,
    contact_phone VARCHAR(20),
    email VARCHAR(100)
);

-- Retailers
CREATE TABLE IF NOT EXISTS retailer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- Products
CREATE TABLE IF NOT EXISTS product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL,
    unit VARCHAR(50),
    default_price DECIMAL(10,2)
);

-- Purchase Requests
CREATE TABLE IF NOT EXISTS purchase_request (
    id INT AUTO_INCREMENT PRIMARY KEY,
    shopkeeper_id INT NOT NULL,
    retailer_id INT NOT NULL,
    status VARCHAR(30) DEFAULT 'pending',
    FOREIGN KEY (shopkeeper_id) REFERENCES shopkeeper(id),
    FOREIGN KEY (retailer_id) REFERENCES retailer(id)
);

-- Purchase Request Items
CREATE TABLE IF NOT EXISTS purchase_request_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    note_price DECIMAL(10,2),
    FOREIGN KEY (request_id) REFERENCES purchase_request(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Sample Shopkeepers
INSERT INTO shopkeeper (name, shop_name, contact_phone, email) VALUES
('Suresh Kumar', 'Fresh Mart', '9876543210', 'suresh@example.com'),
('Ramesh Shetty', 'Daily Needs', '9876543211', 'ramesh@example.com'),
('Anil Kumar', 'City Grocery', '9876543212', 'anil@example.com'),
('Manoj Rao', 'Super Store', '9876543213', 'manoj@example.com'),
('Kiran Bhat', 'Green Basket', '9876543214', 'kiran@example.com');

-- Sample Retailers
INSERT INTO retailer (name, contact_person, phone, address) VALUES
('ABC Wholesale', 'Rajesh', '9000000001', 'Mangalore'),
('Fresh Distributors', 'Mahesh', '9000000002', 'Udupi'),
('Coastal Suppliers', 'Ravi', '9000000003', 'Surathkal'),
('Metro Wholesale', 'Arun', '9000000004', 'Bangalore'),
('Daily Supply Co.', 'Vijay', '9000000005', 'Mangalore');

-- Sample Products
INSERT INTO product (sku, name, unit, default_price) VALUES
('SKU001', 'Rice', 'kg', 60.00),
('SKU002', 'Sugar', 'kg', 45.00),
('SKU003', 'Wheat Flour', 'kg', 50.00),
('SKU004', 'Cooking Oil', 'litre', 130.00),
('SKU005', 'Milk', 'litre', 55.00);

-- Sample Purchase Requests
INSERT INTO purchase_request (shopkeeper_id, retailer_id, status) VALUES
(1, 1, 'pending'),
(2, 2, 'approved'),
(3, 3, 'pending'),
(4, 4, 'completed');

-- Sample Purchase Request Items
INSERT INTO purchase_request_item (request_id, product_id, quantity, note_price) VALUES
(1, 1, 10, 600.00),
(1, 2, 5, 225.00),
(2, 3, 8, 400.00),
(3, 4, 6, 780.00),
(4, 5, 10, 550.00);