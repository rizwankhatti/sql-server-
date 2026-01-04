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

-- left join

select e.id as emp_id, e.fullname as emp_name, c.id as candid_id, c.fullname as candid_name
from hr.employees e
left join hr.candidates c
    on c.fullname = e.fullname;

select e.id as emp_id, e.fullname as emp_name, c.id as candid_id, c.fullname as candid_name
from hr.employees e
right join hr.candidates c
    on c.fullname = e.fullname;

select product_name, order_id
from production.products p
left join sales.order_items ot
     on ot.product_id = p.product_id
order by order_id;

select product_name , order_id
from production.products p
left join sales.order_items ot
    on ot.product_id = p.product_id
where order_id is null
order by order_id;

select p.product_name, o.order_id, ot.item_id, o.order_date
from production.products p
left join sales.order_items ot
    on ot.product_id = p.product_id
left join sales.orders o
    on o.order_id = ot.order_id
order by order_id;

select product_name , order_id
from production.products p
left join sales.order_items ot
    on ot.product_id = p.product_id
where order_id = 100
order by order_id;

-- 2nd method

select product_name , order_id
from production.products p
left join sales.order_items ot
    on ot.product_id = p.product_id
	and ot.order_id = 100
where order_id is not null
order by order_id desc;