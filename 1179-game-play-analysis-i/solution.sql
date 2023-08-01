# Write your MySQL query statement below


select a.player_id, a.event_date as first_login
from
(select player_id, event_date,
row_number() over(partition by player_id order by event_date) as r_no
from Activity) a
where a.r_no = 1
