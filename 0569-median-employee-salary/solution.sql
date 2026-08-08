-- Write your PostgreSQL query statement below

select id, company, salary
from
(select id, company, salary,
count(id) over(partition by company) as tot,
row_number() over(partition by company order by salary) as rnk
from Employee) a
where rnk between tot/2.0 and tot/2.0 + 1
