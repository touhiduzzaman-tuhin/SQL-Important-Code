-- insert + null + update + delete + limit

-- insert

select * from customers;

insert into customers (customer_id, customer_name, contact_name, address, city, postal_code, country) values
(92, 'Touhiduzzaman Tuhin', 'Hasibul Shanto', '44/5 Monowar Place', 'Dhaka', '1205', 'Bangladesh');

select * from customers where customer_id = 92;

insert into customers (customer_name, city, country) values
('Shamim Sarkar', 'Pabna', 'Bangladesh'),
('AL Imran', 'Dehli', 'India');

select * from customers;

-- null

select * from customers where address is null;

select * from customers where address is not null;

-- update

update customers set contact_name = 'Shahed khan', city = 'Rangpur' where customer_id = 92;

select * from customers;

select count(country) from customers where country = 'Spain';

update customers set country = 'Bnagladesh' where country = 'Spain';

select count(country) from customers where country = 'Bnagladesh';

update customers set contact_name = 'juan' where country = 'Mexico';

select count(country) from customers where contact_name = 'juan';

select * from customers where contact_name = 'juan';

-- Exercise

-- update customers set city = 'olso';

update customers set city = 'olso' where country = 'Mexico';

select * from customers where country = 'Mexico';

update customers set city = 'olso', country = 'Norway' where customer_id = 32;

select * from customers where customer_id = 32;

-- delete

-- delete from customers

delete from customers where customer_id = 92;

select * from customers;

delete from customers where address is null;

select * from customers;

-- Exercise

delete from customers where country = 'Norway';

delete from customers;

-- limit

select * from customers;

select * from customers limit 5;

select * from customers where country = 'USA' limit 5;

select * from customers where country = 'Germany' limit 3;

































































