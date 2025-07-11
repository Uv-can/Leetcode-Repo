-- Write your PostgreSQL query statement below

select distinct class
from(
select class, 
count(*) over (partition by class) as cnt
from courses) 
where cnt >= 5
