-- Write your PostgreSQL query statement below
with invt as
(select store_id,quantity, price, product_name,    
count(product_name) over(partition by store_id) as invt_cnt,
dense_rank() over(partition by store_id order by price desc) as max_rnk,
dense_rank() over(partition by store_id order by price) as min_rnk
from inventory)


select max_invt.store_id, s.store_name, s.location, most_exp_product, cheapest_product, 
ROUND(min_qua*1.0/max_qua, 2) as imbalance_ratio
from
(select store_id,quantity as max_qua, price as max_prc, product_name as most_exp_product,invt_cnt from invt where max_rnk = 1) max_invt join
(select store_id,quantity as min_qua, price as min_prc, product_name as cheapest_product,invt_cnt from invt where min_rnk = 1) min_invt 
on max_invt.store_id = min_invt.store_id
 join stores s on max_invt.store_id = s.store_id
where max_qua < min_qua and max_invt.invt_cnt >= 3
order by imbalance_ratio desc, store_name
