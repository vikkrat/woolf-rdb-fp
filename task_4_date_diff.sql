-- 📘 Завдання 4. Побудуйте колонку різниці в роках
-- Для кожного року створіть дату 1 січня, поточну дату та різницю в роках

USE pandemic;

SELECT 
    year,
    STR_TO_DATE(CONCAT(year, '-01-01'), '%Y-%m-%d') AS year_date,
    CURDATE() AS today,
    TIMESTAMPDIFF(YEAR, STR_TO_DATE(CONCAT(year, '-01-01'), '%Y-%m-%d'), CURDATE()) AS year_diff
FROM cases
LIMIT 10;