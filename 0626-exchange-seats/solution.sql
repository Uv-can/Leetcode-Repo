-- Write your PostgreSQL query statement below
select
    (case
        when MOD(id, 2) != 0 and counts != id then id + 1
        when mod(id, 2) != 0 and counts = id then id
        else id -1 end
    ) as id, student
from seat, 
(select count(*) as counts from seat) as seat_counts
order by 1 
