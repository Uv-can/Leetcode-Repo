# Write your MySQL query statement below

select distinct a.class from
(select class, count(*) over(partition by class) as number
from Courses ) a
where a.number >= 5
