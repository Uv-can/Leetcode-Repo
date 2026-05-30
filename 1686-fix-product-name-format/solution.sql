/* Write your PL/SQL query statement below */
select lower(trim(product_name)) as product_name, to_char(sale_date, 'yyyy-MM') as sale_date,
count(*) as total
from sales
group by lower(trim(product_name)), to_char(sale_date, 'yyyy-MM')
order by 1, 2
