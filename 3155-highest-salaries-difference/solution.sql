-- Write your PostgreSQL query statement below
select
abs((select
MAX(SALARY)
from salaries where department = 'Marketing') -
(select
MAX(SALARY)
from salaries where department = 'Engineering')) as salary_difference
