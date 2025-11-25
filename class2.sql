create database college_1;
use college_1;

create table student(
  rollno int primary key,
  name varchar(50),
  marks int not null,
  grade varchar(1),
  city varchar(50)
 );

 insert into student
 (rollno,name,marks,grade,city)
 values
 (110,'danish',78,'C','karachi'),
 (111,'rizwan',12,'F','badin'),
 (112,'shoaib',85,'B','badin'),
 (113,'jabir',96,'A','badin'),
 (114,'raheel',93,'A','kpk'),
 (115,'bola',82,'B','kpk');


-- having clause

-- count number of students in each city where max marks cross 90.

 select city, count(rollno)
from student
group by city
having max(marks) > 90;

-- general order

select city
from student
where grade = 'A'
group by city
having max(marks) >= 93
order by city desc;


update student
set grade = 'O'
where grade = 'A';


update student 
set marks = 83
where rollno = 111;

update student 
set grade = 'B'
where marks between 70 and 80;

update student 
set marks = marks+1;

update student 
set marks = 12
where rollno = 111;

delete from student
where marks < 33;

select * from student;

create table dept(
  id int primary key,
  name varchar(50)
 );

 create table teacher(
  id int primary key,
  name varchar(50),
  dept_id int,
  foreign key (dept_id) references dept(id)
 );