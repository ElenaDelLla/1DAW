En la base de datos World, utilizando la tabla country, 
mostrar la media de la experanza de vida (LifeExpectancy) 
de los paises agrupado por el año de independencia 
(IndepYear).

select avg(LifeExpectancy), IndepYear
from country
group by IndepYear;

En la base de datos Sakila, utilizando la tabla 
"customer_list". mostrar el número de clientes por país 
(country) seleccionando los países con más de 15 clientes.

select count(*), country
from customer_list
group by country
having count(*) > 15;

En la base de datos World, utilizando las tablas 
"country" y "city" mostrar la suma de la población de las 
ciudades agrupadas por país.


select sum(city.Population), country.Name
from country, city
where country.code = city.CountryCode
group by country.Name;

En la base de datos employees, utilizando las tablas 
"employees" y "departments", mostrar la suma de los salarios 
agrupados por departamento

select sum(employees.salary), departments.name
from employees, departments
where employees.department_id = departments.id 
group by departments.name;

En la base de datos Sakila, utilizando las tablas "customer" 
y "payment", 
mostrar la suma de los pagos (amount) agrupados por nombre 
y apellidos, mostrando solo los que, la media de los pagos, 
es mayor de 5.

select sum(payment.amount), customer.first_name ,customer.last_name
from payment, customer
where payment.customer_id = customer.customer_id
group by customer.first_name ,customer.last_name
having avg(payment.amount) > 5;

En la base de datos World, utilizando las tablas "city" y "country", 
mostrar las ciudades con una población superior a la máxima 
multiplicada por un factor de 0.7, mostrando también el país donde 
están.

select city.name, city.Population, country.Name
from city, country
where city.CountryCode = country.code
and city.Population > (select 0.7 * max(Population) from city);

En la base de datos employees, utilizando las tablas "employees" 
y "departments", averiguar los empleados con menor salario. Para 
ello utilizar como umbral la media multiplicada por un factor de 
0.8, mostrando también el departamento en el que trabajan.

select employees.name, employees.salary, departments.name
from employees, departments
where employees.department_id = departments.id
and employees.salary > (select 0.8 * avg(salary) from employees);

En la base de datos employees, utilizando las tablas "employees" y 
"departments", mostrar el empleado que más gana en cada uno de los 
departamentos.

select employees.name, employees.salary, departments.name
from employees, departments
where employees.department_id = departments.id 
and (employees.salary, employees.department_id) in 
(select max(salary), department_id
from employees
group by department_id);

En la base de datos World, utilizando las tablas "city" y 
"country", mostrar las ciudades con la menor población de 
cada pais.

select city.name, city.Population, country.Name
from city, country
where city.CountryCode = country.code
and (city.Population, city.CountryCode) in 
(select min(Population), CountryCode 
from city
group by CountryCode);

En la base de datos movielens, utilizando la tabla "movie", 
mostrar las películas publicadas en los años en los que se 
han publicado menos de 5 películas

select name, year 
from movie 
where (year) in 
(select year
from movie
group by year
having count(*) < 5);






























