-- Write your PostgreSQL query statement below

select player_id, player_name,
SUM(case when player_id = wimbledon then 1 else 0 end) +
SUM(case when player_id = fr_open then 1 else 0 end) +
SUM(case when player_id = us_open then 1 else 0 end) +
SUM(case when player_id = au_open then 1 else 0 end) as grand_slams_count
from players p join championships c 
on p.player_id = c.wimbledon or p.player_id = c.fr_open or p.player_id = c.US_open  or p.player_id = c.Au_open 
group by player_id,player_name
