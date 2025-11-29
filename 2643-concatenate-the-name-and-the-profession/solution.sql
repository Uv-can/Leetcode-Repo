-- Write your PostgreSQL query statement below

select  person_id, name||'('||LEFT(profession, 1)||')' as name
from person
order by 1 desc
