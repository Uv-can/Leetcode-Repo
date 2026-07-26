-- Write your PostgreSQL query statement below


select first.first_col, second.second_col
from
(select first_col, row_number() over(order by first_col) as row_first from data ) first join
(select second_col, row_number() over(order by second_col desc) as row_sec from data) second
on first.row_first = second.row_sec
