-- Write your PostgreSQL query statement below

select c.customer_id, c.customer_name 
from customers c join orders o
on c.customer_id = o.customer_id
group by  c.customer_name, c.customer_id
having string_agg(o.product_name, ',') like '%A%' and string_agg(o.product_name, ',') like '%B%' and
string_agg(o.product_name, ',') not like '%C%'
order by 1
