-- Write your PostgreSQL query statement below

select customer_id, product_id, product_name
from
(select o.customer_id, p.product_id, p.product_name, 
dense_rank() over(partition by o.customer_id order by count(*) desc) as cnt
from orders o join products p
on o.product_id = p.product_id
group by  o.customer_id, p.product_id, p.product_name
) a
where cnt= 1


