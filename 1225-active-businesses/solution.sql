-- Write your PostgreSQL query statement below

select e.business_id
from 
(select business_id, event_type, occurrences,
AVG(occurrences) over(partition by event_type) as avg
from Events) e
where e.occurrences > avg
group by e.business_id
having count(*) > 1
