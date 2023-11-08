select * from customer;

select * from product;

select * from sales;

-- in

select *
from customer
where city = 'Philadelphia' or city = 'Seattle';

select *
from customer
where city in ('Philadelphia', 'Seattle');


-- between

select *
from customer
where age >= 20 and age <= 30;

select *
from customer
where age between 20 and 30;

select *
from customer
where age not between 20 and 30;

select *
from sales
where ship_date between '2015-04-01' and '2016-04-01';

-- like

select *
from customer
where customer_name like 'J%';


select *
from customer
where customer_name like '%Nelson%';

select *
from customer
where customer_name like '____ %';

select distinct city
from customer
where city not like 'S%';

-- Exercise


select distinct city, region
from customer
where region in ('South', 'East');

select *
from sales
where sales between 100 and 500;

select customer_name
from customer
where customer_name like '% ____';

-- comments

-- single line comment

/*
multi line comment
first line
second line
*/

-- order by

select *
from customer
where state = 'California'
order by customer_name;

select *
from customer
order by 2 asc;

select *
from customer
order by age desc;

select *
from customer
where state = 'California'
order by customer_name desc;

select *
from customer
order by city asc, customer_name desc; 

select *
from customer
where age >= 25
order by city desc, customer_name asc;

-- limit

select *
from customer
where age >= 25
order by city asc, customer_name desc
limit 8;


select *
from customer
where age >= 25
order by age desc
limit 8;


select * from customer where age > 25 order by age asc limit 8;


-- Exercise


select * from sales;


select * from sales where discount > 0 order by discount desc;

select * from sales where discount > 0 order by discount desc limit 10;


-- as

select customer_id as "Serial_No", customer_name as name, age as "Customer_Age" from customer;

-- count

select count(*) from sales;

select count(*) as "Total_Count" from sales;

select * from sales;

select count(order_line) as "Number of Product Ordered", count(distinct order_id) as "Number of Order"
from sales where customer_id = 'CG-12520';

-- sum

select * from sales;

select sum(Profit) from sales;

select sum(Profit) as "Total Profit" from sales;

select sum(quantity) as "Total Quantity" from sales where product_id = 'FUR-TA-10001539';

-- average

select avg(age) from customer;

select avg(age) as "Average Customer Age" from customer;

select avg(sales * .10) as "Average Commision Value" from sales;

-- min and max

select sales from sales where order_date between '2015-06-01' and '2015-06-30' order by sales asc;

select min(sales) as "Minimum Salse Value" from sales where order_date between '2015-06-01' and '2015-06-30';  

select sales from sales where order_date between '2015-06-01' and '2015-06-30' order by sales desc;

select max(sales) as "Maximum Sales Value" 
from sales 
where order_date between '2015-06-01' and '2015-06-30';


-- Exercise

select sum(sales) as "Sum of Sales" from sales;

select count(*) from customer where age between 20 and 30;

select avg(age) as "Average Age in East" from customer where region = 'East';

select min(age) as "Minimum Age in Philadelphia" from customer where city = 'Philadelphia';

select max(age) as "Maximum Age in Philadelphia" from customer where city = 'Philadelphia';


-- group by

select region, count(customer_id) as "Customer Count" from customer group by region;

select region, avg(age) as "Average Age", count(customer_id) as "Customer Count" from customer group by region;

select region, state, avg(age), count(customer_id) from customer group by region, state;

select region, state, count(customer_id) from customer group by region , state;

select region, state, count(customer_id) from customer group by region, state order by count desc; 

select product_id, sum(quantity) as product_quantity from sales group by product_id order by product_quantity desc;;



select customer_id,
min(sales) as "Minumum Sales",
max(sales) as "Maximum Sales",
avg(sales) as "Average Sales",
sum(sales) as Total_Sales
from sales
group by customer_id
order by Total_Sales desc
limit 5;



-- having

select region, count(customer_id) from customer group by region having count(customer_id) > 200;

select region, count(customer_id) from customer where customer_name like 'A%' group by region;

select region, count(customer_id) from customer where customer_name like 'A%' group by region having
count(customer_id) > 15;


-- Exercise

select product_id,
max(sales) as "Maximum Sales",
min(sales) as "Minimum Sales",
avg(sales) as "Average Sales",
sum(sales) as Total_Sales,
sum(quantity) as total_quantity,
count(order_id) as "Total Order"
from sales
group by product_id
order by total_quantity desc;


select product_id, sum(quantity) as "Product Quantity" from sales 
group by product_id having sum(quantity) > 10;

-- Case

select age, case
				when age < 30 then 'Young'
				when age > 60 then 'Senior'
				else 'Middle Age'
				end as Age_Category
from customer;


-- creating sales table of 2015

create table sales_2015 as select * from sales where ship_date between '2015-01-01' and '2015-12-31';

select count(*) from sales_2015;

select * from sales_2015;

select count(distinct customer_id) from sales_2015;


-- creating table between age 20 to 60 from customer table

create table customer_20_60 as select * from customer where age between 20 and 60;

select * from customer_20_60;

select count(*) from customer_20_60;

-- join
-- inner join

select customer_id from sales_2015 order by customer_id;

select customer_id from customer_20_60 order by customer_id;


select
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
inner join customer_20_60 as b
on a.customer_id = b.customer_id
order by customer_id;



-- left join

select customer_id from sales_2015 order by customer_id;

select customer_id from customer_20_60 order by customer_id;


select
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
left join customer_20_60 as b
on a.customer_id = b.customer_id
order by customer_id;


-- right join

select customer_id from sales_2015 order by customer_id;

select customer_id from customer_20_60 order by customer_id;


select
	a.order_line,
	a.product_id,
	a.sales,
	b.customer_id,
	b.customer_name,
	b.age
from sales_2015 as a
right join customer_20_60 as b
on a.customer_id = b.customer_id
order by customer_id;



-- full join

select customer_id from sales_2015 order by customer_id;

select customer_id from customer_20_60 order by customer_id;

select
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age,
	b.customer_id
from sales_2015 as a
full join customer_20_60 as b
on a.customer_id = b.customer_id
order by a.customer_id, b.customer_id;


-- create month table

create table month_values (MM integer);

select * from month_values;

insert into month_values values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);

select * from month_values;


-- create year table

create table year_table (YYYY integer);

select * from year_table;

insert into year_table values (2011), (2012), (2013), (2014), (2015), (2016), (2017), (2018), (2019);

select * from year_table;


-- cross join

select
	a.YYYY,
	b.MM
from year_table as a, month_values as b
order by a.YYYY, b.MM;

-- intersect

-- common data are display 

select * from sales_2015;

select * from customer_20_60;

select customer_id from sales_2015;

select customer_id from customer_20_60;

select customer_id from sales_2015
intersect all
select customer_id from customer_20_60;

select customer_id from sales_2015
intersect
select customer_id from customer_20_60;


-- except
/*
only sales_2015 values are there
not include the data which are present in customer_20_60
*/

select customer_id from sales_2015 order by customer_id;

select customer_id from customer_20_60 order by customer_id;

select customer_id from sales_2015
except
select customer_id from customer_20_60
order by customer_id;

-- union

select customer_id from sales_2015
union
select customer_id from customer_20_60
order by customer_id;


-- Exercise

select
	b.state,
	sum(sales)
from sales_2015 as a
left join customer_20_60 as b
on a.customer_id = b.customer_id
group by b.state;


select * from sales;

select * from product;

select
	a.*,
	sum(b.sales) as "Total Sales",
	sum(quantity) as "Total Quantity"
from product as a
left join sales as b
on a.product_id = b.product_id
group by a.product_id;

-- subquary

-- where subquery

select * from sales
where customer_id in (select customer_id from customer where age > 60);

select customer_id, sales from sales
where customer_id in (select customer_id from customer where age > 60);
	

select
	a.product_id,
	a.product_name,
	a.category,
	b.quantity
from product as a
left join (select product_id, sum(quantity) as quantity from sales group by product_id) as b
on a.product_id = b.product_id
order by b.quantity desc;


select order_line, customer_id, (select customer_name from customer where customer.customer_id = sales.customer_id)
from sales
order by customer_id;


-- Exercise

select
	c.customer_name,
	c.age,
	sp.*
from customer as c
right join (select
		   		s.*,
		   		p.product_name,
		   		p.category
		   	from sales as s
		   	left join product as p
		   	on s.product_id = p.product_id) as sp
on c.customer_id = sp.customer_id;

-- view

create view logistics as
select
	a.order_line,
	a.product_id,
	b.customer_name,
	b.city,
	b.state,
	b.region
from sales as a
left join customer as b
on a.customer_id = b.customer_id
order by customer_id;

select * from logistics;

drop view logistics;


-- index

create index mon_idx
on month_values(MM);

alter index monthi_index
rename to month_index;


drop index month_index;


-- Exercise


create view Daily_Billing as
select order_line, product_id, sales, discount from sales;

select * from Daily_Billing;

drop view Daily_Billing;


create view daily_bill as
select order_line, product_id, sales, discount from sales
where order_date in (select max(order_date) from sales);

select * from daily_bill;

drop view daily_bill;


-- string

-- length

select length('Bangladesh is a beautiful Country');

select customer_name, length(customer_name) as "Characters" from customer;

select customer_name, age, length(customer_name) as "Characters" from customer where age > 30;

select customer_name, age, length(customer_name) as "Characters" from customer where length(customer_name) > 15;


-- upper or lower

select upper('Bangladesh is a Beautiful Country');

select lower('Bangladesh is a Beautiful Country');

select customer_name, upper(customer_name) from customer where age > 60 limit 10;

select customer_name, lower(customer_name) from customer limit 10;

-- replace

select customer_name, country, replace(country, 'United States', 'US') from customer;


select customer_name, country, replace(lower(country), 'united states', 'US') from customer;


-- trim ltrim rtrim

select trim(leading ' ' from '     Bangladesh is a beatiful country     ');
 
select trim(trailing ' ' from '     Banglaesh is a beautiful country      ');

select trim(both ' ' from '       Bangladesh is a beautiful country       ');

select trim('    Bangladesh is a beautiful country    ');

select ltrim('    Bangladesh is a beautiful country    ');

select rtrim('     Bangladesh is a beautiful country    ');

-- concatenation

select customer_name, city || ' , ' || state || ' , ' || country as "New Address" from customer;


-- substring

select customer_id, customer_name,
substring(customer_id for 2) as Cust_Group
from customer
where substring(customer_id for 2) = 'AB';


select customer_id, customer_name,
substring(customer_id from 4 for 5) as Customer_Num
from customer
where substring(customer_id for 2) = 'AB';


-- string aggregate

select * from sales order by order_id;

select order_id, product_id from sales order by order_id;


select order_id, string_agg(product_id, ', ') from sales group by order_id order by order_id;


-- Exercise

select max(length(product_name)) from product ;


select product_name, category, sub_category, product_name || ', ' || sub_category || ', ' || category as
"Product Deatails" from product;


select product_id from product;

select product_id,
substring(product_id for 3) as first_part,
substring(product_id from 5 for 2) as second_part,
substring(product_id from 8 for 8) as third_part
from product
order by product_id;



select category, sub_category from product;

select category, string_agg(sub_category, ', ') from product group by category;

select string_agg(product_name, ', ') from product where sub_category in('Chairs', 'Tables');


-- mathematical function

-- ceil or floor

select order_line, sales, ceil(sales), floor(sales) from sales;

select order_line, sales, ceil(sales), floor(sales) from sales limit 10;

-- random

select
	random() as "O to 1",
	random()*40+10 as "10 to 40 Decimal",
	floor(random()*40)+10 as "10 to 40 Integer";

-- setseed

select setseed(0.5);


select random(); --.9851677

select floor(random()*40); --33

select setseed(0.5);

select random();

select floor(random()*40); 

-- round


select order_line, sales, round(sales) from sales;

select order_line, sales, round(sales) from sales order by sales desc;

-- power

select age, power(age, 2) from customer;

select age, power(age, 2) from customer order by age asc;

select age, power(age, 2) from customer order by age desc;


-- Exercise

select * from sales;

select customer_id, random() as rand_n from customer order by rand_n limit 5;

select sum(sales) as "Orginal Sales", sum(floor(sales)) as "Lower Sales", sum(ceil(sales)) as "Higher Sales",
sum(round(sales)) as "Rounding Sales" from sales;



-- date time function

select current_date, current_time, current_time(1), current_time(3), current_timestamp;


select age('2023-02-04', '1996-12-20');

select order_line, ship_date, order_date, age(ship_date, order_date) as time_taken from sales order by time_taken desc;

-- extract

select current_date, extract(day from current_date);

select current_date, extract(month from current_date);

select current_date, extract(year from current_date);

select current_time, extract(Hour from current_time);

select current_time, extract(Minute from current_time);

select current_timestamp, extract(Hour from current_timestamp);

select current_timestamp, extract(Minute from current_timestamp);

select order_date, ship_date, (extract(epoch from ship_date)- extract(epoch from order_date)) as sec_taken
from sales;


-- Exercise

select age(current_date, '1939-04-06');

select extract(month from order_date) as month_n, sum(sales) as total_sales from sales
where product_id in (select product_id from product where sub_category = 'Chairs')
group by month_n
order by month_n;


-- pattern match

-- like

select customer_name from customer;

select * from customer where customer_name like 'Jo%';

select customer_name from customer where customer_name like '%od%';

select customer_name from customer where customer_name like 'Bro__na%';

select customer_name from customer where customer_name like 'J%';

select customer_name from customer where customer_name not like 'J%';


-- reg ex

select * from customer where customer_name ~* '^a+[a-z\s]+$';

select * from customer where customer_name ~* '^(a|b|c|d)+[a-z\s]+$';

select * from customer where customer_name ~* '^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';

-- create user table

create table users(id serial primary key, name character varying);

insert into users (name) VALUES ('Alex'), ('Jon Snow'), ('Christopher'), ('Arya'),('Sandip Debnath'), ('Lakshmi'),('alex@gmail.com'),('@sandip5004'), ('lakshmi@gmail.com');

select * from users;


select * from users
where name ~* '^[a-z0-9\.\-\_]+@[a-z0-9\-\_\.]+\.[a-z]{2,5}';


-- Exercise

select customer_name from customer where customer_name ~* '^(a|b|c|d)+[a-z]{4}\s(a|b|c|d)+[a-z]{4}$';

select customer_name from customer where customer_name ~* '^[a-z]{5}\s(a|b|c|d)[a-z]{4}$';


create table zipcode (zip varchar);

select * from zipcode;

insert into zipcode values
('234432'),
('23345'),
('sdfe4'),
('123&3'),
('67424'),
('7895432'),
('12312');

select * from zipcode;


select * from zipcode where zip ~* '^[0-9]{5,6}$';


-- window function

create table test_data (
	Customer varchar,
	State varchar,
	Orders int
);

select * from test_data;

insert into test_data values
('C-1', 'A', 3),
('C-2', 'B', 5),
('C-3', 'B', 4),
('C-4', 'B', 2),
('C-5', 'A', 6),
('C-6', 'B', 4),
('C-7', 'A', 2);


select * from test_data;


select customer, state, orders,
row_number()over(
	partition by state
	order by orders desc
) as row
from test_data;


select * from customer limit 10;

select * from sales limit 10;

select
	a.*,
	b.total_order,
	b.total_sales,
	b.total_quantity,
	b.total_profit
from customer as a
left join (select customer_id, count(distinct order_id) as total_order, sum(sales) as total_sales, sum(quantity)
		  as total_quantity, sum(profit) as total_profit from sales group by customer_id) as b
on a.customer_id = b.customer_id;


create table customer_order as (
select
	a.*,
	b.total_order,
	b.total_sales,
	b.total_quantity,
	b.total_profit
from customer as a
left join (select customer_id, count(distinct order_id) as total_order, sum(sales) as total_sales,
		  sum(quantity) as total_quantity, sum(profit) as total_profit from sales group by customer_id) as b
on a.customer_id = b.customer_id	
);


select * from customer_order;

-- FETCH CUSTOMER ID, CUSTOMER NAME, STATE, TOTAL ORDER FROM CUSTOMER ORDER TABLE WITH ROW NUMBER COLUMN BASED ON 

select customer_id, customer_name, state, total_order, row_number() over(partition by state order by 
																		total_order desc) as row_n from customer_order;

select * from (select customer_id, customer_name, state, total_order, row_number() over(partition by state
				order by total_order desc) as row_n from customer_order) as a where a.row_n <= 3;



-- rank and dense_rank

select customer_id, customer_name, state, total_order,
row_number() over(partition by state order by total_order desc) as row_n,
rank() over(partition by state order by total_order desc) as rank,
dense_rank() over(partition by state order by total_order desc) as dense_rank
from customer_order;

-- ntile

select customer_id, customer_name, state, total_order,
row_number() over(partition by state order by total_order desc) as row_n,
rank() over(partition by state order by total_order desc) as rank,
dense_rank() over(partition by state order by total_order desc) as dense_rank,
ntile(5) over(partition by state order by total_order desc) as ntile
from customer_order;


-- first 20% data

select * from (select customer_id, customer_name, state, total_order,
			 row_number() over(partition by state order by total_order desc) as row_n,
			 rank() over(partition by state order by total_order desc) as rank,
			 dense_rank() over(partition by state order by total_order desc) as dense_rank,
			 ntile(5) over(partition by state order by total_order desc) as ntile
			 from customer_order)
as a where a.ntile=1;


-- last 20% data


select * from (select customer_id, customer_name, state, total_order,
			 row_number() over(partition by state order by total_order desc) as row_n,
			 rank() over(partition by state order by total_order desc) as rank,
			 dense_rank() over(partition by state order by total_order desc) as dense_rank,
			 ntile(5) over(partition by state order by total_order desc) as ntile
			 from customer_order)
as a where a.ntile=5;


-- average

select customer_id, customer_name, state, total_sales as revenue,
avg(total_sales) over(partition by state) as average_revenue from customer_order;


-- revenue is less than average renenue

select * from (select customer_id, customer_name, state, total_sales as revenue,
avg(total_sales) over(partition by state) as average_revenue from customer_order) as a
where a.revenue < a.average_revenue;

-- revenue is higher than average revenue

select * from (select customer_id, customer_name, state, total_sales as revenue,
			  avg(total_sales) over(partition by state) as average_revenue from customer_order) as a
where a.revenue > a.average_revenue;


-- count

select customer_id, customer_name, state,
count(customer_id) over(partition by state) as customer_count
from customer_order;


select * from sales;

select order_id, max(order_date) as order_date, max(customer_id) as customer_id, sum(sales) as total_sales
from sales group by order_id;


create table order_rollup as (select order_id, max(customer_id) as customerl_id, max(order_date) as order_date, sum(sales)
				as total_sales from sales group by order_id);

select * from order_rollup;

create table order_rollup_state as (select a.*, b.state
from order_rollup as a
left join customer as b
on a.customerl_id = b.customer_id);


select * from order_rollup_state;


select *,
sum(total_sales) over(partition by state) as total_by_states
from order_rollup_state;


-- runnig total

select *,
sum(total_sales) over(partition by state order by order_date) as runnig_total,
sum(total_sales) over(partition by state) as total_by_sales
from order_rollup_state;


-- lag

select customerl_id, order_date, order_id, total_sales,
lag(total_sales, 1) over(partition by customerl_id order by order_date) as previous_sales,
lag(order_id, 1) over(partition by customerl_id order by order_date) as previous_order_id
from order_rollup_state;

select customerl_id, order_date, order_id, total_sales,
lag(total_sales, 2) over(partition by customerl_id order by order_date) as previous_sales,
lag(order_id, 2) over(partition by customerl_id order by order_date) as previous_order_id
from order_rollup_state;

-- lead

select customerl_id, order_date, order_id, total_sales,
lead(total_sales, 1) over(partition by customerl_id order by order_date) as next_sales,
lead(order_id, 1) over(partition by customerl_id order by order_date) as next_order_id
from order_rollup_state;





-- coalesce

create table emp_table (
	sl_no int,
	first_name varchar,
	middle_name varchar,
	last_name varchar
);

select * from emp_table;

insert into emp_table (sl_no, first_name, middle_name, last_name) values (1, 'touhiduzzaman', 'tuhin', 'sarkar');

insert into emp_table (sl_no, middle_name, last_name) values (1, 'shahed', 'khan');

insert into emp_table (sl_no, first_name, last_name) values (1, 'sudip', 'sarkar');

insert into emp_table (sl_no, first_name, middle_name, last_name) values (1, 'hasibul', 'H', 'shanto');

insert into emp_table (sl_no, middle_name) values (1, 'asif');

insert into emp_table (sl_no, first_name, middle_name) values (1, 'al', 'imran');

select * from emp_table;


select *,
coalesce(first_name,middle_name,last_name) as name,
concat(first_name, middle_name, last_name) as full_name
from emp_table;



-- conversion
-- FETCH SALES, TOTAL SALES VALUE FOR THIS ORDER IS XXXX
-- FETCH SALES, TOTAL SALES VALUE FOR THIS ORDER IS $XXXX
-- FETCH SALES, TOTAL SALES VALUE FOR THIS ORDER IS $X,XXX


select sales, 'Total sales value for this order is ' || to_char(sales, '9999.99') from sales;

select sales, 'Total sales value for this order is ' || to_char(sales, '$9999.99') from sales;

select sales, 'Total sales value for this order is ' || to_char(sales, 'L9999.99') from sales;

select sales, 'Total sales value for this order is ' || to_char(sales, '$9,999.99') from sales;

-- date

select order_date, to_char(order_date, 'DDMMYY') from sales;

select order_date, to_char(order_date, 'Month DD YY') from sales;

select order_date, to_char(order_date, 'MONTH DAY YYYY') from sales;

select order_date, to_char(order_date, 'MONTH, DAY, YYYY') from sales;

-- to_date

select to_date('2017/01/04', 'YY/MM/DD');

select to_date('03202015', 'MMDDYY');

-- to_number

select to_number('2023.4342', '9999.99');

select to_number('$2,043.4232', 'L9,999.99');





































