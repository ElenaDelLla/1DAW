create database examen;
	use examen;
create table vehiculos (matricula varchar(7), marca varchar(20),
modelo varchar(20), contrato datetime);
alter table vehiculos modify marca varchar(20) not null;
alter table vehiculos modify modelo varchar(20) not null;
alter table vehiculos modify contrato datetime not null;
alter table vehiculos modify matricula varchar (9) primary key;
 	use examen;
 create table conductores (nif varchar(9) primary key, nombre varchar(40) not null,
 matricula varchar(7) not null, direccion varchar(60)default "", 
 telefono varchar(12) default "",
 email varchar(60) default "");
 	use examen;
alter table conductores  add foreign key (matricula) references vehiculos(matricula);
	use examen;
alter table conductores modify email varchar(60) unique key not n;
	use examen;
alter table vehiculos modify modelo varchar(30) not null;
alter table conductores modify nombre varchar(50) not null;
	use examen;
create index nombreindex on conductores(nombre);
	use examen;
create table customer as 
select customer_id,first_name,last_name,email from sakila.customer;
	use	 examen;
create table customer_list as 
select ID,name,address,`zip code`,phone from sakila.customer_list;
	use examen;
alter table customer modify customer_id smallint  primary key;
alter table customer modify email varchar (50) unique key not null;
	use examen;
alter table customer_list modify ID smallint not null;
alter table customer_list add foreign key (ID) references customer (customer_id) on delete cascade on update cascade;
alter table customer_list drop constraint customer_list_ibfk_1;





