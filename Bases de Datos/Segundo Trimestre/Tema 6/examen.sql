En la base de datos WORLD mostrar los nombres de las ciudades, su distrito, 
el nombre del Pais y 
su forma de gobierno, de los países cuya forma de gobierno es un emirato (emirate).

select city.Name, city.District, country.Name, country.GovernmentForm
from city, country
where city.CountryCode = country.Code
and country.GovernmentForm like '%emirate%';

En la base de datos WORLD mostrar los nombres de las ciudades, sus distrito, 
su población y el nombre del Pais donde están. Se deben mostrar solo las ciudades que 
tengan una población superior a 5 millones y que, el distrito, se llame igual que la ciudad.

select city.Name, city.District, city.Population, country.Name
from city, country
where city.CountryCode = country.Code
and city.Population > 5000000
and city.District = city.Name;

Mostrar las capitales de los países con una esperanza de vida superior a 78 años.

select city.Name, country.Name, country.LifeExpectancy
from city, country
where city.ID = country.Capital
and country.LifeExpectancy > 78;

En la base de datos WORLD mostrar Los países y los idiomas hablados en ellos, 
en los países con una esperanza de vida superior a 80 años.

select country.Name, countrylanguage.Language, country.LifeExpectancy
from country, countrylanguage
where countrylanguage.CountryCode = country.Code
and country.LifeExpectancy > 80;



En la base de datos WORLD mostrar los idiomas oficiales de los países con 
un tipo de gobierno federal.

select countrylanguage.Language, countrylanguage.IsOfficial, country.Name, country.GovernmentForm
from country, countrylanguage
where countrylanguage.CountryCode = country.Code
and country.GovernmentForm like 'Federal%'
and countrylanguage.IsOfficial ='T';

Mostrar la dirección, el distrito y el nombre de las ciudades de Argentina

select address.address, address.district, city.city, city.city_id
from city, address, country
where city.city_id = address.city_id
and city.country_id = country.country_id
and country.country like '%Argentina%';


Mostrar el nombre, el apellido, la dirección y el identificador de la tienda, de los 
clientes cuyo apellido comience por "WILL"

select customer.first_name, customer.last_name, store.store_id
from customer, store
where customer.store_id= store.store_id
and customer.last_name like 'WILL%';


Mostrar el título de las películas de la categoría viajes (Travel) y rating igual a G

select film.title,film.rating, category.name
from category, film, film_category
where film_category.film_id = film.film_id
and film_category.category_id = category.category_id
and category.name like '%Travel%'
and film.rating = 'G';

Mostrar el título de las películas con una duración (length) 
inferior a 48 minutos indicando su duración e idioma.

select film.title, film.length, language.name, language.language_id
from film, language
where film.language_id= language.language_id
and film.length< 48;


Utilizando las tablas staff y address mostrar los nombres de 
los empleados y en que dirección trabajan.

select staff.first_name, staff.last_name, address.address
from staff, address
where staff.address_id = address.address_id;

Mostrar los pagos, la cantidad (amount) y los nombres de los clientes, 
de los pagos realizados el 24 de Mayo de 2005.

select customer.first_name, customer.last_name, payment.amount, payment.payment_date,
payment.payment_id
from customer, payment
where payment.customer_id = customer.customer_id
and payment.payment_date >= '2005-05-24' and payment.payment_date <'2005-05-25';














