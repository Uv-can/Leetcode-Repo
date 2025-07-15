-- Write your PostgreSQL query statement below



select e.name
From employee e join
(select managerid, count(*) as cnt
from employee group by managerid) m
on e.id = m.managerid
where m.cnt >= 5
