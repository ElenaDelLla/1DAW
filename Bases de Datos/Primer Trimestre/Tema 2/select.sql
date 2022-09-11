select Name,Population from city where Name like "San%" 
and Population >1000000 and Population <2000000;
select Name,Population from city where Name like "New%" 
and Population >100000 and Population <400000;
select Name,Population,GovernmentForm from country


select Name,Population,GovernmentForm from country
where GovernmentForm like "%constitutional%" and Population >=1000000
and Population < 10000000;
  select Name,SurfaceArea,GNP from country
  where SurfaceArea >= 1000 and SurfaceArea< 10000
  and GNP >= 10000 and GNP< 40000;
  select CountryCode,Language,IsOfficial from countrylanguage
  where Language like "French" and IsOfficial >= 2 and IsOfficial < 40;
  select title,special_features,replacement_cost from film where
  special_features like "Trailers" and replacement_cost >= 5 and replacement_cost < 10;
  select title,rental_rate,replacement_cost from film
  where rental_rate >= 2 and rental_rate <4 and
  replacement_cost >=5 and replacement_cost <10;
  select rental_id,rental_date,return_date from rental
  where rental_date >= "2005-08-02" and rental_date < "2005-08-03" and
  return_date >= "2005-08-09";
  select name,address,country from customer_list where
  country like "%China%" and address like "%Parkway%";
  select title,price,length  from film_list where 
  price between 2 and 3 and length between 100 and 120 and 
  title like "M%";