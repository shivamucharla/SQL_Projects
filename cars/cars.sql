create schema cars;
use cars;
select * from cars;
--total cars
select COUNT(*) from cars;       #7927
--How many cars are available in 2023
select count(*) from cars where year =2023;     #6
--total cars in 2020,2021,2022
select count(*) from cars where year in (2020,2021,2022) group by year; 
--total cars by year wise
select year,count(*) from cars group by year;
select count(*) from cars where year = 2020 and fuel = 'Diesel'; #20
select count(*) from cars where year = 2020 and fuel = 'petrol'; #51

-total cars across all years with different fuel types
select year, count(*) from cars where fuel = 'petrol' group by         year;
select year, count(*) from cars where fuel = 'Diesel' group by         year;
select year, count(*) from cars where fuel = 'CNG' group by         year;
select year, count(*) from cars where fuel in ('petrol', 'Diesel', 'CNG')  group by year;

-years that has cars greater than 100
select year, count(*) from cars group by year having count(*) > 100;

-- total cars between 2015 and 2023
select count(*) from cars where year between 2015 and 2023;    #4124

---car details between 2015 and 2023
select * from cars where year  between 2015 and 2023; 


---END---

