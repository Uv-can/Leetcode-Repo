-- Write your PostgreSQL query statement below

select a.seat_id from
(select seat_id,free,
lead(free, 1) over() as next,
lag(free,1) over() as prev
from cinema)a
where a.free = 1 and (a.next = 1 or a.prev = 1)
order by a.seat_id
