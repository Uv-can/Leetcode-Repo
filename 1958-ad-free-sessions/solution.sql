-- Write your PostgreSQL query statement below
(select distinct session_id from playback)
except
(select distinct p.session_id
from playback p join ads a
on p.customer_id = a.customer_id and a.timestamp between p.start_time and p.end_time)


