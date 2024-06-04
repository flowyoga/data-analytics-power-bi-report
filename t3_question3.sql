with de_st_revenue_2022 as (
select s.store_type, s.country_code, substring(o.order_date,1,4), p.sale_price*o.product_quantity revenue 
from orders o 
join dim_store s on o.store_code = s.store_code
join dim_product p on o.product_code=p.product_code 
where s.country_code='DE' and substring(o.order_date,1,4)='2022')

select store_type, round(cast(sum(revenue) as numeric),2) from de_st_revenue_2022
group by store_type
order by 2 desc
limit 1 