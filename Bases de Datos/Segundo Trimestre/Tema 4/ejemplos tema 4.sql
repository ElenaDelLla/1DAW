create database test;
show databases;
use test; /*muy importante*/
create table alumno (nombre varchar(20),/*20- el espacio reservado para el 
registro es 20*//*varchar significa caracter se puede utilizar tambien char*/
apellido1 varchar(20),
apellido2 varchar(20)/*en el ultimo campo no hay comas*/
);
drop table; /*borra la tabla en la que estas*/
/*campo clave*/
/**Prymari Key, solo puede haber uno*/
alter table alumno add nia varchar (5); /*Siempre que no se vaya a operar
con el número, se pone varchar, para poner 0 delante, un guión...*/
alter table alumno modify nia varchar (5) primary key; /*hay que llenar 
el campo, si no da error y tiene que se siempre distinto*/
/*Unique Key*/
alter table alumno add nif varchar (9) unique key;
alter table alumno	modify NIF varchar (9) unique key;
/*Para que estos esten oblogatoriamente: se pone siempre para que no de problema*/
alter table alumno	modify  nif varchar (9) not null;
 /*como el desc pero se ven mas detalles, es para ver como es la tabla
. muestra como se ha llegado a crear la tabla*/
show create table alumno;
/*poner obligatorios los siguientes campos*/
alter table alumno modify nombre varchar (20) not null; /*null es indefinido*/
alter table alumno modify apellido1 varchar (20) not null;
/*para quitar la carcteristica null, se pone null y ;*/
/*valor de defectos, cuando no se pone el dato se pone el valor 
por defecto*/
alter table alumno modify apellido2 varchar (20)  default ""; /**deja el campo vacío, se tiene que 
hacer siempre*/
alter table alumno modify apellido1 varchar (20) not null default ""; /*No le quita el null*/
/*cuando no se mete un dato aplica el default. si el null esta en 
yes (no son campos obligatorios) y no se mete dato 
es cuando se ve el default*/
/*clave ajena*/
drop table matricula;
create table matricula (
niaalumno varchar (5) not null,
modulo varchar (20) not null,
curso year not null
);
desc matricula;
show create table matricula;
/*poner una foreing key: el campo no es key en la tabla matricula, 
pero es key en la de alumno*/
alter table matricula add foreign key (niaalumno) references alumno(nia);
/*quitar una foreing key*/
show create table matricula;
alter table matricula drop constraint matricula_ibfk_1;
show create table matricula; /*aparece borrada*/
/*la foreing key en el desc aparece como null, por lo que hay que verlo con el
show create table*/
/*indices*/
show index from alumno; /*sobre un campo clave(primary y unique jey) no hace falta crear un indice
se hace solo*/
create index niaindex on alumno (nia);
create index nombreindex on alumno (nombre);    
drop index niaindex on alumno;/*borrar indice nia*/
/*insercion de datos en la tabla*/
insert into alumno 
(nombre, apellido1, apellido2, nia, nif) 
values 
("Juan", "Perez","Gonzalez", "15123", "3451287G");
/*Introduce los datos según aparezcan en la tabla, es mejor no usarlo*/
insert into alumno 
values ("Luis", "Gonzalez", "Suarez", "15118", "7651287L");
/*cuando no se sabe algun dato no puede usarse este método*/

/*insercion de varios registros*/
insert into alumno
(nombre, apellido1, apellido2, nia, nif)
values("Juan","Alvarez","Enriquez","15214","34112435R"),
("Luis","Marchena","Martinez","15216","23452222G"),
("Pedro","Sanchez","Barcelo","15218","7221569K"),
("Natalia","Gonzalez","Ostos","14893","5331356L"),
("Julian","Gutierrez","Iglesias","15219","6754523J"),
("Ruben","Huerta","Sanchez","14894","18254429K"),
("Maria","Lopez","Galvez","15221","21234123M");

insert into matricula (niaalumno, modulo, curso) 
values 
("15214","Programación",2021), 
("15214","Sistemas",2021),
("15214","Lenguaje de marcas",2021),
("15214","Bases de datos",2021),
("15214","FOL",2021),
("15214","Entornos",2021);
insert into matricula (niaalumno, modulo, curso) 
values 
("15216","Programación",2021), 
("15216","Sistemas",2021),
("15216","Lenguaje de marcas",2021),
("15216","Bases de datos",2021),
("15216","FOL",2021),
("15216","Entornos",2021);
/*auto_increment, le incrementa al valor mayor en 1, si no
se introduce ningún dato. hay que cambiar el campor de varchar por
un entero*/
alter table alumno modify nia varchar (5) auto_increment; /*no funciona con dato tipo texto
tiene que ser un dato de tipo numerico*/
alter table alumno modify nia int auto_increment;
/*no deja por que hay una foreing key,la  eliminamos*/
show create table matricula;
alter table matricula drop constraint matricula_ibfk_1;
alter table alumno modify nia int auto_increment;
/*modificar nia a entero en la otra tabla*/
alter table matricula modify niaalumno int;
/*recuperar la foreing key*/
alter table matricula add foreign key (niaalumno) references alumno(nia);
/*al poner el auto increment no es necesario poner el nia*/
insert into alumno 
(nombre, apellido1, nif)
values
("Alverto", "Suarez", "53312357R");
insert into alumno 
(nombre, apellido1, nia, nif)
values
("Julian", "Enrique", 1321, "51312657T");
/*show create table alumno, aparece el increment siguiente que va
a introducir*/
/*para el EXAMEN, antes de cualquier create table hay que poner el use
+ el lugar donde hay que crear la tabla*/
/*crear una tabla con los datos de otra tabla*/
use test;
desc world.city; /*consulta para ver que se puede copiar*/
/*comprobar que el comando funciona, y después de crea la tabla*/
select * from world.city where countrycode="ESP";
use test;
create table cityesp as
select * from world.city where countrycode="ESP";
/*no copia indices ni las keys*/
alter table cityesp modify id int primary key;
alter table cityesp modify id int auto_increment;
/*hacer una copia de country, de todos los paises europeos, pero que no
aparezcan todos los campos (esperanza de vida...*/
use test;
desc world.country; 
use test;
create table country as 
select Code, Name, Continent, Region, Population, LifeExpectancy 
from world.country where Continent="Europe";
/*comprobar que se ha copiado bien*/
use test;
show table;
desc country;
/*borrar las tablas cityesp y country y volver a crear*/
use test;
show table;
drop table cityesp;
drop table country;
/*recuperar la primarykey de ambas tablas*/
use test;
desc world.city;/*ver cual es primary key y auto_increment*/
alter table cityesp modify id int primary key;
alter table cityesp modify id int auto_increment;
desc cityesp;/*comprobar que se ha metido bien*/
desc world.country; 
alter table country modify Code char (3) primary key;
desc country;
/*la freing key tambien hay que recuperarla y ponerla en la nueva
tabla*/
show create table; /*vemos que campo es foreing key*/
/*poner foreing key, primero vemos las dos tablas*/
desc cityesp;
dec country;
/*o*/
show create table cityesp;
show create table country;
/*se buscan los campos que sean comunes en ambas tablas*/
alter table cityesp add  foreign key (countrycode) references
country(code);/*el campo countrycode es lo mismo que el campo code 
de la tabla country*/
/*de error porque tienen que ser del mismo tipo*/
show create table cityesp;
show create table country;
/*le falta que sea UTF-8, por eso da error, y hay que ponerlo así:*/
alter table country modify Code char(3) character set UTF8;
alter table cityesp add  foreign key (countrycode) references
country(code);
/*para que sirve esta foreing key: vamos a borrar españa
de la tabla, y no deja borrarlo porque hay ciudades que pertenecen 
a españa. la foerening key liga a las dos tablas con los dos campos
y por eso no se puede borrar el pais de la tabla country,
debido a las ciudades de las tabla cityesp se quedarían huérfanas.
lo mismo pasa si se quiere modificar este código*/
delete from country where Code="ESP";
/*cascade, decir que borre en cascada, es decir que borre el 
pais españa y todas sus ciudades. primero hay quitar las foreing key
y despues se elimina en cascada*/
alter table cityesp drop constraint cityesp_ibkf_1;
alter table cityesp add foreign key (CountryCode) references country(Code)
on delete cascade

/*crear tabla citysur con las ciudades de italia, españa, grecia y portugal
otra tabla country europa con los paises de europa con todos
los campos excepto gmp, gmp old y indepenYear*/

/*Ejercicios de clase*/
use test;
create table citysur as
select * from world.city where 
CountryCode = "ESP" or CountryCode ="ITA" 
or CountryCode ="PRT" or CountryCode ="GRC";

use test;
create table countryeuropa as
select Code, Name, Continent, Region, SurfaceArea,Population,LocalName,GovernmentForm,HeadOfState, Capital, Code2
from world.country where Continent ="Europe";

/*recuperar las primary keys incluido el auto_increment*/

use test;
alter table citysur modify id int primary key auto_increment;
alter table countryeuropa modify Code char(3) primary key;

/*configurar en la tabla citysur la foreing key adecuada*/
use test;
alter table citysur add foreign key (CountryCode) 
references countryeuropa (Code);
/*sale esto: Referencing column 'CountryCode' and referenced column 'Code' in 
foreign key constraint 'citysur_ibfk_1' are incompatible.*/
alter table countryeuropa modify CODE char(3) character set UTF8;
alter table citysur add foreign key (CountryCode) 
references countryeuropa (Code);

/*prueba de funcionamiento de la foreing key: 1)borrar españa
de countryesuropa*/
delete from countryeuropa where Code ="ESP";
/*sale esto: ERROR 1451 (23000): Cannot delete or update a parent row: 
a foreign key constraint fails (`test`.`citysur`, CONSTRAINT `citysur_ibfk_1` 
FOREIGN KEY (`CountryCode`) REFERENCES `countryeuropa` (`CODE`))*/
delete from countryeuropa where Code ="FRA";
/*SI deja borrarlo porque no hay ninguna ciudad del sur
referenciada en francia*/
update countryeuropa set code="ATI" where Name = "Italy";
/*no deja: ERROR 1451 (23000): Cannot delete or update a parent row: 
a foreign key constraint fails (`test`.`citysur`, CONSTRAINT `citysur_ibfk_1` FOREIGN KEY 
(`CountryCode`) REFERENCES `countryeuropa` (`CODE`))*/
delete from countryeuropa where Code ="ESP";
/*poner el codigo de pais KKK a madrid*/
use test;
update citysur set CountryCode="KKK" where Name="Madrid";
/*No deja:ERROR 1452 (23000): Cannot add or update a child row:
 a foreign key constraint fails (`test`.`citysur`, CONSTRAINT `citysur_ibfk_1` FOREIGN KEY (`CountryCode`) REFERENCES `countryeuropa` (`CODE`))*/
/*igual con francia*/
update citysur set CountryCode="DEU" where Name="Madrid";/*deja cambiarlo porque existe en la tabla*/
/*opcion cascade*/
alter table citysur drop constraint citysur_ibfk_1;/*borrar foreing key*/
show create table citysur;
alter table citysur add foreign key (CountryCode)
references countryeuropa(Code) on delete cascade on update cascade;    


























