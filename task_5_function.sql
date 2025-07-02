-- 📘 Завдання 5. Побудуйте власну SQL-функцію
-- Функція приймає рік і повертає різницю між 1 січня цього року та поточною датою

USE pandemic;

DELIMITER $$

CREATE FUNCTION year_diff_func(year_input INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE result INT;
    SET result = TIMESTAMPDIFF(YEAR, STR_TO_DATE(CONCAT(year_input, '-01-01'), '%Y-%m-%d'), CURDATE());
    RETURN result;
END $$

DELIMITER ;

-- 🔎 Використання функції на прикладі
SELECT year, year_diff_func(year) AS year_difference FROM cases LIMIT 10;