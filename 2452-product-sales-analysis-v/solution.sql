-- Write your PostgreSQL query statement below

select s.user_id, SUM(price * quantity) as spending
from sales s join product p
on s.product_id = p.product_id
group by s.user_id
order by 2 desc, 1
