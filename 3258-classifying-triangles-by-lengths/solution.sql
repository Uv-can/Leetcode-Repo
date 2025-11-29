-- Write your PostgreSQL query statement below

select 
case when a+b > c and b+c > a and c+a > b then 
    case when a = b and b = c and a = c then 'Equilateral'
    when a = b or a = c or b = c then 'Isosceles'
    when  a <> b and a <> c and b <> c then  'Scalene' end
else 'Not A Triangle' end as triangle_type
from triangles

