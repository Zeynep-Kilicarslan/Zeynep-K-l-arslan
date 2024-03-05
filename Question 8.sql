
UPDATE your_table_name AS t
SET daily_vaccinations = IFNULL(
    (SELECT MEDIAN(daily_vaccinations)
     FROM your_table_name
     WHERE country = t.country
     GROUP BY country),
    0)
WHERE daily_vaccinations IS NULL;
