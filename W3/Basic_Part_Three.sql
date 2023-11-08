-- min + max + count + avg + sum + like

-- min and max

select min(price) from products;

select max(price) from products;

select min(price) as samllest_price from products;

select max(price) as largest_price from products;

select category_id, product_name, price from products where category_id = 3;

select min(price) from products where category_id = 3;

-- count and avg and sum

select count(product_id) from products;

select count(category_id) from products;

select count(distinct category_id) from products;

select count(category_id) from categories;

select count(product_id) from products where category_id = 3;

select avg(price) from products;

select avg(price) from products where category_id = 5;

select sum(quantity) from order_details;

select * from order_details;

select * from order_details order by product_id;

select * from order_details where product_id = 5;

select sum(quantity) from order_details where product_id = 11;

-- like

select customer_name from customers;

select customer_name from customers where customer_name like 'A%';

select customer_name from customers where customer_name like '%a';

select customer_name from customers where customer_name like '%or%';

select customer_name from customers where customer_name like '_r%';

select customer_name from customers where customer_name like 'A__%';

select customer_name from customers where customer_name like 'B%p';

select customer_name from customers where customer_name not like 'A%';


-- wildcard

select city from customers where city like 'Ber%';

select city from customers where city like '%es%';

select city from customers where city like '_ondon%';

select city from customers where city like '_ondon';

select city from customers where city like 'L_n_on';

-- in

select * from customers where country in ('Germany', 'Spain', 'France');

select country from customers where country in ('Germany', 'Spain', 'France');

select country from customers where country in ('Germany', 'Bnagladesh', 'France');

select country from customers where country not in ('Germany', 'Spain', 'France');

select distinct country from suppliers;

select distinct country from customers;

select * from customers where country in (select country from suppliers);

select distinct country from customers where country in (select country from suppliers);

-- between

select * from products where price between 10 and 20;

select * from products where price not between 10 and 20;

select * from products where (price between 10 and 20) and (category_id not between 1 and 3);

select * from products where (price between 10 and 20) and (category_id not in(1, 2, 3));


-- Carnarvon Tigers and Mozzarella di Giovanni:

select * from products where product_name between 'Carnarvon Tigers' and 'Mozzarella di Giovanni' order by product_name;


-- Carnarvon Tigers and Chef Anton's Cajun Seasoning:

select * from products where product_name between 'Carnarvon Tigers' and 'Chef Antons Cajun Seasoning' order by product_name;

-- Carnarvon Tigers and Mozzarella di Giovanni:

select * from products where product_name not between 'Carnarvon Tigers' and 'Mozzarella di Giovanni' order by product_name;

select * from orders where order_date between '1996-07-01' and '1996-07-31';

-- alias

select customer_id as id, customer_name as name from customers;

select customer_name as customer, concat(address, postal_code, city, country) as address from customers;

select customer_name as customer, concat(address, ', ', postal_code, ', ', city, ', ', country) as address from customers;


select customer_name as customer, (address || ', ' || postal_code || ', ' || city || ', ' || country) as address from customers;

select o.order_id, o.order_date, c.customer_name
from customers as c, orders as o
where c.customer_id = o.customer_id and c.customer_name = 'Around the Horn';

















