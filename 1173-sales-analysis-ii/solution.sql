-- Write your PostgreSQL query statement below

select distinct s.buyer_id
from sales s join product p
on s.product_id = p.product_id
group by s.buyer_id
having string_agg(p.product_name, ',') LIKE '%S8%' and string_agg(p.product_name,',') NOT LIKE '%iPhone%'
