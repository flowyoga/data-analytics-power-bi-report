with revenue2022 as (
select substring(order_date,1,4) as year, substring(order_date, 6,2) as month, p.sale_price*o.product_quantity as revenue
from orders o 
join dim_product p on o.product_code=p.product_code 
where substring(order_date,1,4)='2022')

select year, month, round(cast(sum(revenue) as numeric),2) total
from revenue2022
group by year, month
order by 3 desc 
limit 1