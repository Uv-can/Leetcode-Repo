-- Write your PostgreSQL query statement below

select u.name, sum(t.amount) as balance
from
transactions t join Users u
on t.account = u.account
group by u.name
having sum(t.amount) > 10000
