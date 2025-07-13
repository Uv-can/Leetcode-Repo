-- Write your PostgreSQL query statement below

select distinct num as ConsecutiveNums from
(select id, num,
lead(num,1) over(order by id) as num2,
lead(num,2) over(order by id) as num3
from logs) a
where a.num = a.num3 and a.num2= a.num3

