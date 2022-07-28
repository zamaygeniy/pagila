SELECT city, 
       name,
       sum_length
FROM
    (SELECT city, 
            name, 
            SUM(length) as sum_length, 
            RANK() OVER (PARTITION BY city  ORDER BY SUM(length) DESC) as rank
     FROM rental
     INNER JOIN customer
     ON rental.customer_id = customer.customer_id
     INNER JOIN address
     ON customer.address_id = address.address_id
     INNER JOIN city
     ON address.city_id = city.city_id
     INNER JOIN inventory
     ON rental.inventory_id = inventory.inventory_id
     INNER JOIN film
     ON inventory.film_id = film.film_id
     INNER JOIN film_category
     ON film.film_id = film_category.film_id
     INNER JOIN category
     ON film_category.film_id = category.category_id
     GROUP BY city, name
     HAVING city LIKE 'A%'
     OR city LIKE 'a%'
     OR city LIKE '%-%'
    ) AS rs
WHERE rank = 1
ORDER BY city;