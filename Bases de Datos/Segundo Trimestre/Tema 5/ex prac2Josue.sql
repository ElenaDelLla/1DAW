create role basic;
grant select on world.* to basic;
grant select on sakila.* to basic;
grant select on employees.* to basic;
grant select on logistics.* to basic;

create role advance;
grant select, insert, update on world.* to advance;
grant select, insert, update on sakila.* to advance;
grant select, insert, update on employees.* to advance;
grant select, insert, update on logistics.* to advance;

create role erase;
grant delete on world.* to erase;
grant delete on sakila.* to erase;
grant delete on employees.* to erase;
grant delete on logistics.* to erase;

create role arquitecto;
grant create, drop, alter on *.* to arquitecto;

create user appread@'%' identified by 'Oracle.123';
grant basic to appread@'%';
set default role basic to appread@'%';

create user appmod@'%' identified by 'Oracle.123';
grant basic to appmod@'%';
grant advance to appmod@'%';
set default role basic, advance to appmod@'%';

create user appfix@localhost identified by 'Oracle.123';
grant basic to appfix@localhost;
grant advance to appfix@localhost;
set default role basic, advance to appfix@localhost;

create user master@localhost identified by 'Oracle.123';
grant basic to master@localhost;
grant advance to master@localhost;
grant erase to master@localhost;
grant arquitecto to master@localhost;
set default role basic, advance to master@localhost;

drop user appread, appmod;

grant create user on *.* to master@localhost with grant option;

select user, host from mysql.user;

show grants for master@localhost;

