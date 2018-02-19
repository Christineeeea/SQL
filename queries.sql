USE sakila;

SELECT first_name, last_name FROM actor;

SELECT upper(CONCAT(first_name, ' ', last_name)) as `Actor Name`FROM actor;

SELECT actor_id, first_name, last_name FROM actor WHERE first_name='Joe';

SELECT first_name, last_name FROM actor WHERE last_name LIKE '%GEN%';

SELECT first_name, last_name FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name ASC, first_name ASC;

SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China')

SELECT * FROM actor; 
ALTER TABLE actor ADD middle_name INTEGER;
ALTER TABLE actor ALTER COLUMN middle_name BLOBS;

SELECT * FROM actor; 
ALTER TABLE actor DROP COLUMN middle_name;

SELECT last_name, COUNT(last_name) AS multiple FROM actor
GROUP BY last_name;

SELECT last_name, COUNT(last_name) AS multiple FROM actor
GROUP BY last_name HAVING multiple > 1;

 
 
















