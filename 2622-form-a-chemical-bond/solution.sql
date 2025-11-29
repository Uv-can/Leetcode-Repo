-- Write your PostgreSQL query statement below

select m.symbol as metal, n.symbol as nonmetal
from
(select symbol from elements where type = 'Metal') m
cross join
(select symbol from elements where type = 'Nonmetal') n
