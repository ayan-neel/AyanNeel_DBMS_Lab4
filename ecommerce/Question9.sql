/*Q9*/

#Step-1
# Create a new procedure using MySQL Workbench
# Name the procedure as display_supplier_rating_info()


#Step-2
#Embed the following block of code within the BEGIN and END statements
#Click Apply

select d.supp_id,d.supp_name,avg(r.rat_ratstars) as avg_rating,
case 
when avg(r.rat_ratstars) = 5 then "Excellent Service"
when avg(r.rat_ratstars)>4 then "Good service"
when avg(r.rat_ratstars)>2 then "Average service"
else "Poor service"
end as type_of_service
from rating as r
inner join
(
	select s.supp_id,s.supp_name, t.ord_id from supplier as s
	inner join
	(
		select sp.supp_id,o.ord_id from `order` as o
		inner join supplier_pricing as sp
		on o.pricing_id = sp.pricing_id
	) as t
	on s.supp_id=t.supp_id
) as d
on r.ord_id=d.ord_id
group by d.supp_id;


#Step-3
#Invoke the procedure using the following statement
call `display_supplier_rating_info()`;