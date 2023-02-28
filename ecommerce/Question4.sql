/*Q4*/
use ecommerce;

select o.ord_id,o.ord_amount,t.pro_name from `order` as o
inner join (select s.pricing_id,p.pro_name from supplier_pricing as s
inner join product as p
on s.pro_id=p.pro_id) as t
on o.pricing_id=t.pricing_id
where o.cus_id=2;