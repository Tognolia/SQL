# Inspect the database structure and find the best-fitting table to analyse for the next task.

select * from actor;
select * from film_actor;

# Display all pairs of actors that worked together in a movie.

select * from film_actor fa1
join film_actor fa2
on fa1.actor_id <> fa2.actor_id
and fa1.film_id = fa2.film_id
order by fa1.film_id, fa1.actor_id;

# Using CROSS JOIN() display all possible pairs of actors and films.
SELECT fa.actor_id, f.film_id, f.title, a.first_name, a.last_name
FROM film as f
CROSS JOIN film_actor as fa USING (film_id)
JOIN actor as a USING (actor_id);