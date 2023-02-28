/*Q7*/
select p.pro_id, p.pro_name from product as p 
inner join 
(
	select q.pro_id,o.ord_date from supplier_pricing as q
    inner join `order` as o
    on q.pricing_id=o.pricing_id
    where o.ord_date>"2021-10-05"
) as t
on p.pro_id = t.pro_id;