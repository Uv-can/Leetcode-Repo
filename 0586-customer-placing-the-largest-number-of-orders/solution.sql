# Write your MySQL query statement below

select a.customer_number from
(select customer_number, 
rank() over(order by count(distinct order_number) desc) as rnk
from Orders group by customer_number) a
where a.rnk = 1



