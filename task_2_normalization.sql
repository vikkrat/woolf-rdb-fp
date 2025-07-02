-- 📘 Завдання 2. Нормалізуйте таблицю infectious_cases до 3NF
-- Створіть таблиці entities та cases. Уникніть дублювання Entity і Code.

USE pandemic;

-- Створення таблиці entities
CREATE TABLE IF NOT EXISTS entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity VARCHAR(255),
    code VARCHAR(50),
    UNIQUE(entity, code)
);

-- Створення таблиці cases
CREATE TABLE IF NOT EXISTS cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT,
    year INT,
    number_yaws TEXT,
    polio_cases INT,
    cases_guinea_worm INT,
    number_rabies TEXT,
    number_malaria TEXT,
    number_hiv TEXT,
    number_tuberculosis TEXT,
    number_smallpox TEXT,
    number_cholera_cases TEXT,
    FOREIGN KEY (entity_id) REFERENCES entities(id)
);

-- Наповнення entities
INSERT INTO entities (entity, code)
SELECT DISTINCT Entity, Code FROM infectious_cases;

-- Наповнення cases
INSERT INTO cases (entity_id, year, number_yaws, polio_cases, cases_guinea_worm, number_rabies,
                   number_malaria, number_hiv, number_tuberculosis, number_smallpox, number_cholera_cases)
SELECT e.id, i.Year, i.Number_yaws, i.polio_cases, i.cases_guinea_worm, i.Number_rabies,
       i.Number_malaria, i.Number_HIV, i.Number_tuberculosis, i.Number_smallpox, i.Number_cholera_cases
FROM infectious_cases i
JOIN entities e ON i.Entity = e.entity AND i.Code = e.code;

-- 🔎 Перші 10 записів
SELECT * FROM cases LIMIT 10;
SELECT * FROM entities LIMIT 10;