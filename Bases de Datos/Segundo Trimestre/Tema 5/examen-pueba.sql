Crear un role "basic" con permiso de lectura 
en todas las bases de datos importadas.

create role basic;
grant select on world.* to basic;
grant select on sakila.* to basic;
grant select on employees.* to basic;
grant select on logistics.* to basic;

Crear un role "advance" con permiso de lectura, escritura y modificación 
de registros en todas las bases de datos importadas

create role advance;
grant select, update, insert on world.* to advance;
grant select, update, insert on sakila.* to advance;
grant select, update, insert on employees.* to advance;
grant select, update, insert on logistics.* to advance;

Crear un role "erase" con permiso para borrar registros 
en todas las bases de datos importadas.

create role erase;
grant delete on world.* to erase;
grant delete on sakila.* to erase;
grant delete on employees.* to erase;
grant delete on logistics.* to erase;

Crear el role "arquitecto" con permiso para crear tablas;
bases de datos; borrarlas y modificarlas

create role arquitecto;
grant create, drop, alter on *.* to arquitecto;

Crear un usuario appread al que se asigna por defecto 
el role "basic".

create user appread@'%' identified by 'Oracle.123';
grant basic to appread@'%';
set default role basic to appread@'%';

Crear un usuario appmod al que se asigna por 
defecto los roles "basic" y "advance"

create user appmod@'%' identified by 'Oracle.123';
grant basic, advance to appmod@'%';
set default role basic, advance to appmod@'%';


Crear un usuario appfix de acceso solo local al que se 
asigna por defecto los roles "basic" y "advance". 
También el role "erase" pero no por defecto.

create user appfix@localhost identified by 'Oracle.123';
grant basic, advance, erase, to appfix@localhost;
set default role basic, advance to appfix@localhost;


Crear el usuario master con acceso solo local con todos los 
roles asignados pero solo "basic" y "advance" por defecto

create user master@localhost identified by 'Oracle.123';
grant basic, advance, erase, arquitecto to master@localhost;
set default role basic, advance to master@localhost;

Borrar los usuarios appread y appmod;.
drop user appread;
drop user appmod;

Añadir al usuario master el permiso para crear, borrar y modificar
usuarios así como asignarles permisos.

grant create user on *.* to master@localhost with grant option;

Mostrar la lista de los usuarios creados en el sistema.
select user, host from mysql.user;

Mostrar los permisos asignados al usuarios master

show grants for master@localhost;

roles creados:

select user, host, authentication_string from mysql.user where 
authentication_string = "";







