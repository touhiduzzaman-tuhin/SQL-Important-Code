-- Join

-- inner join

select * from customers;

select * from orders;

select * from shippers;

select distinct(shipper_id) from orders;

select
	a.order_id,
	a.order_date,
	b.customer_name
from orders as a
inner join customers as b
on a.customer_id = b.customer_id;


select 
	a.order_id,
	b.customer_name,
	c.shipper_name
from customers as b
inner join orders as a on a.customer_id = b.customer_id
inner join shippers as c on a.shipper_id = c.shipper_id;

-- left join

select
	a.customer_name,
	b.order_id
from customers as a
left join orders as b
on a.customer_id = b.customer_id
order by a.customer_name;


-- right join

select * from employees;

select * from orders;

select 
	a.order_id,
	b.first_name,
	b.last_name
from orders as a
right join employees as b
on a.employee_id = b.employee_id
order by a.order_id;

-- full join

select
	a.customer_name,
	b.order_id
from customers as a
full join orders as b
on a.customer_id = b.customer_id;


-- self join

select
	a.customer_name as customer_name_1,
	b.customer_name as customer_name_2,
	a.city
from customers as a, customers as b
where a.customer_id != b.customer_id and a.city = b.city
order by a.city;


-- union
select * from customers;

select city from suppliers;

select
	a.city,
	b.city
from customers as a
full join suppliers as b
on a.contact_name = b.contact_name;

select city from customers
union
select city from suppliers
order by city;

select city from customers
union all
select city from suppliers
order by city;


select city, country from customers where country = 'Germany'
union
select city, country from suppliers where country = 'Germany'
order by city;

select * from suppliers;

select 'Supplier', contact_name, city, country from suppliers;

select 'Customer' contact_name, city, country from customers;


select 'Customer' as Type, contact_name, city, country from customers
union
select 'Supplier', contact_name, city, country from suppliers;

















