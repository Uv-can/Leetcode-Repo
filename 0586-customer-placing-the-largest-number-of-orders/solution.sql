# Write your MySQL query statement below

select a.customer_number from
(select customer_number, 
count(*) over(partition by customer_number) as counter
from Orders order by counter desc limit 1) a




