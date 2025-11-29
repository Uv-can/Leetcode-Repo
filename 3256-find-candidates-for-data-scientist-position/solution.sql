-- Write your PostgreSQL query statement below


/*select candidate_id
from candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')
group by candidate_id
having count(*) = 3
order by 1*/

select distinct candidate_id
from candidates
where candidate_id in (select distinct candidate_id from candidates where skill = 'Python')
and 
candidate_id in (select distinct candidate_id from candidates where skill = 'Tableau')
and 
candidate_id in (select distinct candidate_id from candidates where skill = 'PostgreSQL')
order by 1
