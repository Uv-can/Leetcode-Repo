# Write your MySQL query statement below

select b.visited_on, b.amount, b.average_amount
from
(select a.visited_on, 
SUM(a.amount) over( rows between 6 preceding and current row) as amount,
round(AVG(a.amount) over( rows between 6 preceding and current row),2) as average_amount,
row_number() over(order by a.visited_on) as rnk
from 
(select visited_on, SUM(amount) as amount from Customer
group by visited_on) a) b
where b.rnk >= 7

