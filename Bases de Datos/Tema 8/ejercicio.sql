Importar el archivo BD04_CreaTablasTarea.sql. 
Enviar el resultado del comando SHOW FULL TABLES

show full tables;
+---------------------+------------+
| Tables_in_instituto | Table_type |
+---------------------+------------+
| ALUMNADO            | BASE TABLE |
| ALUMNADO_NUEVO      | BASE TABLE |
| CURSOS              | BASE TABLE |
| PROFESORADO         | BASE TABLE |
+---------------------+------------+

Insertar un registro nuevo en la tabla PROFESORADO. 
Los datos deben ser los mostrados en la figura

insert into PROFESORADO (Codigo,Nombre,Apellidos,DNI,Especialidad,
Fecha_Nac,Antiguedad)
values (1,'Nuria', 'Anero Gonzalez', '58328033X', 'Matematicas','1972/02/22',9);

Inserta varios registros más en la tabla PROFESORADO 
utilizando sentencias SQL. Los datos deben ser los 
mostrados en la figura. Los datos que 
aparecen en blanco no deben utilizarse en las sentencias.

insert into PROFESORADO (Codigo,Nombre,Apellidos,DNI,Especialidad,
Fecha_Nac,Antiguedad)
values (2, 'Maria Luisa','Fabre Berdun', '51083099F','Tecnologia',
'1975-03-31',4),(4,'Estefania','Fernandez Martinez','19964324W',
'Ingles','1973-06-22',5);

insert into PROFESORADO (Codigo,Nombre,Apellidos,Especialidad,
Fecha_Nac,Antiguedad)
values(3,'Javier','Jimenez Hernando','Lengua','1969-05-04',10);

insert into PROFESORADO (Codigo,Nombre,Apellidos)
values (5,'Jose M.','Anero Payan');

Modificar los registros de la tabla CURSOS para 
asignar a cada curso un profesor o profesora. 
El profesorado que debes asignar a cada curso es 
el mostrado en la figura.

select Cod_Profe from CURSOS where Codigo =1;
update CURSOS set Cod_Profe = 4 where Codigo =1;

select Cod_Profe from CURSOS where Codigo = 2;
update CURSOS set Cod_Profe = 2 where Codigo = 2;

select Cod_Profe from CURSOS where Codigo = 3;
update CURSOS set Cod_Profe = 2 where Codigo = 3;

select Cod_Profe from CURSOS where Codigo = 4;
update CURSOS set Cod_Profe = 1 where Codigo = 4;

select Cod_Profe from CURSOS where Codigo =1;
update CURSOS set Cod_Profe = 4 where Codigo =1;

select Cod_Profe from CURSOS where Codigo = 5;
update CURSOS set Cod_Profe = 1 where Codigo = 5;

select Cod_Profe from CURSOS where Codigo = 6;
update CURSOS set Cod_Profe = 3 where Codigo = 6;

select Cod_Profe from CURSOS where Codigo = 1;
update CURSOS set Cod_Profe = 1 where Codigo = 7;

Modificar el registro de la profesora "ESTEFANIA", 
usando sentencias SQL, y cambia su fecha de nacimiento 
a "22/06/1974" y la antigüedad a 4

select Fecha_Nac,Antiguedad from PROFESORADO where Nombre = 'Estefania';
update PROFESORADO set Fecha_Nac = '1974/06/22', Antiguedad = 4 
where Nombre = 'Estefania';

Modificar las antigüedades de todos los profesores y profesoras 
incrementándolas en 1 en todos los registros. Se debe hacer usando una sola 
sentencia SQL

select Antiguedad from PROFESORADO;
update PROFESORADO set Antiguedad = (Antiguedad+1);

Eliminar, de la tabla CURSOS, el registro del curso que tiene el código 6. 
Eliminar, de la tabla ALUMNADO, aquellos registros asociados al curso con código 3.

select Codigo,Nombre from CURSOS where Codigo = 6;
delete CURSOS from CURSOS where Codigo = 6;

select Codigo,Nombre from ALUMNADO where Codigo = 3;
delete ALUMNADO from ALUMNADO where Cod_Curso = 3;

Insertar los registros de la tabla ALUMNADO_NUEVO 
en la tabla ALUMNADO. Se debe hacer usando una sola sentencia SQL.

insert into ALUMNADO(Nombre, Apellidos, Sexo, Fecha_Nac)
select Nombre, Apellidos, Sexo, Fecha_Nac
from ALUMNADO_NUEVO;

En la tabla CURSOS, actualizar el campo Max_Alumn del registro 
del curso con código 2, asignando el valor correspondiente al número total 
de alumnos y alumnas que hay en la tabla ALUMNADO y que tienen asignado 
ese mismo curso.

select Max_Alumn from CURSOS where codigo = 2;

update CURSOS set Max_Alumn = (select count(*) from ALUMNADO where Cod_Curso=2)
where Codigo = 2;


Eliminar de la tabla ALUMNADO todos los registros asociados a los cursos 
que imparte la profesora cuyo nombre es "NURIA"

select PROFESORADO.nombre, ALUMNADO.Nombre
from PROFESORADO, ALUMNADO, CURSOS
where PROFESORADO.Codigo = CURSOS.Cod_Profe
and ALUMNADO.Cod_Curso = CURSOS.Codigo
and PROFESORADO.nombre = 'NURIA';

delete ALUMNADO 
from ALUMNADO, CURSOS, PROFESORADO
where CURSOS.codigo=ALUMNADO.Cod_Curso 
and PROFESORADO.Codigo=CURSOS.Cod_Profe
and PROFESORADO.nombre="NURIA";


















