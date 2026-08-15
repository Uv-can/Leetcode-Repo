-- Write your PostgreSQL query statement bel


SELECT 
	A2.age_bucket
	, CAST(SUM(CASE WHEN  activity_type ='send' THEN time_spent ELSE 0 END)/SUM(time_spent)* 100 AS DECIMAL(10,2))  send_perc 
	, CAST(SUM(CASE WHEN  activity_type ='open' THEN time_spent ELSE 0 END)/SUM(time_spent)* 100 AS DECIMAL(10,2)) open_perc
FROM Activities A1
	INNER JOIN Age A2 ON A1.user_id = A2.user_id
GROUP BY A2.age_bucket
