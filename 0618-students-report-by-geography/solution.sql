-- Write your PostgreSQL query statement below

with america as
(select continent, name,
row_number() over(order by name) as rnk 
from student where continent = 'America'),
 europe as
(select continent, name,
row_number() over(order by name ) as rnk 
from student where continent = 'Europe'),
 asia as
(select continent, name,
row_number() over(order by name) as rnk 
from student where continent = 'Asia')

select am.name as America,  a.name as Asia, e.name as Europe
from america am left join
europe e on am.rnk = e.rnk
left join asia a
on am.rnk = a.rnk
