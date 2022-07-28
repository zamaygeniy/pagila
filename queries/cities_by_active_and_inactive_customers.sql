SELECT city, 
       count(case active when 1 then 1 else null end) as active_per_city,
       count(case active when 0 then 1 else null end) as inactive_per_city
FROM address
INNER JOIN customer
ON customer.address_id = address.address_id
INNER JOIN city
ON city.city_id = address.city_id
GROUP BY city
ORDER BY inactive_per_city DESC;
