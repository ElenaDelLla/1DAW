En la base de datos WORLD mostrar los nombres de las ciudades, 
su población, el nombre del pais y su forma de gobierno, de los países 
con una forma de gobierno de territorio dependiente (dependent).

	use world;
select city.name, city.Population, country.Name, country.GovernmentForm
from city, country
where city.countryCode = country.code
and country.GovernmentForm like '%dependent%';

En la base de datos WORLD mostrar los nombres de las ciudades, 
su población y el nombre del pais donde están, 
de los países con una superficie (SurfaceArea) menor a 100 Km2.

select city.name, city.Population, country.Name, country.SurfaceArea
from city, country
where city.countryCode = country.code
and country.SurfaceArea < 100;

En la base de datos WORLD mostrar Los países y los idiomas oficiales 
hablados en ellos, 
en los países con una población superior a 100 millones de habitantes.

select country.name, country.Population, countrylanguage.IsOfficial, countrylanguage.language
from country, countrylanguage
where country.code = countrylanguage.countryCode
and countrylanguage.IsOfficial = 'T'
and country.Population > 100000000;

En la base de datos WORLD mostrar los idiomas hablados y 
si son oficiales o no, 
en los países con una superficie (SurfaceArea) menor a 100 Km2

select country.name, country.SurfaceArea,countrylanguage.Language, countrylanguage.IsOfficial
from country, countrylanguage
where country.code = countrylanguage.countryCode
and country.SurfaceArea < 100;

Mostrar la dirección, el distrito y el nombre de las ciudades de Francia (France)

select country.country, address.address, address.district, city.city
from country, city, address
where address.city_id = city.city_id
and city.country_id = country.country_id
and country.country = 'France';

Mostrar el nombre, el apellido, la dirección y el identificador de la tienda, 
de los clientes cuyo nombre empiece por F

select customer.first_name, customer.last_name, store.store_id, address.address
from customer, store, address
where customer.store_id = store.store_id
and customer.address_id = address.address_id
and customer.first_name like 'F%';

Mostrar el título de las películas junto con los nombres y apellidos 
de los actores, 
en las películas cuyo título comience por "MASK"

select film.title, actor.first_name, actor.last_name
from film, actor, film_actor
where film_actor.actor_id = actor.actor_id
and film_actor.film_id = film.film_id
and film.title like 'MASK%';

Mostrar el título de las películas con una duración (length) 
inferior a 48 minutos indicando su duración e idioma.

select film.title, film.length, language.language_id, language.name
from film, language 
where film.language_id = language.language_id and film.length < 48;

Utilizando las tablas staff y address mostrar los nombres de los empleados 
y en que dirección trabajan.

select staff.first_name, staff.last_name,address.address
from staff, address
where staff.address_id = address.address_id;


Mostrar los nombres de los clientes que han alquilado el 31 de Julio de 2005 
desde las 11:00 hasta las 12:00

select customer_list.name, rental.rental_date
from customer_list, rental
where rental.customer_id = customer_list.ID 
and rental.rental_date >= '2005-07-31 11' and rental.rental_date < '2005-07-31 12';













