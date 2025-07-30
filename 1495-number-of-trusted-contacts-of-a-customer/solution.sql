# Write your MySQL query statement below


select invoice_id, c.customer_name, price, coalesce(count(distinct c1.contact_name), 0) as contacts_cnt,
coalesce(count(distinct c2.customer_name), 0) as trusted_contacts_cnt 
from invoices i left join customers c on i.user_id = c.customer_id
left join contacts c1 on i.user_id = c1.user_id
left join customers c2 on c2.customer_name = c1.contact_name 
group by invoice_id, c.customer_name, price
order by 1
