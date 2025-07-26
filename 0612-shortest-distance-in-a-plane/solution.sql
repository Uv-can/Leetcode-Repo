-- Write your PostgreSQL query statement below


select round(min(shortest)::Numeric,2) as shortest from
(select SQRT((pow((p2.x-p1.x),2) + pow((p2.y - p1.y),2))) as shortest 
from point2d p1 cross join point2d p2)
where shortest > 0
