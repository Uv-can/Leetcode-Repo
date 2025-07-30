-- Write your PostgreSQL query statement below

select product_name, product_id, order_id, order_date
from
(select p.product_name, p.product_id, o.order_id, o.order_date,
dense_rank() over(partition by p.product_name order by o.order_date desc) as rnk
from orders o join products p
on o.product_id = p.product_id) a
where rnk = 1
order by 1, 2, 3

