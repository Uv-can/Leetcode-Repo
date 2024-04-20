# Write your MySQL query statement below

select distinct a.email
from
(select email,
count(*) over(partition by email) as counter
from Person) a
where a.counter > 1
