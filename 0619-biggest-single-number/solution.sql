# Write your MySQL query statement below

select max(a.num) as num
from
(select num,
count(*) as r_no
from MyNumbers group by num) a
where a.r_no = 1

