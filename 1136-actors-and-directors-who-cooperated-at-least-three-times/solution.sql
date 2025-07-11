-- Write your PostgreSQL query statement below

select distinct a.actor_id, a.director_id from
(select actor_id, director_id,
count(*) over (partition by actor_id, director_id ) as cnt
from actordirector) a
where a.cnt >= 3
