/*Q6*/
select c.cat_id,c.cat_name, t.pro_name, min(t.supp_price) as minProductPrice from category as c
inner join
(select s.supp_price, p.pro_name,p.cat_id from supplier_pricing as s
inner join product as p
on s.pro_id = p.pro_id) as t
on c.cat_id = t.cat_id
group by c.cat_id;