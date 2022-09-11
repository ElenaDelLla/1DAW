create database veterinario;
	use veterinario;
create table mascotas (Id int primary key auto_increment,
Nombre varchar(20) not null, 
FNacimiento date not null,
Especie varchar(20) not null,
Raza varchar(20) default ""
);
alter table mascotas add Peso decimal(3,1);
alter table mascotas modify Especie varchar(20) not null;
	use veterinario;
create table vacunas (Mascota int,
Fecha date not null,
Tipo varchar(20),
Notas varchar(40) default "");
alter table vacunas modify Tipo varchar(20)not null;
	use veterinario;
create table visitas (Mascota int,
Fecha date,
veterinario varchar(20),
Diagnostico varchar(100),
Notas varchar(50));
alter table visitas modify mascota int default "";
alter table visitas modify Fecha date not null;
alter table visitas modify Veterinario varchar(20) not null;
alter table visitas modify Diagnostico varchar (100) default "";
alter table visitas modify Notas varchar(50) default "";
	use veterinario;
alter table vacunas add foreign key (mascota) references mascotas (ID);
 	use veterinario;
 alter table visitas add foreign key (mascota) references mascotas(Id);
 	use veterinario;
 create index nombreindex on mascotas(nombre);
 	use veterinario;
 create table countrylanguage as 
 select * from world.countrylanguage where Percentage >5;
 desc world.countrylanguage;
 	use veterinario;
 create table country as 
 select Code,Name,Continent,Region from world.country;
 desc world.country;
 	use veterinario;
 alter table country modify Name char(52) unique key;
 alter table country modify Code char(3) primary key;
 alter table country modify Code char(3) character SET utf8;
 
 	use veterinario;
alter table 
 alter table countrylanguage add foreign key (CountryCode) references country(Code)
 on delete cascade on update cascade;



















