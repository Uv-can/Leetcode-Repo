# Write your MySQL query statement below

select distinct a.stock_name, b.sell_price - a.buy_price as capital_gain_loss
from
(select stock_name,
SUM(price) over(partition by stock_name ) as buy_price
from Stocks where operation = 'Buy') a join 
(select stock_name,
SUM(price) over(partition by stock_name ) as sell_price
from Stocks where operation = 'Sell') b on a.stock_name = b.stock_name
