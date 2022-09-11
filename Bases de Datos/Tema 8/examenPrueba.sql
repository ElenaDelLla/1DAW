Descargar del aula virtual la BBDD worldx.sql y 
cargarla en en MySQL. Incluir la salida del comando 
DESC de la tabla CITYESP

desc cityesp;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | varchar(6)  | YES  |     | NULL    |       |
| name       | varchar(35) | YES  |     | NULL    |       |
| population | int         | YES  |     | NULL    |       |
| province   | varchar(35) | YES  |     | NULL    |       |
| region     | varchar(50) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
5 rows in set (0,00 sec)

Insertar, en la tabla CITY de la BBDD WORLDX, los datos de las 
dos ciudades autónomas de España (ESP). La población es de 84829 en 
Ceuta y 84689 en Melilla. Dejar que la BBDD asigne el código de ciudad y 
el distrito.

insert into city (name, CountryCode, population)
values ('Ceuta','ESP',84829),
('Melilla','ESP',84689);

Insertar, en la tabla CITY de la BBDD WORLDX, los datos de dos ciudades 
de Portugal (PRT). La primera "Funchal" con una población de 111.892 y , 
la segunda, "Vila Nova de Gaia" con una población de 186.503. 
Dejar que la BBDD asigne el código de ciudad y el distrito.

insert into city (name,CountryCode,population)
values ('Funchal','PRT', 111892),('Vila Nova de Gaia','PRT',186503);

Modificar los registros de Ceuta y Melilla indicando, 
como distrito, "Autonomous City".

select District, name from city where name = 'Ceuta'
and name = 'Melilla';

update city set District = 'Autonomous City' where name = 'Ceuta'
and name = 'Melilla';

Modificar el registro de Funchal indicando, como distrito, 
"Autonomous Region". En el caso de "Vila Nova de Gaia", indicar "Porto".

select District, name from city where name = 'Funchal';
update city set District ='Autonomous Region' where name = 'Funchal';

select District, name from city where name = 'Vila Nova de Gaia';
update city set District = 'Porto' where name ='Vila Nova de Gaia';

Actualizar, en un solo comando, la población y la esperanza de 
vida de España (Spain). La población es de 47.351.567 y, la esperanza de vida, 
83,43.

select population, LifeExpectancy, name from country where name = 'Spain';
update country set population = 4735156, LifeExpectancy = 83.43
where name = 'Spain';

Borrar, en la tabla CITY de la BBDD WORLDX, todos los registros 
correspondientes a ciudades con una población inferior a 1000 habitantes.

select name, population from city where population < 1000;
delete city from city
where population < 1000;

Eliminar de la tabla COUNTRYLANGUAGE, en la BBDD WORLDX, 
Todos los idiomas que se hablen con un porcentaje inferior al 1% y que 
NO sean oficiales.

select Percentage, IsOfficial, language from countrylanguage 
where Percentage < 1 
and IsOfficial = 'F';
delete countrylanguage from countrylanguage
where Percentage < 1
and IsOfficial = 'F';

En la BBDD WORLDX, utilizando las tablas CITY y COUNTRY, eliminar de la 
tabla CITY las ciudades de los países con un GNP menor de 10.

select city.name, country.GNP, country.name
from city, country
where city.countryCode = country.code 
and country.GNP < 10;

delete city 
from city, country
where city.countryCode = country.code 
and country.GNP < 10;

Insertar en la tabla CITY todos los registros de la tabla CITYESP

insert into city (name,population,countryCode)
select name, population,'ESP'
from cityesp;

alter table city 
modify District char 50;





































