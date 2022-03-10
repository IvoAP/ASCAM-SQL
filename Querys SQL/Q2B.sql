select p.listing_id AS nummber_of_reduction,
(b.built_area + b.used_area) AS area_total,
(
	(p.old_price/(b.built_area + b.used_area)) - 
    (p.new_price/(b.built_area + b.used_area))
)  AS reduction_sqm,
p.new_price,p.old_price,
(((
	(p.old_price/(b.built_area + b.used_area)) - 
	(p.new_price/(b.built_area + b.used_area))) / 
    (p.old_price/(b.built_area + b.used_area))) *
    100
) AS porcentagem,
b.used_area, b.built_area
from price_changes p INNER JOIN built_used_area b ON
	p.listing_id = b.listing_id
where p.new_price < p.old_price
AND EXTRACT(YEAR FROM p.change_date) = 2016
ORDER BY p.listing_id ASC;

select extract(YEAR FROM p.change_date) AS ano,
count(distinct b.listing_id) AS number_properties,
AVG((((
	(p.old_price/(b.built_area + b.used_area)) - 
	(p.new_price/(b.built_area + b.used_area))) / 
    (p.old_price/(b.built_area + b.used_area))) *
    100
))AS porcentagem
from price_changes p INNER JOIN built_used_area b ON
	p.listing_id = b.listing_id
where p.new_price < p.old_price
and extract(YEAR FROM p.change_date) = 2016;

