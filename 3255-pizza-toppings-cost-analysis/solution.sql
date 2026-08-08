-- Write your PostgreSQL query statement below


select distinct concat_ws(',',t1.topping_name,t2.topping_name, t3.topping_name) as pizza, t1.cost+t2.cost+t3.cost as total_cost
from Toppings t1 join Toppings t2
    on t1.topping_name < t2.topping_name
    join Toppings t3
        on t2.topping_name < t3.topping_name
order by 2 desc, 1 asc
