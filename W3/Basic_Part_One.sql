-- select

select * from customers;

select city from customers;

select country from customers;

select customer_name, city from customers;

-- distinct

select distinct country from customers;

select count(country) from customers;

select count(distinct country) from customers;


-- where

select * from customers where country = 'Mexico';

select * from customers where customer_id = 1;

select * from products where price = 18;

select * from products where price > 30;

select * from products where price < 30;

select * from products where price >= 30;

select * from products where price <= 30;

select * from products where price != 30;


-- and or not

select * from customers;

select * from customers where country = 'Germany' and city = 'Berlin';

select * from customers where city = 'Berlin' or city = 'München';

select * from customers where country = 'Germany' or country = 'Spain';

select * from customers where country = 'Germany';

select * from customers where country = 'Germany' and (city = 'Berlin' or city = 'München');

select * from customers where not country = 'Germany' and not country = 'USA';

select * from customers where not(country = 'Germany' or country = 'USA');




-- Exercise

select * from customers where city = 'Berlin';

select * from customers where not city = 'Berlin';

select * from customers where customer_id = 32;

select * from customers where city = 'Berlin' and postal_code = '12209';

select * from customers where city = 'Berlin' or city = 'London';


-- order by

select * from customers order by customer_id;

select * from customers order by customer_name;

select * from customers order by country;

select * from customers order by customer_name desc;

select * from customers order by country desc;

select * from customers order by country, customer_name;

select customer_name, country from customers order by country, customer_name;

select customer_name, country from customers order by customer_name, country;

select customer_name, country from customers order by country asc, customer_name desc;

select customer_name, country from customers order by country desc, customer_name asc;

-- Exercise

select * from customers order by city;

select * from customers order by city desc;

select * from customers order by country, city;









