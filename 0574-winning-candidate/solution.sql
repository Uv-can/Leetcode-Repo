-- Write your PostgreSQL query statement below


select a.name from
(select c.name, 
dense_rank() over(order by count(*) desc) as rnk
from candidate c join vote v
on c.id = v.candidateId
group by c.id, c.name) a
where a.rnk =1

