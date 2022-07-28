SELECT category.name, 
       count(*) AS number_of_films
FROM film
INNER JOIN film_category
ON film_category.film_id = film.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY number_of_films DESC;