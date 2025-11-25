create database college_2;
use college_2;

create table dept_1(
  id int primary key,
  name varchar(50)
);

insert into dept_1
values
(101,'ENG'),
(102,'IT');

update dept_1
set id = 111
where id = 102;


select * from dept_1;


create table teacher_1(
  id int primary key,
  name varchar(50),
  dept_id int,
  foreign key (dept_id) references dept_1(id)
  on update cascade
  on delete cascade
);




insert into teacher_1
(id,name,dept_id)
values
(101,'adam',101),
(102,'eve',102);

select * from teacher_1;
