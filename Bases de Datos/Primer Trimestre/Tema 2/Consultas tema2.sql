select Name, Population from country where Population
between 500000 and 10000000; /* incluye ambos extremos*/
select Name,Population from city where Population
 >=500000 and Population <=10000000;

select CountryCode, Language, Percentage from countrylanguage where 
Percentage>90 and Percentage>100; /*(no incluye limites)*/
select Name,LifeExpectancy from country where LifeExpectancy >75 and LifeExpectancy <=80;
select title,replacement_cost from film where replacement_cost between 10 and 15 limit 10;
select Name,GNP from country where GNP >= 500000 and GNP <= 2000000;
select title,rental_rate from film where rental_rate between 2 and 3;
select title,rental_rate from film where rental_rate > 2 and rental_rate <3;

/*Rangos de fecha y hora*/
select payment_id,customer_id,amount,payment_date from payment where payment_date >= "2005-08-02" and payment_date < "2005-08-03";/*Siempre
estos signos*/
select payment_id,customer_id,amount from payment where payment_date>="2005-08-19" and payment_date<"2005-08-20";
select payment_id, customer_id, amount, payment_date from payment where payment_date > "2005-08-02" and payment_date < "2005-08-03";
select payment_id,customer_id,amount,payment_date from payment where payment_date >="2005-08-02 12" and payment_date <= "2005-08-02 14";
select payment_id,customer_id,amount,payment_date from payment where payment_date>="2005-08-17
10" and payment_date<="2005-08-17 12";
select rental_id,rental_date,customer_id from rental where rental_date >="2006-02-01" and rental_date <"2006-03-01";
select rental_id,rental_date,customer_id from rental where rental_date >="2006-02-14" and rental_date < "2008-02-15";
select rental_id,rental_date,customer_id from rental where rental_date >="2006-02-14 15"and rental_date<= "2006-02-14 16"
/*Patrones*/
/*Examen importante ejemplos de clase*/
select Name from city where Name like "Santa%"
select Name from city where Name like "Santa %"; /*solo empiezan por santa*/
select Name from city where Name like "%burg%"; /*contiene*/
select Name from city where Name like "%burg"; /*que el texto termina en eso*/
select Name from city where Name like "Madrid";
select Name, Continent from country where Continent like "%Americ%";
select Name,GovernmentForm from country where GovernmentForm like "%monar%";
select title from film_list where title like "%WORK%";
select name,address,country from customer_list where country like "%United States%" and address like "%boulevar%";
select title,description from film_text where description like "%monastery%" and description like "%dog%";

/*Combinaciones--- examen seguro*/
/*Ejemplos de clase*/
select Name,LifeExpectancy,GovernmentForm from country where GovernmentForm like "%repub%"
and LifeExpectancy <50;
select Name,GovernmentForm,Population from country where GovernmentForm like "%monar%" and Population >=10000000 and Population<20000000;
select Name,Population from city where Name like "%burg%" and Population >=500000 and Population<1000000;
select title from film_text where title like "% action %" and title like "% shock %";
select payment_id,customer_id,payment_date,amount from payment
where payment_date >= "2005-08-02 12" 
and payment_date < "2005-08-03 14" 
and amount between 4 and 8;
select actor_id,film_info from actor_info where film_info like "%animati%" and film_info like "%music%";
select title,actors from film_list where actors like "%Johnny Cage%" and actors like "%Sean Williams%";
/*salen las peliculas que han hecho cada uno de los actores, no las que estan los juntos*/
select rental_id,return_date,rental_date from rental 
where rental_date >= "2005-07-07" and rental_date <"2005-07-08"
and return_date< "2005-07-08 12";
select CountryCode,Language,IsOfficial,Percentage from countrylanguage where Percentage > 90 and Percentage < 99 and IsOfficial = "F";
select title,description,release_year,last_update from film where title like "a%" and description like "%scientist%" 
and release_year = "2006" and last_update > "2006-02-15 05:03";

















