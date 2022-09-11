funciones:

									count()
select count(*)
from city;
/*indica el numero de registros que tiene la tabla*/

select count(name)
from city;
/*indica el numero de nombres de ciudades. cuenta cantiad en horizontal*/

select count(*)
from city
where countryCode='ESP';
/*indica el numero en horizontal que cumple esa condicion*/

/*Agrupa todas entradas por countrycode y cuenta*/
select countryCode count(*)
from city
group by countryCode;

									MAX()
/*Valor maximo de cada grupo*/
Poblacion maxima de un pais:
select country.name, MAX(city.population)
from city, country
where city.countryCode = country.code
group by country.name
order by country.name;	
									SUM()

Sumar para cada pais la poblacion de las ciudades:
select country.name, SUM(city.population)
from city, country
where city.countryCode = country.code
group by country.name
order by country.name;

									AVG()

poblacion media de las ciudades de un pais:
select country.name, AVG(city.population)
from city, country
where city.countryCode = country.code
group by country.name
order by country.name;

/*Combinacion de funciones*/
select country.name, COUNT(*), SUM(city.population), AVG(city.population)
from city, country
where city.countryCode = country.code
group by country.name
order by country.name;

select country.name, MAX(city.population), MIN(city.population)
from city, country
where city.countryCode = country.code
group by country.name
order by country.name;




















