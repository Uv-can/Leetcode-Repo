-- Write your PostgreSQL query statement below

select artist, count(*) as occurrences
from spotify
group by artist
order by 2 desc, 1
