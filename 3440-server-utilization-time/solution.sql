-- Write your PostgreSQL query statement below
with cte as
(select server_id, status_time, session_status,
row_number() over(partition by server_id, session_status order by status_time) as rnum
from servers)


select FLOOR(SUM(extract(EPOCH from (c2.status_time - c1.status_time)))/(24*60*60)) as total_uptime_days
from cte c1 join cte c2
on c1.server_id = c2.server_id and c1.rnum = c2.rnum and c1.session_status <> c2.session_status and c1.status_time < c2.status_time
