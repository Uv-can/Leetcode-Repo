-- Write your PostgreSQL query statement below


select a.team_name as home_team, b.team_name as away_team
from teams a cross join teams b
where a.team_name <> b.team_name

