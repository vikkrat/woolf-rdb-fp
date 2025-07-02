-- 📘 Завдання 3. Проаналізуйте дані по Number_rabies
-- Для кожної комбінації Entity + Code обчисліть середнє, мінімальне, максимальне та суму

USE pandemic;

SELECT 
    e.entity,
    e.code,
    AVG(CAST(c.number_rabies AS UNSIGNED)) AS avg_rabies,
    MIN(CAST(c.number_rabies AS UNSIGNED)) AS min_rabies,
    MAX(CAST(c.number_rabies AS UNSIGNED)) AS max_rabies,
    SUM(CAST(c.number_rabies AS UNSIGNED)) AS sum_rabies
FROM cases c
JOIN entities e ON c.entity_id = e.id
WHERE c.number_rabies <> ''
GROUP BY e.entity, e.code
ORDER BY avg_rabies DESC
LIMIT 10;