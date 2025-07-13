-- Write your PostgreSQL query statement below
with sold_o as(select sale_date, 
SUM(sold_num)  as fruit_cnt
from sales
where fruit = 'oranges'
group by sale_date),

 sold_a as(select sale_date, 
SUM(sold_num) as fruit_cnt
from sales
where fruit = 'apples'
group by sale_date)


select a.sale_date, a.fruit_cnt - o.fruit_cnt as diff
from sold_a a join sold_o o 
on a.sale_date = o.sale_date
order by a.sale_date
