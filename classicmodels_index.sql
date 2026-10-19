-- =========================================================
-- CƠ SỞ DỮ LIỆU CLASSICMODELS - THỰC HÀNH TẠO CHỈ MỤC (INDEX)
-- File: classicmodels_index.sql
-- =========================================================

-- Bước 1: Chọn CSDL classicmodels
USE classicmodels;

-- ---------------------------------------------------------
-- 1. Kiểm tra tốc độ truy vấn TRƯỚC KHI tạo Index
-- ---------------------------------------------------------
-- Sử dụng EXPLAIN để xem kế hoạch thực thi (Query Execution Plan)
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

-- ---------------------------------------------------------
-- 2. Tạo Index cho cột customerName (Single-column Index)
-- ---------------------------------------------------------
ALTER TABLE customers ADD INDEX idx_customerName(customerName);

-- ---------------------------------------------------------
-- 3. Kiểm tra lại tốc độ truy vấn SAU KHI tạo Index
-- ---------------------------------------------------------
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';

-- ---------------------------------------------------------
-- 4. Tạo Index phức hợp (Composite Index) cho cặp cột contactFirstName & contactLastName
-- ---------------------------------------------------------
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);

-- ---------------------------------------------------------
-- 5. Kiểm tra kế hoạch thực thi với Index phức hợp
-- ---------------------------------------------------------
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' OR contactFirstName = 'King';

-- ---------------------------------------------------------
-- 6. Xóa Index phức hợp vừa tạo
-- ---------------------------------------------------------
ALTER TABLE customers DROP INDEX idx_full_name;
