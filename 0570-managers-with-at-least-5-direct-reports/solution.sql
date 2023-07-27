# Write your MySQL query statement below


select a.name
from Employee a join 
(select managerId, count(*) as cnt
from Employee group by managerID) b
on a.id = b.managerID
where b.cnt >= 5
