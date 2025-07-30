-- Write your PostgreSQL query statement below

select customer_name, customer_id, order_id, order_date
from
(select c.name as customer_name, c.customer_id, o.order_id, o.order_date,
dense_rank() over(partition by c.customer_id order by name, c.customer_id, order_date desc) as rnk
from customers c join orders o
on c.customer_id = o.customer_id) a
where rnk <= 3
order by 1,2, 4 desc
