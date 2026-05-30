-- Write your PostgreSQL query statement below

select *
from products
where description ~ '\ySN[0-9]{4}-[0-9]{4}\y'  -- FIX: Added word boundaries to prevent partial matches
order by 1
