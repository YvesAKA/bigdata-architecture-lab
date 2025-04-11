-- Insérer des données dans la table category
INSERT INTO category (id, intitule, created_at)
VALUES
    (1, 'Fiction', NOW()),
    (2, 'Non-Fiction', NOW()),
    (3, 'Science', NOW()),
    (4, 'History', NOW()),
    (5, 'Fantasy', NOW()),
    (6, 'Biography', NOW()),
    (7, 'Mystery', NOW()),
    (8, 'Romance', NOW()),
    (9, 'Horror', NOW()),
    (10, 'Adventure', NOW());

-- Insérer des données dans la table books
INSERT INTO books (id, category_id, code, intitule, isbn_10, isbn_13, created_at)
VALUES
    (1, 1, 'B001', 'The Great Adventure', '1234567890', '1234567890123', NOW()),
    (2, 2, 'B002', 'Learning SQL', '0987654321', '0987654321098', NOW()),
    (3, 3, 'B003', 'Physics for Beginners', '1122334455', '1122334455667', NOW()),
    (4, 4, 'B004', 'World History', '2233445566', '2233445566778', NOW()),
    (5, 5, 'B005', 'Magical Realms', '3344556677', '3344556677889', NOW()),
    (6, 6, 'B006', 'Life of a Genius', '4455667788', '4455667788990', NOW()),
    (7, 7, 'B007', 'The Mystery Case', '5566778899', '5566778899001', NOW()),
    (8, 8, 'B008', 'Love in Paris', '6677889900', '6677889900112', NOW()),
    (9, 9, 'B009', 'Haunted House', '7788990011', '7788990011223', NOW()),
    (10, 10, 'B010', 'Jungle Quest', '8899001122', '8899001122334', NOW()),
    (21, 1, 'B021', 'Adventure in the Wild', '1111111111', '1111111111111', NOW()),
    (22, 2, 'B022', 'Mastering Databases', '2222222222', '2222222222222', NOW()),
    (23, 3, 'B023', 'The Wonders of Science', '3333333333', '3333333333333', NOW()),
    (24, 4, 'B024', 'Historical Legends', '4444444444', '4444444444444', NOW()),
    (25, 5, 'B025', 'Fantasy World', '5555555555', '5555555555555', NOW()),
    (26, 1, 'B026', 'The Lost Treasure', '6666666666', '6666666666666', NOW()),
    (27, 2, 'B027', 'SQL for Experts', '7777777777', '7777777777777', NOW()),
    (28, 3, 'B028', 'Physics in Action', '8888888888', '8888888888888', NOW()),
    (29, 4, 'B029', 'Ancient Civilizations', '9999999999', '9999999999999', NOW()),
    (30, 5, 'B030', 'Magical Creatures', '0000000000', '0000000000000', NOW());

-- Insérer des données dans la table customers
INSERT INTO customers (id, code, first_name, last_name, created_at)
VALUES
    (1, 'C001', 'Alice', 'Smith', NOW()),
    (2, 'C002', 'Bob', 'Johnson', NOW()),
    (3, 'C003', 'Charlie', 'Brown', NOW()),
    (4, 'C004', 'Diana', 'Prince', NOW()),
    (5, 'C005', 'Eve', 'Taylor', NOW()),
    (6, 'C006', 'Frank', 'Miller', NOW()),
    (7, 'C007', 'Grace', 'Hopper', NOW()),
    (8, 'C008', 'Hank', 'Williams', NOW()),
    (9, 'C009', 'Ivy', 'Clark', NOW()),
    (10, 'C010', 'Jack', 'White', NOW()),
    (21, 'C021', 'Ethan', 'Moore', NOW()),
    (22, 'C022', 'Ava', 'Taylor', NOW()),
    (23, 'C023', 'Lucas', 'Anderson', NOW()),
    (24, 'C024', 'Charlotte', 'Thomas', NOW()),
    (25, 'C025', 'Mason', 'Jackson', NOW()),
    (26, 'C026', 'Amelia', 'White', NOW()),
    (27, 'C027', 'Logan', 'Harris', NOW()),
    (28, 'C028', 'Harper', 'Martin', NOW()),
    (29, 'C029', 'Elijah', 'Garcia', NOW()),
    (30, 'C030', 'Lily', 'Martinez', NOW());

-- Insérer des données dans la table factures
INSERT INTO factures (id, code, date_edit, customers_id, qte_totale, total_amount, total_paid, created_at)
VALUES
    (1, 'F001', '2025-04-01', 1, 3, 150.00, 150.00, NOW()),
    (2, 'F002', '2025-04-02', 2, 2, 100.00, 100.00, NOW()),
    (3, 'F003', '2025-04-03', 3, 1, 50.00, 50.00, NOW()),
    (4, 'F004', '2025-04-04', 4, 5, 250.00, 250.00, NOW()),
    (5, 'F005', '2025-04-05', 5, 4, 200.00, 200.00, NOW()),
    (6, 'F006', '2025-04-06', 6, 3, 180.00, 180.00, NOW()),
    (7, 'F007', '2025-04-07', 7, 2, 120.00, 120.00, NOW()),
    (8, 'F008', '2025-04-08', 8, 6, 300.00, 300.00, NOW()),
    (9, 'F009', '2025-04-09', 9, 1, 60.00, 60.00, NOW()),
    (10, 'F010', '2025-04-10', 10, 7, 350.00, 350.00, NOW()),
    (21, 'F021', '2025-04-21', 21, 3, 150.00, 150.00, NOW()),
    (22, 'F022', '2025-04-22', 22, 2, 100.00, 100.00, NOW()),
    (23, 'F023', '2025-04-23', 23, 1, 50.00, 50.00, NOW()),
    (24, 'F024', '2025-04-24', 24, 4, 200.00, 200.00, NOW()),
    (25, 'F025', '2025-04-25', 25, 5, 250.00, 250.00, NOW()),
    (26, 'F026', '2025-04-26', 26, 6, 300.00, 300.00, NOW()),
    (27, 'F027', '2025-04-27', 27, 7, 350.00, 350.00, NOW()),
    (28, 'F028', '2025-04-28', 28, 8, 400.00, 400.00, NOW()),
    (29, 'F029', '2025-04-29', 29, 9, 450.00, 450.00, NOW()),
    (30, 'F030', '2025-04-30', 30, 10, 500.00, 500.00, NOW());

-- Insérer des données dans la table ventes
INSERT INTO ventes (id, code, date_edit, factures_id, books_id, pu, qte, created_at)
VALUES
    (1, 'V001', '2025-04-01', 1, 1, 50.00, 1, NOW()),
    (2, 'V002', '2025-04-01', 1, 2, 50.00, 1, NOW()),
    (3, 'V003', '2025-04-01', 1, 3, 50.00, 1, NOW()),
    (4, 'V004', '2025-04-02', 2, 4, 50.00, 2, NOW()),
    (5, 'V005', '2025-04-03', 3, 5, 50.00, 1, NOW()),
    (6, 'V006', '2025-04-04', 4, 6, 50.00, 2, NOW()),
    (7, 'V007', '2025-04-05', 5, 7, 50.00, 3, NOW()),
    (8, 'V008', '2025-04-06', 6, 8, 60.00, 1, NOW()),
    (9, 'V009', '2025-04-07', 7, 9, 70.00, 2, NOW()),
    (10, 'V010', '2025-04-08', 8, 10, 80.00, 1, NOW()),
    (21, 'V021', '2025-04-21', 21, 21, 50.00, 1, NOW()),
    (22, 'V022', '2025-04-22', 22, 22, 50.00, 1, NOW()),
    (23, 'V023', '2025-04-23', 23, 23, 50.00, 1, NOW()),
    (24, 'V024', '2025-04-24', 24, 24, 50.00, 2, NOW()),
    (25, 'V025', '2025-04-25', 25, 25, 50.00, 3, NOW()),
    (26, 'V026', '2025-04-26', 26, 26, 50.00, 1, NOW()),
    (27, 'V027', '2025-04-27', 27, 27, 50.00, 2, NOW()),
    (28, 'V028', '2025-04-28', 28, 28, 50.00, 3, NOW()),
    (29, 'V029', '2025-04-29', 29, 29, 50.00, 1, NOW()),
    (30, 'V030', '2025-04-30', 30, 30, 50.00, 2, NOW());