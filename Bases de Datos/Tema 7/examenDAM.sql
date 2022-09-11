EN LA BASE DE DATOS WORLD, UTILIZANDO LA TABLA COUNTRY, 
MOSTRAR LA SUMA DE LOS PIB (GNP) POR CONTINENTE. 

select sum(GNP), Continent
from country
group by Continent;

En la base de datos Sakila, utilizando la tabla "film_list". 
mostrar el número de películas por clasificación (rating) 
mostrando solo las clasificaciones que tienen más de 200 películas.

select rating, count(*)
from film_list
group by rating
having count(*) > 200;

En la base de datos World, utilizando las tablas "country" y 
"countrylanguage" mostrar cuantos idiomas se hablan en cada país 
mostrando solo los países en los que se habla más de 10 idiomas.

select country.name, count(*)
from country, countrylanguage
where country.Code = countrylanguage.CountryCode
group by country.name
having count(*) > 10;

En la base de datos logistics, utilizando las tablas "drivers" y 
"timesheet", mostrar la suma de las horas (hours_logged) por 
conductor, mostrando solo los conductores que sumen más de 2800 
horas. 

select sum(hours_logged), drivers.name
from timesheet, drivers
where timesheet.driverId = drivers.driverId
group by drivers.name
having sum(hours_logged) > 2800;

En la base de datos movielens, utilizando las tablas "user" y 
"occupation", mostrar el número de usuarios por ocupación, 
mostrando solo las ocupaciones con más de 200 usuarios.

select count(*), occupation.name
from user, occupation
where user.occupationid = occupation.id 
group by user.occupationid
having count(*) > 200;

En la base de datos world, utilizando la tabla "country", 
averiguar los países con un pib (GNP) superior a la media. 

select name, GNP
from country
where gnp > (select avg(gnp) from country);

En la base de datos employees, utilizando las tablas "employees" 
y "departments", averiguar los empleados cuyo salario están un 20% 
alrededor de la media. 

select employees.name, employees.salary, departments.name
from employees, departments
where employees.department_id = departments.id 
and employees.salary > (select 0.8 * avg(salary) from employees)
and employees.salary < (select 1.2 * avg(salary) from employees);

En la base de datos logistics, utilizando las tablas "timesheet" y 
"drivers", mostrar el conductor que más millas recorre (miles_logged) 
en cada semana (week). 

select drivers.name, timesheet.miles_logged, timesheet.week
from timesheet, drivers
where timesheet.driverId = drivers.driverId
and (week, miles_logged) in 
(select week, max(miles_logged)
from timesheet
group by week);


