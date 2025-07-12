-- Write your PostgreSQL query statement below


select w1.id
from Weather w1 join Weather w2
on w1.recorddate - w2.recorddate = 1 
where w1.temperature > w2.temperature
