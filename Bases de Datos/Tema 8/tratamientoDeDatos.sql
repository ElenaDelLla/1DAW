INSERT INTO country SELECT * FROM world.country; 

INSERT INTO city (id,name,district,countrycode,population) SELECT id,name,
district,countrycode,population FROM world.city;

/* 

-La tabla tiene que estar creada
-El primero es mas inseguro porque se asume que la lista de campos esta en el mismo
orden. La entrada y la salida de datos esta en el mimo orden y ademas tiene que ser los
mismos datos.
-En la segunda opcion en lo que importa es que en ambas partes, los campos tenga el 
mismo orden para controlar el orden en el que entran en la nueva tabla.
-No crea la tabla, solo introduce los valores de una tabla en otra ya creada.
-Si la tabla ya tiene datos, no deja introducirlo, porque hay primary key
que impiden que se incluya otra primary key

*/

INSERT INTO country (code,Name,Continent,Region,SurfaceArea,IndepYear,Population,
LifeExpectancy,GNP,GNPOld,LocalName,GovernmentForm,HeadOfState,Capital,Code2) 
SELECT code,Name,Continent,Region,SurfaceArea,IndepYear,Population,
LifeExpectancy,GNP,GNPOld,LocalName,GovernmentForm,HeadOfState,Capital,Code2 
FROM world.country;

INSERT INTO city (id,name,district,countrycode,population) 
SELECT id,name,
district,countrycode,population 
FROM world.city;

/*
Insertar un registro
*/
insert into city (id, name, district, countrycode, population) 
values (4080, 'Reus','Katalonia','ESP',104373);

/*
Insertar dos registros
*/
insert into city(id,name,district,countrycode,population)
values (4082, 'Gerona', 'Katalonia', 'ESP', 101852),(4083,'Baracaldo', 'Baskimaa',
'ESP', 100881);

/*
Insercion de algunos campos y modificacion del insert anterior
-Funciona porque, aunque sea una primary key, el id es un campo auto_increment
*/
insert into city(name,district,countrycode,population)
values ('Telde', 'Canary Islands', 'ESP', 102647);

insert into alumnos(Nombre, Apellido1, Apellido2,NIA,NIF)
values 
('Juan','Alvarez','Enriquez',15214,'34112435R'),('Luis','Marchena','Martinez',15216,'23452222G'),
('Pedro','Sanchez','Barcelo',15218,'7221569K'),('Natalia','Gonzalez','Ostos',14893,'5331356L'),
('Julian','Gutierrez','Iglesias',15219,'6754523J'),('Ruben','Huerta','Sanchez',14894,'18254429K'),
('Maria','Lopez','Galvez',15221,'21234123M'),('Cristina','Estevez','Echevarria',15224,'8973452F'),
('Carolina','Montero','Suarez',15234,'22657342S');

insert into alumnos(Nombre, Apellido1,NIA,NIF)
values 
('Alverto','Fernandez',15235,'34452488L');

insert into alumnos(Nombre, Apellido1,NIA,NIF)
values 
('Pedro','Picapiedra',15236,'64450988E');

insert into matricula (niaalumno, asignatura, anno)
values
(15214,'Gestión de Bases de Datos',2019),
(15214,'Redes Locales',2019),
(15216,'Gestión de Bases de Datos',2019),
(15216,'Implantación de Sistemas Operativos', 2019),
(15216,'Formación Orientación y Laboral', 2019);

/*Modificacion de registros*/

SELECT * FROM city WHERE name = 'Madrid';
UPDATE city SET population = 3266126 WHERE name = 'Madrid';

SELECT * FROM city WHERE name = 'Barcelona' and countrycode = 'ESP';
UPDATE city SET population = 1636762 WHERE name = 'Barcelona' and countrycode = 'ESP';

SELECT * FROM city WHERE name = 'Valencia'and countrycode = 'ESP';
UPDATE city SET population = 5037050 WHERE name = 'Valencia'and countrycode = 'ESP';

SELECT * FROM city WHERE name = 'Sevilla';
UPDATE city SET population = 684234 WHERE name ='Sevilla';

SELECT * FROM city WHERE name = 'Zaragoza';
UPDATE city SET population =  701102 WHERE name = 'Zaragoza';

SELECT * FROM city WHERE name = 'Malaga';
UPDATE city SET population = 1695651 WHERE name = 'Malaga';

SELECT * FROM city WHERE name = 'Murcia';
UPDATE city SET population = 6843 WHERE name = 'Murcia';

SELECT * FROM city WHERE name = 'Palma de Mallorca';
UPDATE city SET population = 419366 WHERE name = 'Palma de Mallorca';

En los países con un PIB (GNP) superior a 500.000 
Actualizar su PIB (GNP)
Actualizar su población
Actualizar su esperanza de vida
en un mismo comando.

SELECT name FROM country WHERE GNP > 500000 order by GNP desc;

SELECT name, GNP, LifeExpectancy, population FROM country WHERE name = 'United States';
UPDATE country SET population = 3926650, LifeExpectancy = 78.79, GNP = 19441532
WHERE name = 'United States';

SELECT name, GNP, LifeExpectancy, population FROM country WHERE name = 'Japan'; 
UPDATE country SET population = 125836021, LifeExpectancy = 84,36, GNP = 5250000
WHERE name = 'Japan';

SELECT name, GNP, LifeExpectancy, population FROM country WHERE name = 'China';
UPDATE country SET population =  1413000000, LifeExpectancy = 76.91, GNP = 17574240
WHERE name = 'China';

/*Delete*/

SELECT * from city WHERE id >= 4080;
DELETE city FROM city WHERE id >= 4080;

/*Borrado de registros*/

Borrar las ciudades de los países con una esperanza de vida inferior a 50 
/*Borrar en la tabla city
pero la condicion esta en la tabla country*/

1) Comprobar primero los registros a borrar
SELECT city.name, country.LifeExpectancy, country.name
FROM city, country
WHERE city.countrycode = country.code 
and country.LifeExpectancy < 50;

2) Borrar las ciudades, no los países

DELETE city             /*Se indica la tabla que se quiere borrar*/
FROM city, country
WHERE city.countrycode = country.code 
and country.LifeExpectancy < 50;

SELECT count(*) from country; /*Ver el número de paises*/

/*Borrar también los paises*/

SELECT name
FROM country
WHERE LifeExpectancy < 50;

DELETE
FROM country
WHERE LifeExpectancy < 50;

















