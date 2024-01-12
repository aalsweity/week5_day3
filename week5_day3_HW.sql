-- Question 1
SELECT first_name, last_name, district
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE district = 'Texas';
-- Answer = 5

-- Question 2
SELECT first_name, last_name, amount
FROM payment p
JOIN customer c 
ON p.customer_id = c.customer_id
WHERE amount > 7; -- I'm considering 7.01 higher than 7 exact.
-- Answer = 1406

-- Question 3
SELECT *
FROM customer c
WHERE customer_id IN (
	SELECT customer_id
	FROM payment p 
	GROUP BY customer_id
	HAVING sum(amount) > 175
	);
-- Answer = 6

-- Question 4
SELECT first_name, last_name, country 
FROM customer c --need customer names AND address TO BEGIN chaining
JOIN address a -- FIRST chaining AS address has city ids that IS needed
ON c.address_id = a.address_id
JOIN city ci -- city SECOND chaining AS city has county ids
ON ci.city_id = a.city_id 
JOIN country co 
ON ci.country_id = co.country_id
WHERE country = 'Argentina';
-- Answer = 13

-- Question 5
SELECT fc.category_id, c.name, count(*) 
FROM category c
JOIN film_category fc 
ON c.category_id = fc.category_id
GROUP BY fc.category_id, c.name
ORDER BY count(*) DESC;
-- Answer = 16 film categories and lots of movies

-- Question 6
SELECT film_id, count(*)
FROM film_actor fa 
GROUP BY film_id
ORDER BY count(*) DESC;
-- Answer = film ID 508

--Question 7
SELECT actor_id , count(*)
FROM film_actor fa
GROUP BY actor_id
ORDER BY count(*);
-- Answer = actor_id = 148

-- Question 8
SELECT country_id, count(*)
FROM city c
GROUP BY country_id 
ORDER BY count(*) DESC;
-- Answer = city id = 50

-- Question 9
SELECT actor_id, count(*)
FROM film_actor fa
GROUP BY actor_id 
having count(*) BETWEEN 20 AND 25;
-- Answer = 65 actors


