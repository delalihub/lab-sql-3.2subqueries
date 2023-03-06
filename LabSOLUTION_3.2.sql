#1. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT * FROM sakila.film;
SELECT * FROM sakila.inventory;

SELECT COUNT(*) AS total_copies
FROM inventory i
INNER JOIN film f
USING (film_id) 
WHERE f.title = 'Hunchback Impossible';

# 2. List all films whose length is longer than the average of all the films.
SELECT * FROM sakila.film;
SELECT AVG(length) FROM sakila.film;

SELECT * FROM sakila.film
WHERE length > (SELECT AVG(length) FROM sakila.film);

#3.Use subqueries to display all actors who appear in the film Alone Trip
SELECT * FROM sakila.film;
SELECT * FROM sakila.film_actor;

SELECT *,  a.last_name FROM sakila.film_actor fa
JOIN sakila.film f
ON fa.film_id = f.film_id
JOIN sakila.actor a
ON fa.actor_id = a.actor_id
WHERE f.title = "Alone Trip"; 

#4.Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
#Identify all movies categorized as family films
SELECT * FROM sakila.category
WHERE name LIKE "%%famil%%";

#5b. Get name and email from customers from Canada using subqueries.
SELECT concat(first_name, "    ", last_name) AS name, email FROM sakila.customer c 
JOIN sakila.address a 
USING (address_id)
JOIN city ci
ON ci.city_id = a.city_id 
JOIN sakila.country cy 
ON cy.country_id = ci.country_id
WHERE country = "canada";

#.6


