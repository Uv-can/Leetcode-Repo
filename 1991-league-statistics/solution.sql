-- Write your PostgreSQL query statement below

select t.team_name,
count(*) as matches_played,
SUM(case when (t.team_id = m.home_team_id and m.home_team_goals > m.away_team_goals)
            or (t.team_id = m.away_team_id and m.away_team_goals > m.home_team_goals) 
        then 3
        when m.away_team_goals =m. home_team_goals then 1 else 0 end) as points,
SUM(case when t.team_id = m.home_team_id then m.home_team_goals else m.away_team_goals end) as goal_for,
SUM(case when t.team_id = m.home_team_id then m.away_team_goals else m.home_team_goals end) as goal_against,
SUM(case when t.team_id = m.home_team_id then m.home_team_goals - m.away_team_goals else m.away_team_goals - m.home_team_goals end) as goal_diff
from teams t join matches m
on t.team_id = m.home_team_id or t.team_id = m.away_team_id
group by t.team_name
order by points desc, goal_diff desc, team_name
