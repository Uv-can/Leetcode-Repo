-- Write your PostgreSQL query statement below


select min(abs(p1.x - p2.x)) as shortest
from point p1 cross join point p2
where p1.x <> p2.x
