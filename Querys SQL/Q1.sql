select distinct p.listing_id, p.old_price, p.new_price
from price_changes p INNER JOIN built_used_area b ON
	p.listing_id = b.listing_id
where (b.built_area > 200 OR b.used_area > 200) AND  p.new_price > p.old_price
order by p.listing_id ASC;

select count(distinct listing_id) AS distinct_ip, count(listing_id) AS not_distinct
from price_changes;

select extract(YEAR FROM p.change_date) AS ano,
AVG(p.new_price/ (b.built_area + b.used_area)) AS media_preco_metro_quadrado
from price_changes p INNER JOIN built_used_area b ON
	p.listing_id = b.listing_id
where (b.built_area + b.used_area) > 200
AND  p.new_price > p.old_price 
AND extract(YEAR FROM p.change_date) = 2016;

