select Name,Population FROM city WHERE CountryCode="ESP";  Muestra el nombre y la población de España.
information_schema (y le sigue:)
select table_name, table_schema FROM tables WHERE table_schema = “world”

ejercicio clase 27/sep;

select Name,Population,CountryCode FROM city WHERE CountryCode = "FRA";
DESC City
select Name,Population FROM city WHERE Population<1000000;
DESC countrylanguage;
select CountryCode,Language FROM countrylanguage WHERE Language = "Italian";
DESC countrylanguage;
select CountryCode,Language,Percentage FROM countrylanguage WHERE Percentage > "90%";
select CountryCode,Language,IsOfficial FROM countrylanguage WHERE IsOfficial = "T";

otra tabla

DESC country;
select Name,Population,Continent FROM country WHERE Continet="europe";

select Name,Population,SurfaceArea FROM country WHERE SurfaceArea<100;
select Name,Population FROM country WHERE Population>100000000;
select Name,Population,LifeExpectancy FROM country WHERE LifeExpectancy>80;
select Name,Population,LifeExpectancy FROM country WHERE LifeExpectancy= "ESP";
select Name,GNP FROM country WHERE Name="Spain";
select Name,GNP	FROM country WHERE GNP > 100;
select Name,HeadOfState,GovernmentForm FROM country WHERE Name="Spain";

GNP producto interior bruto
select Name,GNP,GovernmentForm FROM country WHERE GNP>300000;

select name,population FROM county WHERE("madrid","sevilla","murcia");
select name,population FROM country WHERE ("spain","france","portugal");
select name,population FROM country WHERE ("Europe","Africa");

Mostrar, en la tabla countrylanguage, los lenguajes y códigos de país, 
hablados en un porcentaje superior al 99%
select CountryCode, Language FROM countrylanguage WHERE Percentage >99;