-- group by 

select customer_id, customer_name, country from customers;

select customer_id, country from customers;

select distinct country from customers;

select distinct customer_id from customers;

select country, count(customer_id) from customers group by country;

select country, count(customer_id) as "total_customer" from customers group by country order by "total_customer" desc;

select * from orders;

select * from shippers;

select
	a.shipper_name,
	count(b.shipper_id)
from orders as b
left join shippers as a
on a.shipper_id = b.shipper_id
group by a.shipper_name
order by a.shipper_name;

-- having

select country, count(customer_id) from customers group by country having count(customer_id) > 5;


select country, count(customer_id) as "total_customer" from customers
group by country having count(customer_id) > 5 order by total_customer desc;

select * from customers where country = 'USA' order by customer_id;

select * from customers where customer_id = 32;


select * from orders;

-- order_id , customer_id, employee_id, order_id, shipper_id

select * from employees;

select
	a.first_name,
	a.last_name,
	count(b.employee_id) as "total_employee"
from orders as b
left join employees as a
on a.employee_id = b.employee_id
group by a.first_name, a.last_name
order by total_employee desc;

select * from employees;

select
	a.first_name,
	a.last_name,
	count(b.employee_id) as "total_customers"
from employees as a
left join orders as b
on a.employee_id = b.employee_id
group by a.first_name, a.last_name
having count(b.employee_id) > 10
order by total_customers desc
limit 5;

select
	a.last_name,
	count(b.employee_id) as "total_customer"
from employees as a
left join orders as b
on a.employee_id = b.employee_id
group by a.last_name
having count(b.employee_id) > 25 and (a.last_name = 'Davolio' or last_name = 'Fuller');











































































