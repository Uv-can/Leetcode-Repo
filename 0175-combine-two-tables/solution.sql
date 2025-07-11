-- Write your PostgreSQL query statement below


select p.firstname, p.lastname, a.state, a.city
from person p left join address a
on p.personid = a.personid

