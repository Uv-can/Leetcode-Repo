# Write your MySQL query statement below

select x.machine_id, round(SUM(x.time_diff)/count(x.time_diff),3) as processing_time
from
(select a.machine_id, a.process_id, round((b.timestamp - a.timestamp),3) as time_diff
from
(select machine_id, process_id, activity_type, timestamp
from Activity 
where activity_type = 'start') a
left join
(select machine_id, process_id, activity_type, timestamp
from Activity 
where activity_type = 'end') b
on a.machine_id = b.machine_id and a.process_id = b.process_id) x
group by x.machine_id

