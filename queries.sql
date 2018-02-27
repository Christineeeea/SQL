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

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payment
FROM payment as p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name, c.first_name;


SELECT title FROM film WHERE title LIKE 'Q%' OR title LIKE 'K%'
AND language_id = (SELECT language_id FROM language WHERE name='English');


SELECT first_name, last_name FROM actor WHERE actor_id IN (
SELECT actor_id FROM film_actor WHERE film_id = (
SELECT film_id FROM film WHERE title = 'Alone Trip'));


SELECT c.first_name, c.last_name, c.email FROM customer as c 
INNER JOIN address as a ON c.address_id=a.address_id
INNER JOIN city as ct ON a.city_id=ct.city_id
INNER JOIN country as cy ON ct.country_id=cy.country_id WHERE cy.country='Canada';

SELECT title FROM film WHERE film_id IN(
SELECT film_id FROM film_category WHERE category_id=(
SELECT category_id FROM category WHERE name='Family')
);

SELECT f.title, COUNT(f.title) AS rent_frequency FROM rental AS r
INNER JOIN inventory as i ON r.inventory_id=i.inventory_id
INNER JOIN film as f ON i.film_id=f.film_id
GROUP BY f.title 
ORDER BY rent_frequency DESC;

SELECT a.address, ct.city,cy.country, SUM(p.amount) AS revenue
FROM store as s
INNER JOIN address as a
ON S.address_id=a.address_id
INNER JOIN customer as c
ON s.store_id=c.store_id
INNER JOIN payment as p
ON p.customer_id=c.customer_id
INNER JOIN city as ct
ON ct.city_id=a.city_id
INNER JOIN country as cy
ON cy.country_id=ct.country_id
GROUP BY a.address, ct.city, cy.country;

SELECT s.store_id, a.address, ct.city, cy.country FROM store as s
INNER JOIN address AS a
ON s.address_id=a.address_id
INNER JOIN city as ct
ON ct.city_id=a.city_id
INNER JOIN country as cy 
ON cy.country_id=ct.country_id;

SELECT c.name, SUM(p.amount) AS gross_revenue FROM category as c
INNER JOIN film_category AS fc
ON c.category_id=fc.category_id
INNER JOIN inventory AS i
ON fc.film_id=i.film_id
INNER JOIN rental as r
ON i.inventory_id=r.inventory_id
INNER JOIN payment as p
ON r.rental_id=p.rental_id
GROUP BY name ORDER BY gross_revenue DESC
LIMIT 5;

CREATE VIEW top5_genres_gross_revenue AS
SELECT c.name, SUM(p.amount) AS gross_revenue
FROM category AS c
INNER JOIN film_category AS fc
ON c.category_id=fc.category_id
INNER JOIN inventory AS i
ON fc.film_id=i.film_id
INNER JOIN rental as r
ON i.inventory_id=r.inventory_id
INNER JOIN payment as p
ON r.rental_id = p.rental_id
GROUP BY name ORDER BY gross_revenue DESC
LIMIT 5;

SELECT * FROM top5_genres_gross_revenue;

DROP VIEW IF EXISTS top5_genres_gross_revenue;





























