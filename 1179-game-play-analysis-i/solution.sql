# Write your MySQL query statement below

select a.player_id, a.event_date as first_login
from
(select player_id, event_date,
row_number() over(partition by player_id order by event_date) as row_num
from Activity) a
where a.row_num = 1
