# Write your MySQL query statement below





with coordinates as(select * , row_number() over() num from coordinates)
select distinct c1.x, c1.y
from coordinates c1 join coordinates c2
on c1.x = c2.y and  c1.y = c2.x and c1.x <= c1.y and c1.num <> c2.num
order by 1,2
