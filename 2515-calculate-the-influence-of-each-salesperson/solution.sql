-- Write your PostgreSQL query statement below


select sp.salesperson_id, sp.name, coalesce(SUM(s.price),0) as total
from  salesperson sp
left join customer c on c.salesperson_id = sp.salesperson_id
left join sales s on c.customer_id = s.customer_id
group by sp.salesperson_id, sp.name
