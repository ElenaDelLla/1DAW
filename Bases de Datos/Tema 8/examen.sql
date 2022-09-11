Descargar del aula virtual la BBDD NBA.sql 
y cargarla en en MySQL. Incluir la salida del comando DESC 
de la tabla carga_partidos

desc carga_partidos;
+------------------+-------------+------+-----+---------+-------+
| Field            | Type        | Null | Key | Default | Extra |
+------------------+-------------+------+-----+---------+-------+
| equipo_local     | varchar(20) | YES  | MUL | NULL    |       |
| equipo_visitante | varchar(20) | YES  | MUL | NULL    |       |
| puntos_local     | int         | YES  |     | NULL    |       |
| puntos_visitante | int         | YES  |     | NULL    |       |
| temporada        | varchar(5)  | YES  |     | NULL    |       |
+------------------+-------------+------+-----+---------+-------+
5 rows in set (0,00 sec)

Insertar, en la tabla partidos de la BBDD NBA, los datos de la 
tabla carga_partidos.

insert into partidos (equipo_local,equipo_visitante,puntos_local,puntos_visitante,temporada)
select equipo_local,equipo_visitante,puntos_local,puntos_visitante,temporada
from carga_partidos;

Insertar, en la tabla jugadores de la BBDD NBA, dos jugadores nuevos: 
"James Harden", 
de "5-9" pies y un peso de 200 libras, y "Ricky Rubio" con una altura 
de "5-7" pies y un peso de 170 libras

insert into jugadores (Nombre,Altura,Peso)
values ('James Harden','5-9',200), ('Ricky Rubio','5-7',170);

Insertar, en la tabla estadisticas, los datos de Ricky Rubio para 
la temporada "07/08". Por partido las estadisticas son 10,6 puntos, 
8.2 asistencias, 0,2 tapones y 4,2 rebotes.

select codigo
from jugadores
where Nombre = 'Ricky Rubio';

insert into estadisticas (jugador,temporada,Puntos_por_partido,Asistencias_por_partido,Tapones_por_partido,Rebotes_por_partido)
values ((select codigo
from jugadores
where Nombre = 'Ricky Rubio'),'07/08',10.6,8.2,0.2,4.2);

En la tabla jugadores actualizar la procedencia de los 
jugadores "Matt Barnes" y "Baron Davis" a "California".

select Nombre,Procedencia from jugadores where Nombre='Matt Barnes';

update jugadores set Procedencia = 'California' where Nombre='Matt Barnes';
update jugadores set Procedencia = 'California' where Nombre='Baron Davis';

En la tabla jugadores actualizar, en un solo comando, la procedencia de 
Ricky Rubio (Spain), su posición (G) y su equipo (Pacers)

select Procedencia, Posicion, Nombre_equipo from jugadores where Nombre = 'Ricky Rubio';

update jugadores set Procedencia = 'Spain', Posicion = 'G', Nombre_equipo = 'Pacers'
where Nombre = 'Ricky Rubio';

En la tabla equipos, actualizar el campo Division al 
valor "NorthEast" para los equipos de la Division "Atlantic".

select Division from equipos where Division = 'Atlantic';

update equipos set Division = 'NorthEast' where Division = 'Atlantic';

Eliminar, de la tabla partidos, todos los partidos de la temporada "98/99"

select temporada,codigo from partidos where temporada = '98/99';

delete partidos from partidos where temporada = '98/99';

Borrar las estadisticas de los jugadores que tengan menos de 
1 punto por partido y 1 asistencia por partido

select jugadores.Nombre,estadisticas.Puntos_por_partido,estadisticas.Asistencias_por_partido
from estadisticas, jugadores
where estadisticas.jugador = jugadores.codigo
and estadisticas.Puntos_por_partido < 1
and estadisticas.Asistencias_por_partido < 1;

delete estadisticas 
from estadisticas, jugadores
where estadisticas.jugador = jugadores.codigo
and estadisticas.Puntos_por_partido < 1
and estadisticas.Asistencias_por_partido < 1;

Utilizando las tablas jugadores y estadísticas eliminar las 
estadísticas de los jugadores con un peso inferior a 170 libras.

select jugadores.peso
from estadisticas, jugadores
where estadisticas.jugador = jugadores.codigo
and Peso < 170;

delete estadisticas
from estadisticas, jugadores
where estadisticas.jugador = jugadores.codigo
and Peso < 170;












