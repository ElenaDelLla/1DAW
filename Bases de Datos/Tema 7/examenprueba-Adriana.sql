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

/* En la base de datos World, utilizando las tablas "country" y "city" mostrar la suma de la población de las ciudades agrupadas por país. */

select country.name, sum(city.population)
from city, country
where city.countrycode = country.code
group by country.name;

/* En la base de datos employees, utilizando las tablas "employees" y "departments", mostrar la suma de los salarios agrupados por departamento */

select departments.name, sum(employees.salary)
from employees, departments
where employees.department_id = departments.id
group by departments.name;

/*Suma --> NO ES UNA SUBCONSULTA o normalmente avg (a no ser que quieras multiplicarlo)
Para saber un factor que no conozco a priori --> maximos multiplicados por 0.7, la media etc

Las subconsultas SOLO es cuando un dato o una tabla COINCIDE con un dato de una tabla (la suma o el avg nunca van a coincidir) porque lo que haces es FILTRAR */

/* En la base de datos Sakila, utilizando las tablas "customer" y "payment", mostrar la suma de los pagos (amount) agrupados por nombre y apellidos, mostrando solo los que, la media de los pagos, es mayor de 5. */

select first_name, last_name, sum(amount), avg(amount)
from customer, payment
where payment.customer_id = customer.customer_id 
group by first_name, last_name
having avg(amount)>5;

/* En la base de datos World, utilizando las tablas "city" y "country", mostrar las ciudades con una población superior a la máxima multiplicada por un factor de 0.7, mostrando también el país donde están. */

select city.name, country.name, city.population
from city, country
where city.population > 
(select max(city.population) from city)*0.7
and country.code = city.CountryCode;

/* En la base de datos employees, utilizando las tablas "employees" y "departments", averiguar los empleados con menor salario. Para ello utilizar como umbral la media multiplicada por un factor de 0.8, mostrando también el departamento en el que trabajan. */

select employees.name, departments.name, employees.salary
from employees, departments
where employees.department_id = departments.id
and employees.salary <
(select avg(employees.salary) from employees) * 0.8;

/* En la base de datos employees, utilizando las tablas "employees" y "departments", mostrar el empleado que más gana en cada uno de los departamentos. */

select employees.name, employees.salary, departments.name
from employees, departments
where employees.department_id = departments.id
and (department_id, salary) in 
(select department_id, max(salary)
from employees
group by department_id);

/* "en cada uno", "el que mas por departamento", "el que menos" --> tipico de subconsulta con dos campos 
En estos ejercicios es siempre max o min */

/* En la base de datos World, utilizando las tablas "city" y "country", mostrar las ciudades con la menor población de cada pais. */

select country.name, city.name
from city, country
where country.code = city.CountryCode
and (city.countrycode, city.population) in
(select city.countrycode, min(city.population)
from city
group by city.countrycode); /* por qué salen tres más en la consulta completa, y no en la subconsulta --> porque hay dos ciudades que coinciden en poblacion minima */


/* En la base de datos movielens, utilizando la tabla "movie", mostrar las películas publicadas en los años en los que se han publicado menos de 5 películas */

select name, year
from movie
where year in
(select year
from movie
group by year
having count(*)<5); /* hay que quitar el count(*) de la subconsulta porque no puedes igualarla a nada en la consulta de arriba al filtrarla */



























