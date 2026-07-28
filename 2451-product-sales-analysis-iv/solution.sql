-- Write your PostgreSQL query statement below

select user_id, product_id
from
(select s.user_id, s.product_id,
dense_rank() over(partition by s.user_id order by SUM(quantity * price) desc) as rnk
from sales s join product p
on s.product_id = p.product_id
group by user_id, s.product_id) a
where rnk = 1


