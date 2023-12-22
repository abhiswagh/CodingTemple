-- Question #1
select * from actor;

select last_name from actor
where last_name = 'Wahlberg';

--Question #2
select * from payment;

select customer_id, amount
from payment
where amount between 3.99 and 5.99;

--Question #3
select * from inventory;

select store_id, film_id, COUNT(film_id)
from inventory
where store_id = 1
group by film_id, store_id
order by COUNT(film_id) desc;

--Question #4
select * from customer;

select last_name
from customer
where last_name like 'William%';

--Question #5
select * from payment

select staff_id, SUM(amount)
from payment
group by staff_id
order by SUM(amount) desc;

--Question #6
select * from customer

select * from address

select COUNT(distinct district)
from address;

--Question #7
select * from film_actor

select COUNT(distinct actor_id), film_id
from film_actor
group by film_id
order by COUNT(distinct actor_id) desc;

select *
from film
where film_id = 508;

--Question #8
select * from customer

select store_id, last_name
from customer
where last_name like '%es' and store_id = 1;

--Question #9
select * from payment

select amount, COUNT(amount)
from payment
where customer_id between 380 and 430
group by amount
having COUNT(amount) > 250
order by COUNT(amount) desc;

--Question #10
select * from film

select COUNT(distinct rating)
from film;

select rating, COUNT(film_id)
from film
group by rating
order by COUNT(film_id) desc;

--Answers to Questions:
-- 1. How many actors are there with the last name ‘Wahlberg’? 
-- Answer: 2 actors
-- 2. How many payments were made between $3.99 and $5.99? 
-- Answer: currently none (payment table has different values now than it did before in lecture video)
-- 3. What film does the store have the most of? (search in inventory) 
-- Answer: Store 1 has 4 copies of many films. I.e. film_id 253
-- 4. How many customers have the last name ‘William’? 
-- Answer: None have the last name ‘William’ specifically, but there is a Williams and Williamson. (2)
-- 5. What store employee (get the id) sold the most rentals? 
-- Answer: Staff_ID 1 sold the most rentals (assuming the sum is not negative, as shown in table).
-- 6. How many different district names are there?
-- Answer: 378 distinct district names 
-- 7. What film has the most actors in it? (use film_actor table and get film_id) 
-- Answer: film_id=508, Lambs Cincinnati (15 actors)
-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) 
-- Answer: 13 customers
-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  with ids between 380 and 430? (use group by and having > 250) 
-- Answer: Three payment amounts had rentals above 250 for customers with those ID’s. 
-- 10. Within the film table, how many rating categories are there? And what rating has the most  movies total?
-- Answer: 5 different rating categories, and PG-13 has the most movies total (224).
