-- Check row counts for all tables

SELECT 'incidents' AS table_name, COUNT(*) AS total_rows
FROM incidents

UNION ALL

SELECT 'access_requests', COUNT(*)
FROM access_requests

UNION ALL

SELECT 'access_reviews', COUNT(*)
FROM access_reviews

UNION ALL

SELECT 'audit', COUNT(*)
FROM audit;

-- Preview incident data

SELECT *
FROM incidents
LIMIT 10;


