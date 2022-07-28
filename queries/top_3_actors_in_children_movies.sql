SELECT first_name, last_name, name, counter
FROM
    (SELECT actor.first_name, actor.last_name,  category.name, count(*) AS counter,
     DENSE_RANK() OVER(ORDER BY count(*) desc) AS rank
     FROM actor
     INNER JOIN film_actor
     ON film_actor.actor_id = actor.actor_id
     INNER JOIN film
     ON film_actor.film_id = film.film_id
     INNER JOIN film_category
     ON film.film_id = film_category.film_id
     INNER JOIN category
     ON film_category.category_id = category.category_id
     WHERE category.name = 'Children'
     GROUP BY actor.first_name, actor.last_name, category.name
    ) AS rs
WHERE rank <= 3;