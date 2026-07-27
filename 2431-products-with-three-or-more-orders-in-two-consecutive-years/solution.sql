-- Write your PostgreSQL query statement below


SELECT DISTINCT d.product_id 
FROM
(
    SELECT product_id, 
 extract(YEAR from purchase_date) AS curr_year,
 LEAD(extract(YEAR from purchase_date)) OVER(PARTITION BY product_id ORDER BY extract(YEAR from purchase_date)) AS next_year
 FROM orders
 GROUP BY curr_year, product_id
 HAVING COUNT(order_id) >= 3
 ) d
 WHERE d.next_year=d.curr_year+1
