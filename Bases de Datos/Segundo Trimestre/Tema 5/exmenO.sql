create role proyecto;
grant select, insert, update on world.* to proyecto;
grant select, insert, update on sakila.* to proyecto;

create role admin;
grant select, insert, delete, update on employees.* to admin;
grant select, insert, delete, update on logistics.* to admin;

create role operador;
grant select, insert, update,delete on world.* to operador;
grant select, insert, update, delete on sakila.* to operador;

create role manager;
grant create, create view, drop, alter on world.* to manager;
grant create, create view, drop, alter on sakila.* to manager;
grant create, create view, drop, alter on employees.* to manager;
grant create, create view, drop, alter on logistics.* to manager;

create user pramirez@'%' identified by 'Oracle.123';
grant proyecto to pramirez@'%';
set default role proyecto to pramirez@'%';
create user lsanchez@'%' identified by 'Oracle.123';
grant proyecto to lsanchez@'%';
set default role proyecto to lsanchez@'%';

create user jramirez@localhost identified by 'Oracle.123';
grant proyecto, operador to jramirez@localhost;
set default role operador to jramirez@localhost;

create user jmaroto@localhost identified by 'Oracle.123';
grant admin, manager to jmaroto@localhost;
set default role admin to jmaroto@localhost;

grant create user on *.* to jramirez@localhost with grant option;  

mysqldump -u root -p sakila customer customer_list> tablasSakila.sql

















