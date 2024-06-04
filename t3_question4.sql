create view q4 as 
select s.store_type, round(cast(sum(p.sale_price*o.product_quantity) as numeric),2) total, 
count(o.*) as orders, 
round(cast(sum(p.sale_price*o.product_quantity)*100/sum(sum(p.sale_price*o.product_quantity)) over () as numeric),2) as percentage_of_total
from orders o 
join dim_product p on o.product_code=p.product_code
join dim_store s on s.store_code=o.store_code 
group by s.store_type;


select * from q4;

