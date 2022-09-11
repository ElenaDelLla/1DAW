Nombre de las ciudades con una población superior a 1.000.000,
de los países donde la esperanza de vida es superior a 80 años.

select city.Name, city.Population, country.Name, country.LifeExpectancy
from city, country
where city.CountryCode = country.Code
and country.LifeExpectancy > 80
and city.Population > 1000000;

Lenguaje oficial de los países donde el producto interior 
bruto es mayor de 8.000.000 millones de USD

select countrylanguage.Language, countrylanguage.IsOfficial ,country.Name, country.GNP
from countrylanguage, country
where countrylanguage.CountryCode = country.Code
and country.GNP > 8000000
and countrylanguage.IsOfficial = 'T';

Ciudades con una población mayor de 1.000.000, 
de los países donde se habla Inglés.

select city.Name, city.Population, countrylanguage.Language
from city, countrylanguage
where city.CountryCode = countrylanguage.CountryCode
and city.Population > 1000000
and countrylanguage.Language = 'English';


Comparar la tabla customer y customer_list mostrando 
el nombre del cliente, 
su email y el país. Mostrar solo los que no están activos.

select customer.first_name, customer.email, customer.active, customer_list.country
from customer, customer_list
where customer.customer_id = customer_list.ID
and customer.active = 0;

Mostrar la lista de pagos del 19/08/2005 entre las 12 y las 13 horas, 
mostrando la cantidad, el nombre del cliente y su dirección.
 
select payment.payment_id, payment.payment_date, payment.amount, customer_list.name, customer_list.address
from customer_list, payment
where payment.customer_id= customer_list.ID
and payment.payment_date >= '2005-08-19 12' and payment.payment_date < '2005-08-19 13';


Nombre de las capitales de los países con un GNP superior a 500.000 millones de euros.

select city.Name, country.GNP
from city, country
where city.ID = country.Capital
and country.GNP > 500000;

Utilizando las tablas film y film_list mostrar el título, 
las características especiales y 
la duración de las películas con una duración de más de 180 minutos.

select film_list.title, film.special_features, film.length
from film, film_list
where film.film_id = film_list.FID
and film.length > 180;

Utilizando las tablas film e inventory mostrar cuantas películas 
con el título ‘ZORRO ARK’ hay en cada tienda y el número de inventario.

select film.title, inventory.inventory_id, inventory.store_id
from film, inventory
where film.film_id = inventory.film_id
and film.title like 'ZORRO ARK';

Utilizando las tablas film y language averiguar el idioma de las películas 
con una duración inferior a 50 minutos.

select film.title, film.length, language.name
from film, language
where film.language_id = language.language_id
and film.length < 50;

Utilizando las tablas rental y customer_list mostrar los nombres de 
los clientes de España y las fechas de sus alquileres.

select rental.rental_date, customer_list.name, customer_list.country
from rental, customer_list
where rental.customer_id = customer_list.ID
and customer_list.country = 'Spain';




consultas de tres tablas:

En la base de datos sakila, utilizando las tablas customer, address y city, mostrar el nombre,
la dirección y la ciudad de los clientes que viven en una avenida

select customer.first_name, customer.last_name, address.address, city.city 
from customer, address, city 
where customer.address_id = address.address_id 
and address.city_id = city.city_id 
and address.address like '%avenue%';

Base de datos World:

Mostrar el nombre de las ciudades cuya población sea superior a 7 millón de
habitantes mostrando también el nombre del país y el idioma oficial del país.

select city.name, city.population, country.name, countrylanguage.IsOfficial
from city, country, countrylanguage
where city.countrycode = country.code and countrylanguage.countrycode = country.code
and countrylanguage.IsOfficial= 'T'
and city.population > 7000000;


Base de datos Sakila

Mostrar el título de las películas que contengan la palabra sea (mar en inglés) 
de la tabla film junto con el nombre de la categoría a la que pertenecen de la tabla category. 
Utilizar la tabla film_category como nexo de unión


select film.title, category.category_id
from film, category,film_category
where film.film_id = film_category.film_id
and category.category_id = film_category.category_id
and film.title like '%sea%';


Mostrar los pagos de la tabla payment del 19 de Agosto de 2005 entre las 10:00 y las 10:30 
mostrando el nombre del cliente, su dirección y el nombre del empleado que le ha atendido.

select payment.payment_id, payment.payment_date, payment.staff_id, customer.first_name, customer.last_name,
customer_list.address
from payment, customer_list, customer
where payment.customer_id = customer.customer_id
and customer.customer_id = customer_list.ID
and payment.payment_date >= '2005-08-19 10' 
and payment.payment_date < '2005-08-19 10:30';























