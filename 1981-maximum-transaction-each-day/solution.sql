-- Write your PostgreSQL query statement below

select transaction_id
from
(select transaction_id,
dense_rank() over(partition by to_char(day, 'yyyy-MM-dd') order by amount desc) as rnk
from transactions) t
where rnk = 1
order by 1
