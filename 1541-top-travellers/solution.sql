-- Write your PostgreSQL query statement below

select name, SUM(case when r.distance is NULL then 0 else r.distance end) as travelled_distance
from users u left join rides r
on u.id = r.user_id
group by u.id, name
order by 2 desc, 1
