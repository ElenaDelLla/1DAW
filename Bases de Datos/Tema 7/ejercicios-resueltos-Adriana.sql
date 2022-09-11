/*En la base de datos employees, utilizando la vista emp_v, mostrar el número de empleados por departamento y el número de empleados por localización.*/

select department_name, count(*) 
from emp_v
group by department_name;

select location, count(*) 
from emp_v
group by location;

 /*En la base de datos movielens, utilizando las tablas movie y movierating, mostrar el rating medio de cada una de las películas ordenado de menor a mayor rating. Mostrar también el número de valoraciones o ratings por película de menor a mayor.*/

select movie.name, avg(movierating.rating), count(*)
from movie, movierating
where movie.id = movierating.movieid
group by movie.name
order by count(*);

/* En la base de datos sales, utilizando la tabla customers, mostrar el número de clientes agrupados por género.*/

select gender, count(*)
from customers
group by gender;

/* En la base de datos sakila, utilizando la tabla film_actor, mostrar el número de actores por película y el número de películas que ha realizado cada actor. Incorporar la información de las tablas actor y film.*/

select film.title, count(*)
from film, actor, film_actor
where film_actor.actor_id = actor.actor_id and film_actor.film_id = film.film_id
group by film.title;

select actor.first_name, actor.last_name, count(*)
from film, actor, film_actor
where film_actor.actor_id = actor.actor_id and film_actor.film_id = film.film_id
group by actor.first_name, actor.last_name;

/*La consulta cuenta el número de ciudades que hay por país pero solo muestra los países que tienen más de 100 ciudades. */

select country.name, count(*)
from country, city
where country.code = city.countrycode
group by country.name
having count(*) > 100;

/*La siguiente consulta suma la población de las ciudades por país mostrando los países cuya suma da más de 30 millones.*/

select country.name, sum(city.population)
from city, country
where country.code = city.countrycode
group by country.name
having sum(city.population) > 30000000;

/*En la base de datos employees mostrar la media de salario por departamento mostrando solo los que tengan una media superior a 60000,*/

select departments.name, avg(employees.salary)
from departments, employees
where employees.department_id = departments.id
group by departments.name
having avg(employees.salary)>6000;

/*En la base de datos world, calcular la población por continentes sin mostrar los continentes con una población por debajo de 400 millones.*/

select continent, sum(population)
from country
group by continent
having sum(population)>400000000;


/*En la base de datos movielens mostrar el número de películas que hay por cada género mostrando los géneros que tienen más de 200 películas.*/

select genre.name, count(*)
from genre, movie, moviegenre
where movie.id = moviegenre.movieid and genre.id = moviegenre.genreid
group by genre.name
having count(*)>200;

/*En la BBDD movielens, utilizando las tablas movie y movierating, mostrar la valoración media de las películas que cuentan con más de 2.000 valoraciones y que, su valoración media, es mayor que 4.*/

select movie.name, count(*), avg(movierating.rating)
from movierating, movie
where movie.id = movierating.movieid
group by movie.name
having count(*)>2000 and avg(movierating.rating)>4;

/* En la BBDD logistics, utilizando las tablas drivers y timesheet, mostrar la suma de horas y millas por conductor, solo los conductores que suman más de 3000 horas.*/

select drivers.name, sum(timesheet.hours_logged), sum(timesheet.miles_logged)
from drivers, timesheet
where drivers.driverId = timesheet.driverId
group by drivers.name
having sum(timesheet.hours_logged) > 3000;

/* En la BBDD sakila, utilizando las tablas customer_list y payment, sumar los pagos de cada cliente (amount) mostrando solo los clientes cuya suma de pagos sea superior a 160*/

select customer_list.name, sum(amount)
from customer_list, payment
where payment.customer_id = customer_list.id
group by customer_list.name
having sum(amount) > 160;

/* En la BBDD movielens, usando las tablas user y occupation, mostrar cuantos usuarios hay por ocupación. Solo las ocupaciones con más de 400 usuarios.*/

select occupation.name, count(*)
from occupation, user
where user.occupationid = occupation.id
group by occupation.name
having count(*) > 400;

/*Busca todas las ciudades de los países con ciudades de más de 800000 de habitantes*/

select country.name, city.name, city.population
from city, country
where city.population > 800000
and country.code = city.countrycode;

/*En la base de datos sales, tabla products, mostrar los productos que tienen un precio unitario superior al precio medio de los productos.*/

select name, unit_price
from products
where unit_price > 
(select avg(unit_price)
from products);

/* En la base de datos sakila, utilizando las tablas payment y customer, averiguar quienes son los clientes que realizan los mayores pagos. Considerar los mayores pagos un 80% del pago máximo.*/

select first_name, last_name, amount
from customer, payment
where payment.customer_id = customer.customer_id
and amount >
(select max(amount)
from payment)*0.8;

/* En la base de datos world, utilizando la tabla city, mostrar las ciudades con una población un 20% alrededor de la población media de las ciudades.*/

select name, population
from city
where population >
0.8*(select avg(population)
from city)
and population <
1.2*(select avg(population)
from city);

/* En la base de datos employees averiguar los empleados que ganan un 70% de la media y en qué departamentos trabajan.*/

select employees.name, departments.name
from departments, employees
where employees.department_id = departments.id
and salary < 0.7 *
(select avg(salary)
from employees);

/*Lista de las ciudades que tienen la mayor población en cada país. Con una población de más de 8 millones de habitantes*/

select city.name, country.name, city.population
from country, city
where country.code = city.countrycode
and (countrycode, city.population) in
(select countrycode, max(city.population)
from city
group by countrycode)
and city.population>8000000;

/*En la base de datos de empleados mostrar, de cada departamento, el empleado que menos gana*/

select employees.name, departments.name, employees.salary
from employees, departments
where departments.id = employees.department_id
and (department_id, salary) in
(select department_id, min(salary)
from employees
group by department_id);

/*En la base de datos world averiguar, dentro de cada continente, el país más poblado. Descontar los casos en los que el máximo de 0*/

select name, population, continent
from country
where (continent, population) in
(select continent, max(population)
from country
group by continent)
and population > 0;

/*En la base de datos sakila, en la tabla film, mostrar, de cada clasificación (rating) la película de mayor duración.*/

select title, rating, length
from film
where (rating, length) in
(select rating, max(length)
from film
group by rating);

/* EXAMEN */
/* En la base de datos World, utilizando la tabla country, mostrar la media de la experanza de vida (LifeExpectancy) de los paises agrupado por el año de independencia (IndepYear). */

select IndepYear, avg(LifeExpectancy)
from country
group by IndepYear;

/* En la base de datos Sakila, utilizando la tabla "customer_list". mostrar el número de clientes por país (country) seleccionando los países con más de 15 clientes. */

select country, count(*)
from customer_list
group by country
having count(*)>15;

/* En la base de datos World, utilizando las tablas "country" y "city" mostrar la suma de la población de las ciudades agrupadas por país. !!!!!!!!!!!!!!!!!!!!!!!!!!!!! */

select country.name, sum(city.population)
from city, country
where city.countrycode = country.code
group by countrycode;

/* En la base de datos employees, utilizando las tablas "employees" y "departments", mostrar la suma de los salarios agrupados por departamento */

select departments.name, sum(employees.salary)
from departments, employees
where departments.id = employees.department_id
group by departments.name;

/* En la base de datos Sakila, utilizando las tablas "customer" y "payment", mostrar la suma de los pagos (amount) agrupados por nombre y apellidos, mostrando solo los que, la media de los pagos, es mayor de 5. */

select first_name, last_name, sum(amount), avg(amount)
from customer, payment
where customer.customer_id = payment.customer_id
group by first_name, last_name
having avg(amount)>5;

/* En la base de datos World, utilizando las tablas "city" y "country", mostrar las ciudades con una población superior a la máxima multiplicada por un factor de 0.7, mostrando también el país donde están. */

select city.name, country.name, city.population
from city, country
where city.countrycode = country.code
and city.population > 0.7 * (
select max(city.population)
from city);

/* En la base de datos employees, utilizando las tablas "employees" y "departments", averiguar los empleados con menor salario. Para ello utilizar como umbral la media multiplicada por un factor de 0.8, mostrando también el departamento en el que trabajan. */

select employees.name, departments.name
from employees, departments
where employees.department_id = departments.id
and salary < 0.8*
(select avg(salary)
from employees);

/* En la base de datos employees, utilizando las tablas "employees" y "departments", mostrar el empleado que más gana en cada uno de los departamentos. */

select employees.name, employees.salary, departments.name
from employees, departments
where (department_id, salary) in 
(select department_id, max(salary)
from employees
group by department_id)
and departments.id = employees.department_id;

/* En la base de datos World, utilizando las tablas "city" y "country", mostrar las ciudades con la menor población de cada pais. */

select city.name, country.name, city.population
from city, country
where country.code = city.countrycode
and (countrycode, city.population) in 
(select CountryCode, min(city.population)
from city
group by countrycode);

/* En la base de datos movielens, utilizando la tabla "movie", mostrar las películas publicadas en los años en los que se han publicado menos de 5 películas */

select name, year
from movie
where year in (
select year
from movie
group by year
having count(*)<5);

