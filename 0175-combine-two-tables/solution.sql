# Write your MySQL query statement below


select a.firstname, a.lastname, b.city, b.state
from Person a left join
Address b on
a.personId = b.personId

