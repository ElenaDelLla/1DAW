/* Base de datos world, country poner cuantos numero de paises por forma de gobierno, 
ordenador por el numero de paises de menor a mayor */

/* 1 --> tiene que haber lo mismo */
select GovernmentForm
from country
group by GovernmentForm;

/* 2 --> luego se añaden las fucniones */

select GovernmentForm, count(*)
from country
group by GovernmentForm
order by count(*);

/* Countrylanguage, de cada idioma, 
en cuantos paises se habla y la media del porcentaje */

select language, count(*), avg(Percentage)
from countrylanguage
group by language
order by count(*);


/* Countrylanguage, de cada idioma que sea oficial, 
en cuantos paises se habla y la media del porcentaje */

select language, count(*), avg(Percentage)
from countrylanguage
where IsOfficial = "T"
group by language
order by count(*);


/* lenguaje superior al 50% */ 

select language, count(*), avg(Percentage)
from countrylanguage
where  Percentage > 50 /* este campo no debe aparecer 
en el select ni aunque esté en el group by --> la CONDICION 
no debe aparecer en el select ni en el group by */ 
group by language
order by count(*);

/* para cada idioma, cuantos paises lo hablan 
y cuanto suman sus poblaciones */

select language, count(*), sum(population)
from countrylanguage, country
where country.code = countrylanguage.CountryCode
group by language
order by sum(population);

select language, count(*), sum(percentage*population/100) /* si 
tibetano se habla solo en un 1% en china, habrá que multplicarlo 
por la poblacion de china */
from countrylanguage, country
where country.code = countrylanguage.CountryCode
group by language
order by sum(percentage*population/100);