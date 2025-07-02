-- 📘 Завдання 1. Завантажте дані
-- Створіть схему pandemic, оберіть її за замовчуванням, імпортуйте файл infectious_cases.csv
-- Після імпорту переконайтеся, що завантажено всі 7271 запис

-- Створення схеми та використання
CREATE SCHEMA IF NOT EXISTS pandemic;
USE pandemic;

-- Після імпорту вручну через Import Wizard:
-- Перевірка кількості записів
SELECT COUNT(*) AS total_rows FROM infectious_cases;