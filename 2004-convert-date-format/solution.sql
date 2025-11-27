-- Write your PostgreSQL query statement below

select to_char(day, 'FMDay, FMMonth FMDD, yyyy') as day
from days
