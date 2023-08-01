# Write your MySQL query statement below

select distinct a.num as ConsecutiveNums
from
(select num,
lead(num) over() as next,
lead(num,2) over() as second_next
from Logs) a
where a.num = a.next and a.num = a.second_next
