-- Write your PostgreSQL query statement below


--select product_id, year as first_year, quantity, price 
--from sales
--where (product_id, year) in 
--(select product_id, min(year) from Sales group by product_id)

select product_id, first_year, quantity, price from
(select product_id, year as first_year, quantity, price,
dense_rank() over(partition by product_id order by year) as rnk
from sales) a
where a.rnk = 1
