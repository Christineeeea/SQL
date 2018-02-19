USE sakila;

SELECT first_name, last_name FROM actor;

SELECT upper(CONCAT(first_name, ' ', last_name)) as `Actor Name`FROM actor;

SELECT actor_id, first_name, last_name FROM actor WHERE first_name='Joe';

SELECT first_name, last_name FROM actor WHERE last_name LIKE '%GEN%';

SELECT first_name, last_name FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name ASC, first_name ASC;

SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

SELECT * FROM actor; 
ALTER TABLE actor ADD middle_name INTEGER;
ALTER TABLE actor MODIFY COLUMN middle_name BLOB;

SELECT * FROM actor; 
ALTER TABLE actor DROP COLUMN middle_name;

SELECT last_name, COUNT(last_name) AS multiple FROM actor
GROUP BY last_name;

SELECT last_name, COUNT(last_name) AS multiple FROM actor
GROUP BY last_name HAVING multiple > 1;

SELECT * FROM actor WHERE first_name='GROUCHO' and last_name='WILLIAMS';
UPDATE actor SET first_name = 'HAPRO';
UPDATE actor SET first_name=IF(first_name='HARPO','GROUCHO','MUCHO GROUCHO');

DROP TABLE IF EXISTS address_5a;
CREATE TABLE address_5a (
address_id SMALLINT(5) AUTO_INCREMENT NOT NULL,
address VARCHAR(50) NOT NULL,
address2 VARCHAR(50) NOT NULL,
district VARCHAR(20) NOT NULL,
city_id SMALLINT(5) NOT NULL,
postal_code VARCHAR(10) NOT NULL,
phone VARCHAR(20) NOT NULL,
location GEOMETRY NOT NULL,
last_update TIMESTAMP NOT NULL,
primary key (address_id)
);


SELECT s.first_name, s.last_name, a.address, c.city, country.country
FROM staff AS s
INNER JOIN address AS a
ON s.address_id = a.address_id
INNER JOIN city AS c
ON a.city_id = c.city_id
INNER JOIN country AS country
ON c.country_id = country.country_id;

SELECT s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM payment AS p
INNER JOIN staff AS s
ON p.staff_id = s.staff_id
WHERE p.payment_date >= '20050801' AND p.payment_date < '20050901'
GROUP BY s.staff_id;

SELECT f.title, COUNT(f.title) AS number_of_actors FROM film AS f
INNER JOIN film_actor AS f_actor 
ON f.film_id = f_actor.film_id
GROUP BY f.title;

SELECT f.title, COUNT(f.title) as copies FROM film as f
INNER JOIN inventory AS i
ON f.film_id = i.film_id
WHERE f.title = 'Hunchback Impossible'
GROUP BY f.title;

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM payment as p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name, c.first_name;
















