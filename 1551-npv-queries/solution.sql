-- Write your PostgreSQL query statement below

select q.id, q.year, coalesce(n.npv, 0) as npv
from queries q left join npv n
on q.id = n.id and q.year = n.year


