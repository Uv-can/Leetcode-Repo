-- Write your PostgreSQL query statement below



select team_id, team_name, SUM(wins*3 + draws) as points,
rank() over(order by SUM(wins*3 + draws) desc) as position
from teamstats
group by team_id, team_name
order by 3 desc, 2
