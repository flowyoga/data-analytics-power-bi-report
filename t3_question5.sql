select p.category, round(cast(sum((p.sale_price - p.cost_price)*o.product_quantity)as numeric),2) total_profit
from orders o
join dim_product p on o.product_code = p.product_code
join dim_store s on o.store_code=s.store_code
where s.country_region='Wiltshire'
group by p.category
order by 2 desc
