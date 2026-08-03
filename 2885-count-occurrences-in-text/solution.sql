-- Write your PostgreSQL query statement below

select 'bull' word, SUM(case when content like '% bull %' then 1 else 0 end) as count
from files
UNION ALL
select 'bear' word, SUM(case when content like '% bear %' then 1 else 0 end) as count
from files

