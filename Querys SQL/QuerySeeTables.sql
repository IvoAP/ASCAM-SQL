select * from built_used_area;

select * from price_changes;

select * from details;

select * from price_changes
where new_price > old_price
group by listing_id;


	