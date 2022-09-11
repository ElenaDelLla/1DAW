exportacion:
desdes ssh:

mysqldump -u root -p world  > world.sql lo guarda en el fichero y sustituye lo que haya
mysqldump -u root -p world  >> world.sql añado al fichero

tablas de una base de datos:

mysqldump -u root -p database_name table_name_1 table_name_2 table_name_3 > tablas.sql

comprobar que se ha exportado bien:
more + nombre fichero;

Importacion(Entramos con el usuario root):

pasar con filezilla el archivo a ubuntu
Source + nombre BBDD
drop database_name.sql;
create database_name;
use database_name;