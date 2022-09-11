select city.Name, city.Population, city.Distric
from city; /*no hay orden*/

select city.Name, city.Population, city.Distric
from city order by Name;/*ordena por el campo name por orden alfabético, de forma ascendente(por defecto)*/

select city.Name, city.Population, city.Distric
from city order by Name, Distric desc; /*ordena el distrito alfabeticamente de forma descendente
y el nombre de forma ascendente*/

select city.Name, city.Population, city.Distric
from city order by Name, Distric desc; /*ordena ambos campos de forma descendente*/

select city.Name, city.Population, city.Distric
from city order by Name, Distric desc, Population desc;

/*Ejercicios*/

En la base de datos movielens, utilizando las tablas movie y movierating. 
Ordenar por rating y después por año. Descendente en los dos casos.

select movie.name, movie.year, movierating.rating
from movie, movierating
where movie.id = movierating.movieid 
order by movierating.rating desc, movie.year desc;

En la base de datos movielens, utilizando las tablas
movie, moviegenre y genre, 
ordenar por genero ascendente y por año descendente.

select genre.name, movie.name, movie.year
from movie, moviegenre, genre
where movie.id = moviegenre.movieid
and genre.id = moviegenre.genreid order by genre.Name, movie.year desc;


En la base de datos world, utilizando las tablas country y city. 
Mostrar 
el nombre del país, la ciudad y la población ordenadas 
por país ascendente y población descendente

select country.Name, city.name, city.Population
from city, country
where city.CountryCode = country.Code order by country.Name, 
city.Population desc;

En la base de datos sakila, utilizando las tablas film, film_actor y actor, 
ordenar las películas y los actores de cada película alfabéticamente por 
película, nombre y apellido.

select film.title, actor.first_name, actor.last_name
from film, film_actor, actor
where film.film_id = film_actor.film_id
and film_actor.actor_id = actor.actor_id order by film.title, actor.first_name, actor.last_name;

Nombre de las ciudades con una población superior a 1.000.000, de los 
países donde la esperanza 
de vida es superior a 70 años ordenados de mayor a menor esperanza de vida.

select city.name, city.Population, country.name, country.LifeExpectancy
from city, country
where city.CountryCode = country.Code 
and country.LifeExpectancy >70
and city.Population > 1000000 order by country.LifeExpectancy


/*Agrupaciones*/

Busca todas las ciudades de los países con ciudades de 
más de 800000 de habitantes


select city.name, city.Population, country.name
from city, country
where country.code = city.CountryCode
and (city.CountryCode) in 
(select countrycode
from city
where Population > 800000); ----- 1876

En la base de datos employees, utilizando la vista emp_v, 
mostrar el número de empleados por departamento y el número 
de empleados por localización.

select department_name, employee_name from emp_v;

select emp_v.department_name, count(*)
from emp_v
group by emp_v.department_name;

select emp_v.location, count(*)
from emp_v
group by emp_v.location;

select emp_v.location, emp_v.department_name, count(*)
from emp_v
group by emp_v.location, emp_v.department_name;

select emp_v.department_name, emp_v.location, count(*)
from emp_v
group by emp_v.department_name, emp_v.location;


En la base de datos movielens, utilizando las tablas movie 
y movierating, mostrar el rating medio de cada una de las 
películas ordenado de menor a mayor rating. Mostrar también 
el número de valoraciones o ratings por película de menor a mayor.

1ºconsulta:
select movie.name, movierating.rating
from movie, movierating
where movie.name = movierating.userid;

2ºagrupar:
select movie.name, count(*), avg(movierating.rating)
from movie, movierating
where movie.name = movierating.userid
group by movie.name;

3ºordenar
select movie.name, count(*), avg(movierating.rating)
from movie, movierating
where movie.name = movierating.userid
group by movie.name;
order by avg(movierating.rating);

peliculas con peor valoracion:
select movie.name, count(*), avg(movierating.rating)
from movie, movierating
where movie.name = movierating.userid
group by movie.name;
order by avg(movierating.rating) desc;

peliculas mas vistas:
select movie.name, count(*), avg(movierating.rating)
from movie, movierating
where movie.name = movierating.userid
group by movie.name;
order by count(*);

En la base de datos sales, utilizando la tabla customers, 
mostrar el número de clientes agrupados por género.

select gender, count(*)
from customers
group by gender;

En la base de datos sakila, utilizando la tabla film_actor, 
mostrar el número de actores por película y el número de películas 
que ha realizado cada actor. Incorporar la información de las tablas actor y film.

número de películas 
que ha realizado cada actor:
select actor.first_name, actor.last_name, count(film.title)
from film, actor, film_actor
where film_actor.film_id = film.film_id
and actor.actor_id = film_actor.actor_id
group by actor.first_name, actor.last_name;

número de actores por película:
select film.title, count(actor.first_name)
from film, actor, film_actor
where film_actor.film_id = film.film_id
and actor.actor_id = film_actor.actor_id
group by film.title;

use employees;
Numero de empleados que hay en cada departamento:
select department_name, count(employee_name), country
from emp_v
group by department_name, country
order by count(*);


/*Having*/

Para cada pais, paises que tengan mas de 100 ciudades

select country.name, city,name
from country, city
where country.code= city.CountryCode;


select country.name, count(*)
from country, city
where country.code = city.CountryCode
group by country.name;


select country.name, count(*)
from country, city
where country.code = city.CountryCode
group by country.name
having count(*) > 100;


select country.name, count(*)
from country, city
where country.code = city.CountryCode
group by country.name
having count(*) > 100
order by count(*);


select country.name, sum(city.Population), count(*)
from country, city
where country.code = city.CountryCode
group by country.name
having sum(city.Population) > 30000000
and count(*) > 100
order by count(*);


En la base de datos employees mostrar 
la media de salario por departamento mostrando 
solo los que tengan una media superior a 60000,

select departments.name, employees.salary
from departments, employees
where departments.id = employees.department_id;

select departments.name, avg(employees.salary)
from departments, employees
where departments.id = employees.department_id
group by departments.name;

select departments.name, avg(employees.salary)
from departments, employees
where departments.id = employees.department_id
group by departments.name
having avg(employees.salary) > 60000;

En la base de datos world, calcular la población 
por continentes sin mostrar los continentes con una 
población por debajo de 400 millones.

select Continent, sum(country.Population)
from country 
group by Continent
having sum(country.Population) < 400000000;


En la base de datos movielens mostrar el número 
de películas que hay por cada género mostrando 
los géneros que tienen más de 200 películas.

select movie.name, genre.name
from movie, genre, moviegenre
where movie.id = moviegenre.movieid
and genre.id = moviegenre.genreid;

select genre.name, count(*)
from movie, genre, moviegenre
where movie.id = moviegenre.movieid
and genre.id = moviegenre.genreid
group by genre.name
having count(*) > 200
order by count(*);


En la BBDD movielens, utilizando las tablas movie y movierating, mostrar la
valoración media de las películas que cuentan con más de 2.000
valoraciones y que, su valoración media, es mayor que 4.

select movie.name, count(*), avg(movierating.rating)
from movierating, movie
where movie.id = movierating.movieid
group by movie.name
having count(*) > 2000
and avg(movierating.rating) > 4;


En la BBDD logistics, utilizando las tablas drivers y timesheet, mostrar la suma
de horas y millas por conductor, solo los conductores que suman más de
3000 horas.

select drivers.name, sum(timesheet.hours_logged), sum(timesheet.miles_logged)
from drivers, timesheet
where drivers.driverId = timesheet.driverId
group by drivers.name
having sum(timesheet.hours_logged) > 3000;


En la BBDD sakila, utilizando las tablas customer_list y payment, sumar los
pagos de cada cliente (amount) mostrando solo los clientes cuya suma de
pagos sea superior a 160

select customer_list.name, sum(payment.amount)
from customer_list, payment
where customer_list.ID = payment.customer_id
group by customer_list.name
having sum(payment.amount) > 160;


En la BBDD movielens, usando las tablas user y occupation, mostrar
cuantos usuarios hay por ocupación. Solo las ocupaciones con más de 400
usuarios.

select occupation.name, count(*)
from user, occupation
where user.occupationid = occupation.name
group by occupation.name
having count(*) > 400;


Por cada pais la suma de las poblaciones de todas las ciudades
agrupar por paises y por población. Averiguar cuanto de urbano es un pais.

select country.name, country.Population, sum(city.Population), 
sum(city.Population/country.Population)
from country, city
where country.code = city.CountryCode
group by country.name, country.Population
having sum(city.Population/country.Population) > 0.5;


/*subconsultas de un campo*/

select name, Population
from city
where Population >
(select avg(Population) from city);

select avg(Population) from city;

/*Poblaciones con un mayor poblacion*/

select name, Population
from city
where Population > 
(select 0.8 * max(Population) from city);

En la base de datos sales, tabla products, mostrar los 
productos que tienen un precio unitario superior al precio medio de los productos.

select name, unit_price
from products
where unit_price > (select avg(unit_price) from products);


En la base de datos sakila, utilizando las tablas payment y customer, 
averiguar quienes son los clientes que realizan los mayores pagos. 
Considerar los mayores pagos un 80% del pago máximo.

select customer.first_name, customer.last_name, payment.amount
from customer, payment
where customer.customer_id = payment.customer_id
and payment.amount > (select 0.8 * max(payment.amount) from payment);


En la base de datos world, utilizando la tabla city, mostrar las 
ciudades con una población un 20% alrededor de la población media de las ciudades.

select name, population
from city
where population >
0.8 * (select avg(population) /*80% restante*/
from city)
and population <
1.2 * (select avg(population) /*20%, tomando que la media es 1*/
from city);

En la base de datos employees averiguar los empleados 
que ganan un 70% de la media y en qué departamentos trabajan.

select employees.name, departments.name
from employees, departments
where employees.department_id = departments.id
and employees.salary < (select 0.7 * avg(employees.salary)
from employees);


/*Subconsultas de dos campos*/

De cada pais mostrar las ciudades mas pobladas, con todos sus datos:

select country.name, city.name, city.Population
from country, city
where city.CountryCode = country.Code;

select countrycode, max(Population)
from city
group by CountryCode;

/*Union de las dos consultas anteriones:*/

SELECT country.name,city.name,city.population,city.district
FROM country,city
WHERE country.code=city.countrycode
and (city.countrycode,city.population) in
(SELECT countrycode,max(population)
FROM city
GROUP BY countrycode);


de cada departamento el empleado que mas gana

select departments.name,employees.name,employees.salary
from departments,employees
where departments.id=employees.department_id
and (department_id,employees.salary)in
(select department_id,max(employees.salary) 
from employees
group by department_id);











































