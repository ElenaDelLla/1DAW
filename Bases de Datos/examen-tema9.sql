Crear un procedimiento que borre un empleado de la tabla employees indicando, como parámetro de entrada, su Id
El procedimiento debe comprobar que, el empleado, existe. 
Debe también mostrar un texto indicando que se ha ejecutado correctamente o si el empleado no existe.

create or replace procedure eliminar_empleado(id_empleado employees.id%type)
as  
cursor c1 is select id from employees where id = id_empleado;
variable_cursor c1%rowtype;
begin
open c1;
fetch c1 into variable_cursor;
if c1%NOTFOUND then
	dbms_output.put_line('No existe ningún empleado con ese ID');
else 
	close c1;
	delete from employees where employees.ID = id_empleado;
	dbms_output.put_line('Empleado eliminado correctamente');
end if;
end eliminar_empleado;
/


Crear un procedimiento que genere un informe sobre la tabla country mostrando el número de ciudades agrupadas por region. 
A continuación se mostrará el número total de países y la suma total de la población. 
Se deben mostrar encabezados indicando la información que viene a continuación.

create or replace procedure informePaises
as
cursor c1 is select count(*) as numeroCiudades, region from city, country 
where city.countryCode=country.code group by region;
v_cursor c1%rowtype;
cursor c2 is select sum(POPULATION) as suma, count(*) as numero from country;
v2_cursor c2%rowtype;
begin
open c1;
dbms_output.put_line(rpad('NumCiudades',30,' ')||rpad('Region',30,' '));
loop
	fetch c1 into v_cursor;
	exit when c1%NOTFOUND;
	dbms_output.put_line(rpad(v_cursor.numeroCiudades,30,' ')||rpad(v_cursor.region,30,' ') );
end loop;
close c1;
open c2;
dbms_output.put_line(rpad('PoblacionTotal',30,' ')||rpad('NumPaises',30,' '));
loop
	fetch c2 into v2_cursor;
	exit when c2%NOTFOUND;
	dbms_output.put_line(rpad(v2_cursor.suma,30,' ')||rpad(v2_cursor.numero,30,' ') );
end loop;
close c2;
end informePaises;
/


Basada en la table employees, crear una función que tome, como parámetro de entrada,
 el salario de un empleado y, como salida, el porcentaje respecto el mínimo 
 (salario dividido por el mínimo de todos los salarios).
 Limitar el número de decimales mostrados.

create or replace function porcentaje_salario(salario employees.salary%type)
return number
as 
resultado number;
minimo number;
begin
select MIN(salary) into minimo from employees;
resultado := salario/minimo;
return (round(resultado,2));
end porcentaje_salario;
/

Crear la siguiente tabla en la base de datos.
A continuación crear un trigger que inserte un registro en esta tabla cuando se borra un registro en la tabla employees.

create table reg_delete (
    ACTION VARCHAR2(10),
    EVENT_TIME TIMESTAMP,
    ID VARCHAR2(45),
    NAME VARCHAR2(50),
    SALARY NUMBER(38)
);

create or replace trigger borrar_emple
before delete on EMPLOYEES
for each row  
begin
insert into reg_delete values ('delete', sysdate(), :old.ID, :old.NAME,
									:old.SALARY);
end borrar_emple;
/
