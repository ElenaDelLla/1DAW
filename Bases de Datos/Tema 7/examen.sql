En la base de datos World, utilizando 
la tabla country, mostrar la suma de los PIB (GNP) por continente.

select sum(GNP), Continent
from country
group by Continent;

En la base de datos Sakila, utilizando la tabla "film_list". 
mostrar el número de películas por clasificación (rating) mostrando 
solo las clasificaciones que tienen más de 200 películas.

select count(*), rating
from film_list
group by rating
having count(*) > 200;

En la base de datos World, utilizando las tablas "country" 
y "countrylanguage" mostrar cuantos idiomas se hablan en cada 
país mostrando solo los países en los que se habla más de 10 idiomas.

select count(*), country.name
from country, countrylanguage
where country.code = countrylanguage.countrycode
group by country.name
having count(*) > 10;

En la base de datos logistics, utilizando las tablas 
"drivers" y "timesheet", mostrar la suma de las horas 
(hours_logged) por conductor, mostrando solo los conductores 
que sumen más de 2800 horas.

select sum(hours_logged), drivers.name
from drivers, timesheet
where drivers.driverId = timesheet.driverId
group by drivers.name
having sum(hours_logged) > 2800;


En la base de datos movielens, utilizando las tablas 
"user" y "occupation", mostrar el número de usuarios por 
ocupación, mostrando solo las ocupaciones con más de 200 usuarios

select count(*), occupation.name
from user, occupation
where user.occupationid = occupation.id
group by occupation.name
having count(*) > 200;


En la base de datos world, utilizando la tabla
 "country", averiguar los países con un pib (GNP) 
 superior a la media.

select GNP, name
from country
where GNP > (select avg(GNP) from country);

En la base de datos employees, utilizando 
las tablas "employees" y "departments", averiguar 
los empleados cuyo salario están un 20% alrededor de la media.

select employees.name, employees.salary, departments.name
from employees, departments
where employees.department_id = departments.id 
and employees.salary > (select 0.8 * avg(salary) from employees)
and employees.salary < (select 1.2 * avg(salary) from employees);

En la base de datos logistics, utilizando las tablas "timesheet" 
y "drivers", mostrar el conductor que más millas recorre 
(miles_logged) en cada semana (week).

select drivers.name, timesheet.miles_logged, timesheet.week
from drivers, timesheet
where drivers.driverId = timesheet.driverId
and (timesheet.miles_logged, timesheet.week) in 
(select max(miles_logged), week
from timesheet
group by week);

En la base de datos world, utilizando las tablas country y 
countrylanguage, mostrar, en cada país, el idioma más hablado 
(percentage más alto)

select country.name, countrylanguage.Language, countrylanguage.Percentage
from country, countrylanguage
where country.Code = countrylanguage.CountryCode
and (countrylanguage.CountryCode, countrylanguage.Percentage) in 
(select CountryCode, max(percentage)
from countrylanguage
where percentage
group by CountryCode);


En la base de datos sakila, utilizando la tabla 
customer_list, mostrar los clientes de las ciudades donde hay más 
de un cliente.

select name, city
from customer_list
where (city) in 
(select city
from customer_list
group by city
having count(*) > 1);




















