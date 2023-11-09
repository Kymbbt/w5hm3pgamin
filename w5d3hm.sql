--Week 5 - Wednesday Questions


--1. List all customers who live in Texas (use JOINs)

SELECT * 
FROM customer

SELECT *
FROM address

SELECT first_name, Last_name, address.district
FROM customer 
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT * 
FROM payment


SELECT first_name, last_name, amount 
FROM customer 
INNER JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99; 



--3. Show all customers names who have made payments over $175(use subqueries)

SELECT * 
FROM payment

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	from payment
	GROUP BY customer_id
	HAVING Sum (amount) > 175

);

--4. List all customers that live in Nepal (use the city table)

SELECT * 
FROM country

SELECT * 
FROM city

SELECT country_id 
FROM city 
Where country_id = 66; 

SELECT country
FROM country
WHERE country = 'Nepal' ;

SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal';


--5. Which staff member had the most transactions?

SELECT * 
FROM payment

SELECT *
From staff

SELECT COUNT (staff.staff_id), first_name, last_name
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
INNER JOIN rental
ON payment.rental_id = rental.rental_id
GROUP BY staff.staff_id
ORDER BY count DESC
LIMIT 1;

--6. How many movies of each rating are there?

SELECT *
FROM film;

SELECT COUNT (rating) 
FROM film
GROUP BY rating; 


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)


SELECT * 
FROM customer


SELECT * 
FROM payment 



SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT (customer_id)
    FROM payment
  	WHERE amount > 6.99
	GROUP BY (customer_id)
	HAVING COUNT (amount) = 1
);

--8. How many free rentals did our stores give away?

SELECT * 
FROM rental

SELECT * 
FROM payment 

SELECT rental_id
FROM rental
WHERE rental_id IN (
	SELECT rental_id 
	FROM payment 
	WHERE amount = 0.00
);
