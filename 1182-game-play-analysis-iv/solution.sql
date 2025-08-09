-- Write your PostgreSQL query statement below


SELECT ROUND(COUNT(DISTINCT player_id)*1.00 /  (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) as fraction
FROM Activity
WHERE (player_id, event_date - INTERVAL '1 DAY')
IN (SELECT player_id, MIN(event_date) AS first_login FROM ACTIVITY GROUP BY player_id)


