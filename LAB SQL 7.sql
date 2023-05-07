USE sakila;
##In the table actor, which are the actors whose last names are not repeated?These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list. 

SELECT  last_name FROM actor;

SELECT distinct last_name , count(*) total
FROM actor
GROUP BY last_name
HAVING 	COUNT(*)= 1
ORDER BY last_name ASC;

##Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

SELECT distinct last_name , count(*) total
FROM actor
GROUP BY last_name
HAVING 	COUNT(*) >1
ORDER BY last_name ASC;

##Using the rental table, find out how many rentals were processed by each employee.
SELECT * FROM rental;

SELECT staff_id , COUNT(*)total
FROM rental
GROUP BY staff_id;

##Using the film table, find out how many films were released each year.
SELECT * FROM film;

SELECT release_year, COUNT(*)total
FROM film
GROUP BY release_year
ORDER BY release_year ASC;

##Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(*)total
FROM film
GROUP BY rating;

##What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating , ROUND (AVG(length),2) AS length_film FROM film
GROUP BY rating;

##Which kind of movies (rating) have a mean duration of more than two hours?
-- PG13