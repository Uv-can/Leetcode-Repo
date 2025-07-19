# Write your MySQL query statement below

select a.player_id, a.device_id from
(select player_id,device_id,
row_number() over(partition by player_id order by event_date) rnum
from activity) a
where a.rnum = 1
