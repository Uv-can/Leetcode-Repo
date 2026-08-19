-- Write your PostgreSQL query statement below

select p.product_id, 
case when d.category is NULL then price else price - (price * d.discount/100.0) end as final_price,
p.category
from products p left join discounts d
on p.category = d.category
order by product_id
