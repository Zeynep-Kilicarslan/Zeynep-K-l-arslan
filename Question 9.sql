
CREATE TEMPORARY TABLE extracted_urls AS
SELECT
    Device_Type,
    SUBSTRING_INDEX(SUBSTRING_INDEX(Stats_Access_Link, '<url>', -1), '</url>', 1) AS extracted_url
FROM
    your_table_name
WHERE
    Stats_Access_Link LIKE '%<url>%</url>%'; 

UPDATE your_table_name AS t
JOIN extracted_urls AS e ON t.Device_Type = e.Device_Type
SET t.Extracted_URL = e.extracted_url;
