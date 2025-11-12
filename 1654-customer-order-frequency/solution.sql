-- Write your PostgreSQL query statement below
             SELECT 
  customer_id, 
  name 
FROM 
  Customers 
  JOIN Orders USING(customer_id) 
  JOIN Product USING(product_id) 
WHERE 
  to_char(order_date, 'yyyy') = '2020' 
GROUP BY 
  customer_id , name
HAVING 
  SUM(
      case when to_char(order_date, 'mm') = '06' then quantity * price else 0 end 
  ) >= 100 AND 
  SUM(
      case when to_char(order_date, 'mm') = '07' then quantity * price else 0 end 
  ) >= 100;
