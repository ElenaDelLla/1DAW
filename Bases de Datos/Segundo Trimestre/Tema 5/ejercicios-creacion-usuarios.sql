Crear el usuario “externo” que pueda conectarse desde cualquier lugar 
con los mismos permisos de root en las bases de datos importadas

create user externo@'%' identified by 'Oracle.123';
grant all privileges on world.* to externo@'%';
grant all privileges on sakila.* to externo@'%';
grant all privileges on logistics.* to externo@'%';
grant all privileges on employees.* to externo@'%';

Crear el usuario “userworld” que tenga permiso para utilizar el comando SELECT 
en todas las tablas de la base de datos WORLD y que pueda acceder desde 
cualquier lugar.

create user userworld@'%' identified by 'Oracle.123';
grant select on world.* to userworld@'%';

Crear el usuario “worldmaster” que tenga los mismos permisos 
que root pero restringidos a la base de datos WORLD y acceso solo local.

create user worldmaster@localhost identified by 'Oracle.123';
grant all privileges on world.* to worldmaster@localhost;

Crear el usuario “usersakila” que tenga permiso para utilizar el comando SELECT 
en todas las tablas de la base de datos SAKILA y que puede acceder desde cualquier 
lugar

create user usersakila@'%' identified by 'Oracle.123';
grant select on sakila.* to usersakila@'%';

Crear el usuario “sakilamaster” con los mismos permisos que root restringidos a la 
base de datos SAKILA y acceso solo local

create user sakilamaster@localhost identified by 'Oracle.123';
grant all privileges on sakila.* to sakilamaster@localhost;

Crear el usuario “userselect” con permiso de utilizar el comando SELECT en las 
bases de datos WORLD y SAKILA.

create user userselect@'%' identified by 'Oracle.123';
grant select on world.* to userselect@'%';
grant select on sakila.* to usersakila@'%';

Crear el usuario “userdesign” que pueda crear tablas, tablas temporales y vistas así 
como alterarlas y borrarlas. En las bases de datos WORLD y SAKILA y acceso solo local

create user userdesign@localhost identified by 'Oracle.123';
grant create, create temporary tables, create view, drop, alter on world.* to userdesign@localhost;
grant create, create temporary tables, create view, alter, drop on sakila.* to userdesign@localhost;

Crear el usuario “master” que pueda crear usuarios, alterarlos y borrarlos así como 
asignar y quitar privilegios. 
Solo debe ser válido en el ámbito local

create user master@localhost identified by 'Oracle.123';
grant create user on *.* to master@localhost with grant option;

Crear el usuario “baseuser” que tenga acceso desde cualquier lugar a las tablas CITY 
y COUNTRY de la base de datos WORLD y las tablas FIM, ACTOR y FILM_ACTOR de la base 
de datos SAKILA

create user baseuser@'%' identified by 'Oracle.123';
grant select on world.city to baseuser@'%';
grant select on world.country to baseuser@'%';
grant select on sakila.fim to baseuser@'%';
grant select on sakila.actor to baseuser@'%';
grant select on sakila.film_actor to baseuser@'%';


/*Roles*/

Crear los siguientes roles:

Worldrole: select,update,insert,delete en las tablas de world

create role worldrole;
grant select, update, insert, delete on world.* to worldrole;

Sakilarole: select, update,insert,delete en las tablas de sakila

create role sakilarole;
grant select, update, delete on sakila.* to sakilarole;

Basicrole: select en todas las tablas de las bases de datos importadas

create role basicrole;
grant select on world.* to basicrole;
grant select on sakila.* to basicrole;
grant select on employees.* to basicrole;
grant select on logistics.* to basicrole;

Masterrole: select, update, insert, delete en las tablas de las BBDD importadas

create role masterrole;
grant select, update, insert, delete on world.* to masterrole;
grant select, update, insert, delete on sakila.* to masterrole;
grant select, update, insert, delete on employees.* to masterrole;
grant select,update, insert, delete on logistics.* to masterrole;

Arquitecto: créate table, drop table, alter table en las tablas de las BBDD importadas

create role arquitecto;
grant drop, alter on world.* to arquitecto;
grant drop, alter  on sakila.* to arquitecto;
grant drop, alter on employees.* to arquitecto;
grant drop, alter on logistics.* to arquitecto;

Grantrole: crear usuarios y dar permisos a estos usuarios

create role grantrole;
grant create user on *.* to grantrole with grant option;

Creación del usuario basicuser con acceso desde cualquier lado. 
Asignar el role basicrole por defecto.

grant basicrole to baseuser@'%';
set default role basicrole to baseuser@'%';

Creación del usuario master de uso solo local. 
Asignar los roles worldrole y sakilarole por defecto. 
Asignar también el role masterrole pero que no se active por defecto

grant worldrole, sakilarole, masterrole to master@localhost;
set default role worldrole, sakilarole to master@localhost;

Creación del usuario admin que tenga los roles masterrole y grantuser 
activos por defecto. 
También tiene que tener el role arquitecto pero no activo por defecto.

create user admin@'%' identified by 'Oracle.123';
grant masterrole, grantuser, arquitecto to admin@'%';
set default role masterrole, grantuser to admin@'%';

























