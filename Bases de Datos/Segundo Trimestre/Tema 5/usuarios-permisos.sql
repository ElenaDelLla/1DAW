/*crear el usuario*/
create user usertest@localhost identified by 'Oracle.123';
/*localhost: solo se puede acceder desde el servidor (localmente) de la base de datos,
nosotros nos conectamos porque tenemos el ssh*/
‘%’: conectarse desde dos quieras, 
‘%´.com’ conectarse desde cualquier sitio que continue con un .com 
Ejemplo: ‘%.virgendelapaz.com

las mas habituales son ’localhost’ y %(siempre va entre comillas). es que se conecte dentro de la 
propia maquina.
% comodín, se puede conectar desde cualquier lugar
%.com 
Ejemplos:
create user local@localhost identified by ‘Oracle.123’;
create user remoto@´@´ identified by ‘Oracle.123’;
create user remoto2@ ´@´.com identified by ‘Oracle.123’;

Probarlo:
se conecta como siempre me conecto yo

¿que hacer con el usuario?

select current_user(); Para ver en que usuario estas y que permisos tiene.
Muy importante
select user, host from mysql.user; Lista de usuarios del sistema, solo lo 
puede ejercutar root 

asignar privilegios al usuario:

desde root:
grant all privileges on world.* to usertest@localhost;
privilegios para asignar:
1. Registros: select, update, insert, delete
2. Tablas: create (crea base de datos y tablas), drop(borrar tabla),
alter(modificar tabla), create view (vista, es una tabla que tiene por debajo un 
comando select que mira a otras tablas), create temporary tables (igual que las vistas
pero cuando se cierra se sesion se borra).
3. Usuarios: create user. Opcion: with grant option(se le habilita para dar permisos
a otros usuarios).

show grants all privileges on sakila.* to usertest@localhost;
show grants for usertest@localhost;/*Muestra los privilegios del usuario que lo ejecuta*/
grant select on sakila.* to usertest@localhost;/*se ejecuta en el nuevo usuario*/
revoke select on sakila.* from usertest@localhost; /*se ejecuta en root*/

ejercicio diapositivas:

create user basicuser@localhost identified by 'Oracle.123';
grant select on world.city to basicuser@localhost;
grant select on world.country to basicuser@localhost;
grant select on sakila.actor to basicuser@localhost;
grant select on sakila.film to basicuser@localhost;

show grants for basicuser@localhost;

revoke select on world.city from basicuser@localhost;
select user.host from mysql.user; /*root*/
drop user basicuser@localhost;
Crear el usuario “externo” que pueda conectarse desde 
cualquier lugar con los mismos permisos de root en las 
bases de datos importadas
create user externo@'%' identified by 'Oracle.123';
grant all on sakila.* to externo@'%';
grant all on employees.* to externo@'%';
grant all on logistics.* to externo@'%';

Crear el usuario “userworld” que tenga permiso para utilizar el comando
SELECT en todas las tablas de la base de datos WORLD y que pueda
acceder desde cualquier lugar
create user userworld@'%' identified by 'Oracle.123';
grant select on world.* to userworld@'%';

Crear el usuario “worldmaster” que tenga los mismos permisos que root
pero restringidos a la base de datos WORLD y acceso solo local
create user worldmaster@localhost identified by 'Oracle.123';
grant all privileges on world.* to worldmaster@localhost;

Crear el usuario “usersakila” que tenga permiso para utilizar el comando
SELECT en todas las tablas de la base de datos SAKILA y que puede
acceder desde cualquier lugar

create user usersakila@'%' identified by 'Oracle.123';
grant select on sakila.* to usersakila@'%';

Crear el usuario “sakilamaster” con los mismos permisos que root
restringidos a la base de datos SAKILA y acceso solo local

create user sakilamaster@localhost identified by 'Oracle.123';
grant all on sakila.* to sakilamaster@localhost;

Crear el usuario “userselect” con permiso de utilizar el comando SELECT en
las bases de datos WORLD y SAKILA.

create user userselect@'%' identified by 'Oracle.123';
grant select on sakila.* to userselect@'%';
grant select on world.* to userselect@'%';

Crear el usuario “userdesign” que pueda crear tablas, tablas temporales y
vistas así como alterarlas y borrarlas. En las bases de datos WORLD y SAKILA
y acceso solo local

create user userdesign@localhost identified by 'Oracle.123';
grant create, drop, alter,create view, create temporary tables, select
 on sakila.* to userdesign@localhost;
grant create, drop, alter,create view, create temporary tables, select
 on world.* to userdesign@localhost;

Crear el usuario “master” que pueda crear usuarios, alterarlos y borrarlos así
como asignar y quitar privilegios. Solo debe ser válido en el ámbito local

create user master@localhost identified by 'Oracle.123';
grant all privileges to master@localhost with grant;



Crear el usuario “baseuser” que tenga acceso desde cualquier lugar a las
tablas CITY y COUNTRY de la base de datos WORLD y las tablas FIM, ACTOR
y FILM_ACTOR de la base de datos SAKILA

create user baseuser@'%' identified by 'Oracle.123';
grant select on world.city to basicuser@'%';
grant select on world.country to basicuser@'%';
grant select on sakila.film to basicuser@'%';
grant select on sakila.actor to basicuser@'%';
grant select on sakila.film_actor to basicuser@'%';

Roles

Create role user; crear el rol
Grant select on world.* to user; dar privilegios
    select user, host from mysql.user; muy importante, salen roles, no usuarios
    desc mysql.user;
    asignar a un usuario
Create user basicuser@'%' identified by 'Oracle.123';
Grant user to basicuser@'%'; asignamos privilegio
Create user masteruser@localhost identified by 'Oracle.123';
Grant master to masteruser@localhost;

los roles hay que activarlos:
set role user (desde el usuario) tambien se puede con set role all;
desde root:
set default role all to basicuser@'%'; deja por defecto y no hay que activar privileges
cada vez que se inicia sesion
set default role user to basicuser@'%';

set role basic,advance, master: desde el usuario, master desactiva todos los 
roles, en este caso quita todos estos.

select current_role(); en el usuario, indica los roles activos



ejercicios:


Crear los siguientes roles:
Worldrole: select,update,insert,delete en las tablas de world.

create role worldrole;
grant select,update,insert,delete on world.* to worldrole;

Sakilarole: select, update,insert,delete en las tablas de sakila.
create role sakilarole;
grant select, update,insert,delete on sakila.* to sakilarole;

Basicrole: select en todas las tablas de las bases de datos importadas
create role basicrole;
grant select on world.* to basicrole;
grant select on sakila.* to basicrole;
grant select on logistics.* to basicrole;
grant select on employees.* to basicrole;

Masterrole: select, update, insert, delete en las tablas de las BBDD importadas
create role masterrole;
grant select, update, insert, delete on world.* to masterrole;
grant select, update, insert, delete on sakila.* to masterrole;
grant select, update, insert, delete on employees.* to masterrole;
grant select, update, insert, delete on logistics.* to masterrole;

Arquitecto: créate table, drop table, alter table en las tablas de las BBDD importadas
create role arquitecto;
grant create, drop, alter on world.* to arquitecto;
grant create, drop, alter on sakila.* to arquitecto;
grant create, drop, alter on employees.* to arquitecto;
grant create, drop, alter on logistics.* to arquitecto;


Grantrole: crear usuarios y dar permisos a estos usuarios
create role grantrole
grant all privileges on world.* to grantrole;
grant all privileges on sakila.* to grantrole;
grant all privileges on employees.* to grantrole;
grant all privileges on logistics.* to grantrole;

Creación del usuario basicuser con acceso desde cualquier lado.
Asignar el role basicrole por defecto.

create user basicuser@'%' identified by 'Oracle.123';
grant basicrole to basicuser@'%';
set default role basicrole to basicuser@'%';

Creación del usuario master de uso solo local. 
Asignar los roles worldrole y sakilarole por defecto.
Asignar también el role masterrole pero que no se active por defecto.

create user master@localhost identified by 'Oracle.123';
grant worldrole, sakilarole, masterrole to master@localhost;

Creación del usuario admin que tenga los roles masterrole y grantuser activos por defecto.
También tiene que tener el role arquitecto pero no activo por defecto.

create user admin@'%' identified by 'Oracle.123';
grant masterrole, grantrole, arquitecto to admin@'%';
set default role masterrole, grantrole to admin@'%';


select user, host from mysql.user; ver los usuarios






























