-- Write your PostgreSQL query statement below

select dep_avg.pay_month, department_id,
case when d_avg > c_avg then 'higher'
    when d_avg < c_avg then 'lower'
    else'same' end as comparison 
from
(select to_char(pay_date, 'yyyy-MM') as pay_month, department_id, AVG(amount) d_avg
from salary join employee 
on salary.employee_id = employee.employee_id group by pay_month, department_id ) as dep_avg
join (
    select to_char(pay_date, 'yyyy-MM') as pay_month, avg(amount) c_avg
    from salary group by pay_month
) as com_avg on dep_avg.pay_month = com_avg.pay_month 


