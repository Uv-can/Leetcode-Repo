-- Write your PostgreSQL query statement below



select team_id, team_name, coalesce(guest_score, 0) + coalesce(host_score, 0) as num_points
from teams t left join
(select guest_team,
SUM(case when guest_goals > host_goals then 3 
    when guest_goals = host_goals then 1 else 0 end) guest_score
from matches group by guest_team) g on t.team_id = g.guest_team 
left join
(select host_team,
SUM(case when host_goals > guest_goals then 3 
    when host_goals = guest_goals then 1 else 0 end) host_score
from matches group by host_team) h on t.team_id = h.host_team
order by num_points desc, team_id
