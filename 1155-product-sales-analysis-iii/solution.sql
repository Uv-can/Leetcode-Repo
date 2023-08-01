# Write your MySQL query statement below

select a.product_id, a.year as first_year, a.quantity, a.price
from
(select product_id, year, quantity, price,
dense_rank() over (partition by product_id order by year) as rnk
from sales 
) a where a.rnk = 1



