--1. Do we have actors in the actor table that share the full name and if yes display those shared names.

select count(first_name || last_name)
from actor ;

--Firstly I am checking the total number of actor that shared a full name.
--From the above query , I got to know that there are total 200 rows i.e. 200 actor names.

select count(distinct first_name || last_name)
from actor ;

--Now I will check if we have actors in the actor table that share their full names.
--From the above query we have 199 distinct actor's full names out of 200 actors ,which means that 2 actors share the full name.

select distinct a1.first_name , a1.last_name
from actor a1 join actor a2
on a1.actor_id <> a2.actor_id AND a1.first_name = a2.first_name AND a1.last_name = a2.last_name;


/* 2. Return the customer IDs of customers who have spent 
at least $110 with the staff member who has an ID of 2.
*/

select customer_id ,amount , payment.staff_id from payment
inner join staff
on payment.staff_id=staff.staff_id
where amount >=10 and payment.staff_id = 2;

/* 
In above question firstly I have seen that I can get the desired output from joining two table i.e
payment & staff. In both the table staff_id is common . So I joined both the table with the help of staff_id.
and fetch the column customer_id , amount and staff_id .
Then given the condition using where clause,
where staff_id is 2 and amount is greater or equal to $10. 
*/

--3. How many films begin with the letter J?

select  count(title) from film
where title ILIKE 'J%';

/* In this question  , to find how many film I have use count function which will give 
the total number of film.
After that to find the film that start with J I can use like and ilike statement . 
But like is case sensitive so I used ilike statement along with % wildcard.
With the help of this query , there are 20 film begin with J.
*/

--4.What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?

select customer_id , first_name , last_name , address_id from customer
where first_name ilike 'E%' and address_id < 500
order by customer_id desc;

/*
In this question we have two conditions so I used AND operator  .
and for highest customer_id I used order by desc.
*/

--5.How many films have the word Truman somewhere in the title?

select  count(title) from film
where title ilike '%truman%';

/* In this question for how many I have use count function on title .
and to find Truman somwhere  I used  ilke %truman% which will count
all the title name that haveTruman in it.
This query tell us that we have 5 film which have truman in it.
*/

--6. Display the total amount paid by all customers in the payment table.

select sum(amount)
from payment;

/* In this question I have to find total amount paid by all customer.
So to find this I use aggregate function SUM for amount column.
This gives total amount of 61612.04 paid by all customer
*/

--7. Display the total amount paid by each customer in the payment table.

select customer_id , sum(amount) as total_amount 
from payment
group by customer_id
order by customer_id ;

/* In this question ,sum is used to give total amount 
and group by is used for each customer and to make it more presentable 
I use order by.
*/

--8. What is the highest total_payment done.

select customer_id , sum(amount) as total_amount 
from payment
group by customer_id
order by sum(amount) desc
limit 1;

/* In this question ,sum is used to give total amount 
and group by is used for each customer and 
for highest payment I use order by of sum(amount)
and to get the toppest amount I use limit 1.
So from this I got the highest total amount is 211.55 for customer_id 148
*/

--9. Which customers have not rented any movies so far.

select count(title) from film
where film_id in 
(select distinct film_id 
from rental join inventory
on rental.inventory_id = inventory.inventory_id);

--10. How many payment transactions were greater than $5.00?

select count(amount) from payment 
where amount > 5;

/* In this question to find number of transactions greater than 5 
I use  count aggregate function in amount and where to give  condition.
With the help of this query i got to know that there are 3618 transaction greater than 5.
*/


