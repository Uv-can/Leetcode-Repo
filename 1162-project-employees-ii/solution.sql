# Write your MySQL query statement below

select a.project_id from
(select project_id,
dense_rank() over(order by count(project_id) desc) as rnk
from project
group by project_id
) a
where a.rnk = 1



