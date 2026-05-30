-- Write your PostgreSQL query statement below


select * 
from products
where name ~ '(^|[^0-9])[0-9]{3}([^0-9]|$)'
order by 1
