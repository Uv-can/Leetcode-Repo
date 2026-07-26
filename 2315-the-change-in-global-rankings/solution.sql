-- Write your PostgreSQL query statement below

select team_id, name, first_rnk - sec_rnk as rank_diff
from
(select t.team_id, t.name,
dense_rank() over(order by t.points desc, t.name) as first_rnk,
dense_rank() over(order by t.points+p.points_change desc, t.name) as sec_rnk
from teampoints t left join pointschange p
on t.team_id = p.team_id) a
