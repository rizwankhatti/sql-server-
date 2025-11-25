create database university_1 ;
use university_1;

create table student(
  id int primary key,
  name varchar(40)
);


insert into student
(id,name)
values
(101,'adam'),
(102,'bob'),
(103,'casey');

create table course(
  id int primary key,
  course varchar(39)
);

insert into course
(id,course)
values
(102,'english'),
(105,'math'),
(103,'science'),
(107,'computer science');

select *
from student
inner join course
on student.id = course.id;

select * 
from student as s
left join course as c
on s.id = c.id; 

select *
from student as s
right join course as c
on s.id = c.id;

select *
from student as s
full join course as c
on s.id = c.id;