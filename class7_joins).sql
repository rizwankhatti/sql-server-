create schema hr;
go

-- syntax
--create table table_name(
--    column_name data_type constraint
--       )

create table hr.candidates(
    id int primary key identity,
	fullname varchar(100) not null
)

CREATE TABLE hr.employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);


INSERT INTO 
    hr.candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');

INSERT INTO 
    hr.employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');

select * from hr.employees;
select * from hr.candidates;

-- alias on column

select id as ID, fullname as fn 
from hr.employees;

select id as ID, fullname as fn
from hr.candidates;

-- alias on table

select e.id as ID, e.fullname as fn 
from hr.employees e;
--------- or ------------
select employees.id as ID, employees.fullname as fn
from hr.employees;

-- inner join

select * 
from hr.candidates c
inner join hr.employees e
    on e.fullname = c.fullname;

select id, fullname -- error because of ambigious coloumns bcz alias not defined
from hr.candidates c
inner join hr.employees e
    on e.fullname = c.fullname;

select c.id, c.fullname, e.id, e.fullname
from hr.candidates c
inner join hr.employees e
    on e.fullname = c.fullname;

select c.id as candid_id, c.fullname, e.id as emp_id, e.fullname
from hr.candidates c
inner join hr.employees e
    on e.fullname = c.fullname;

-- now use production schema 

select * from production.products;
select * from production.categories;

select * 
from production.products p
inner join production.categories  c
    on p.category_id = c.category_id;

select p.product_id, p.product_name, c.category_name
from production.products p
inner join production.categories c
    on p.category_id = c.category_id;

select p.product_id, p.product_name, c.category_name
from production.products p
inner join production.categories c
    on p.category_id = c.category_id
where c.category_name = 'Mountain Bikes';

select * from production.products;
select * from production.categories;
select * from production.brands;

select product_name, category_name,brand_name, list_price from 
production.products p
inner join production.categories c
    on c.category_id = p.category_id
inner join production.brands b
    on b.brand_id = p.brand_id;

select c.first_name, c.last_name, p.product_name, o.order_status
from sales.customers c
inner join sales.orders o
    on c.customer_id = o.customer_id
inner join sales.order_items ot
    on ot.order_id = o.order_id
inner join production.products p
    on p.product_id = ot.product_id; 

select st.store_name, s.quantity
from sales.stores st
inner join production.stocks s
    on s.store_id = st.store_id;