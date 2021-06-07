# Using the tables address and staff and the JOIN command, display the first names, 
# last names, and address of each staff member.
 
SELECT s.first_name, s.last_name, a.address 
from staff as s
join address as a
on a.address_id = s.address_id;

# Using the tables staff and payment and the JOIN command, display the total payment 
# amount by staff member in August of 2005.

Select p.amount, s.staff_id, s.first_name, s.last_name, p.payment_date
from payment as p
join staff as s
on p.staff_id = s.staff_id
WHERE payment_date like  '%2005-08%' ;

# Using the tables film and film_actor and the JOIN command, list each film and the number 
# of actors who are listed for that film.

SELECT f.film_id, f.title, count(a.actor_id) 
FROM film as f
join film_actor as a
on f.film_id = a.film_id
group by f.film_id;

# Using the tables payment and customer and the JOIN command, list the total paid by each customer. Order the 
# customers by last name and alphabetically.

SELECT sum(p.amount) as tot_amount, c.customer_id, c.first_name, c.last_name
FROM payment as p
join customer as c
on p.customer_id = c.customer_id
group by c.customer_id
order by 1 DESC;


