# Write your MySQL query statement below


select 
a.product_id, coalesce(round(sum(a.total_price)/sum(a.units), 2),0) as average_price
from
(select p.product_id, u.units, p.price*u.units as total_price 
from Prices P left join UnitsSold U on P.product_id = U.product_id and
(U.purchase_date >= P.start_date and U.purchase_date <= P.end_date)) a
group by a.product_id
