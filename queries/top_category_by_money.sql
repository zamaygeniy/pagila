SELECT category.name,
       SUM(payment.amount) AS sum_amount
FROM payment
INNER JOIN rental 
ON payment.rental_id = rental.rental_id
INNER JOIN inventory
ON rental.inventory_id = inventory.inventory_id 
INNER JOIN film
ON inventory.film_id = film.film_id
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY sum_amount DESC
LIMIT 1;
