-- Write your PostgreSQL query statement below


select event_date as install_dt, count(player_id) installs, ROUND(SUM(case when next_login = 1 then 1.0 else 0 end)/count(player_id)*1.0, 2) as Day1_retention
from
(
    select player_id, event_date, 
(lead(event_date, 1) over(partition by player_id order by event_date))-event_date as next_login,
dense_rank() over(partition by player_id order by event_date) as rnk
from Activity
) a
where rnk = 1 
group by event_date


