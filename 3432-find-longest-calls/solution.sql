-- Write your PostgreSQL query statement below
with call as(
select contact_id, type, duration,
dense_rank() over(partition by type order by duration desc) as rnk
from calls)


select  first_name, type, to_char(duration * interval '1 second','HH24:MI:SS')as duration_formatted
from call c join contacts co
on c.contact_id = co.id
where c.rnk <= 3
order by type desc, duration desc, first_name desc





