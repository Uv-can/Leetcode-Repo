-- Write your PostgreSQL query statement below

select s.seller_id from
(select seller_id,
dense_rank() over(order by sum(price) desc) as rnk
from sales
group by seller_id) s
where s.rnk = 1


