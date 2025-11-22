-- Write your PostgreSQL query statement below


select p.name, 
SUM(case when i.rest is null then 0 else i.rest end) as rest, 
SUM(case when i.paid is null then 0 else i.paid end) as paid, 
SUM(case when i.canceled is null then 0 else i.canceled end) as canceled, 
SUM(case when i.refunded is null then 0 else i.refunded end) as refunded
from invoice i right join product p on i.product_id = p.product_id
group by p.name
order by 1
