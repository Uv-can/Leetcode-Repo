-- Write your PostgreSQL query statement below
with scores as
(
    select player, SUM(SCORE) as score from
(select first_player player, SUM(first_score) as score from matches group by first_player
UNION ALL
select second_player player, SUM(second_score) as score from matches group by second_player)
group by player
)

select distinct p.group_id,
first_value(p.player_id) over(partition by p.group_id order by score desc, p.player_id) player_id
from players p join scores s
on p.player_id = s.player

