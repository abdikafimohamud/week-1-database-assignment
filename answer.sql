-- =====================================================
-- Week 1 Assignment: Hotel Management Database
-- =====================================================

-- Step 1: Create the database
CREATE DATABASE hotel_management;

-- Step 2: Select the database to use
USE hotel_management;

-- =====================================================
-- Table: guests
-- Stores information about hotel guests
-- =====================================================
CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- =====================================================
-- Table: rooms
-- Stores information about hotel rooms
-- =====================================================
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    is_available TINYINT(1) DEFAULT 1
);

-- =====================================================
-- Table: bookings
-- Links guests to rooms with stay details
-- =====================================================
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- =====================================================
-- Sample Data
-- =====================================================

-- Insert sample guests
INSERT INTO guests (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@email.com', '0712345678'),
('Jane', 'Smith', 'jane.smith@email.com', '0723456789'),
('Ali', 'Mwangi', 'ali.mwangi@email.com', '0734567890');

-- Insert sample rooms
INSERT INTO rooms (room_number, room_type, price_per_night, is_available) VALUES
('101', 'Single', 50.00, 1),
('102', 'Double', 80.00, 1),
('201', 'Suite', 150.00, 0);

-- Insert sample bookings
INSERT INTO bookings (guest_id, room_id, check_in_date, check_out_date, total_price) VALUES
(1, 1, '2026-09-10', '2026-09-12', 100.00),
(2, 3, '2026-09-15', '2026-09-18', 450.00),
(3, 2, '2026-09-20', '2026-09-21', 80.00);

-- =====================================================
-- Sample Queries (for testing)
-- =====================================================

-- View all guests
SELECT * FROM guests;

-- View all rooms
SELECT * FROM rooms;

-- View all bookings with guest and room details
SELECT
    b.booking_id,
    g.first_name,
    g.last_name,
    r.room_number,
    r.room_type,
    b.check_in_date,
    b.check_out_date,
    b.total_price
FROM bookings b
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id;-- verified present
