-- Write your PostgreSQL query statement below
select distinct candidate
from
(select candidate,
dense_rank() over(order by SUM(c.ratio) desc) as rnk
from votes v left join
(select voter, 1.0/count(*) as ratio from Votes group by voter) c
on v.voter = c.voter group by candidate) v
where rnk = 1

