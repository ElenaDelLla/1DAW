create database examen;
	use examen;
create table lideres 
(Id int, nombre varchar(20),apellidos varchar (40),partId int);
alter table lideres modify Id int primary key auto_increment; 
alter table lideres modify nombre varchar(20) not null;
alter table lideres modify apellidos varchar(40) not null;
alter table lideres modify partId int not null;
	use examen;
create table partidos 
(Id int, Nombre varchar(20) not null, Siglas varchar(10) default "");
alter table partidos modify Id int primary key auto_increment;
	use examen;
alter table lideres modify nombre varchar(30) not null;
desc lideres;
alter table partidos modify Siglas varchar(5) default "";
desc partidos;
	use examen;
alter table partidos modify Siglas varchar(5) unique key not null default""; 
/*clave secundaria obligatoria*/
	use examen;
alter table lideres add foreign key (partId) references partidos(Id);
	use examen;
create table countryeu as 
select Code,Name,Continent,Region,SurfaceArea,Population,GNPOld,
LocalName,GovernmentForm,HeadOfState,Capital,Code2
from world.country where Continent ="Europe";
	use examen;
create table citysur as 
select * from world.city where CountryCode = "ESP" or CountryCode ="ITA" 
or CountryCode ="PRT" or CountryCode ="GRC";
	use examen;
desc countryeu;
desc world.country;
alter table countryeu modify Code char (3) primary key;
desc citysur;
desc world.city;
alter table citysur modify ID int primary key auto_increment;
	use examen;
alter table citysur add foreign key (CountryCode) references countryeu(Code)
on delete cascade;
alter table countryeu modify Code char(3) character set UTF8;
	use examen;
create index distritoindex on citysur(district); 





















