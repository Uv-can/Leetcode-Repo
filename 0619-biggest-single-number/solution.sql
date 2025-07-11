-- Write your PostgreSQL query statement below

select coalesce(max(num), null) as num
from(
select max(num) as num
from mynumbers
group by num
having count(num) < 2)
