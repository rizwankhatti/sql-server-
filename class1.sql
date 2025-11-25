create database university;

use university;

  create table course(
  id int primary key,
  timing int,
  department varchar(50),
  subject varchar(50),
  class varchar(50) not null);

  insert into course
  (id,timing,department,subject,class)
  values
  (1,10,'data science','discreate','edoroam');

  select * from course;

 -- NEW DATABASE:
 -- PRIMARY KEY CONSTRAINT:

 create database xyz_company;

 use xyz_company;

 create table employee1(
   id int primary key,
   name varchar(39),
   salary int
 );

 insert into employee1
 (id,name,salary)
 values
 (1,'adam',25000),
 (2,'bob',30000),
 (3,'casey',40000),
 (4,'casey',40000),
 (5,'casey',40000),
 (6,'casey',40000);

 select * from employee1;
 select distinct name from employee1;

 --DISTINCT KEYWORD USED FOR NO REPEATED DATA.

--NEW TABLE:
-- UNIQUE CONSTRAINT:

 create table temp1(
  id int unique
 );

 insert into temp1 values(101);
 insert into temp1 values(102);

 select * from temp1;

--NEW TABLE:

 create table abc(
  id int,
  name varchar(50),
  age int,
  city varchar,
  primary key(id,name)
 );

--NEW TABLE:
-- DEFAULT CONSTRAINT:

 create table emp(
  id int,
  salary int default 25000
 );

 insert into emp (id) values (201);

 select * from emp;

-- NEW TABLE:
-- CHECK CONSTRAINT:

 create table new_table(
  age int check(age >= 18)
 );

 insert into new_table (age) values (18); -- excecute
 insert into new_table (age) values (19); -- excecute
 insert into new_table (age) values (17); -- not excecute
 
-- NEW DATABASE:

 create database college;

 use college;

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
 (111,'rizwan',93,'A','badin'),
 (112,'shoaib',85,'B','badin'),
 (113,'jabir',96,'A','badin'),
 (114,'raheel',12,'F','kpk'),
 (115,'bola',82,'B','kpk');

 --USAGE OF WHERE CLAUSE:

 select * from student;
 
 select * 
 from student
 where marks > 80;

 
 select * 
 from student
 where city = 'badin';

 
 select * 
 from student
 where marks > 80 and city = 'badin';

  
 select * 
 from student
 where marks+10 >100;

  
 select * 
 from student
 where marks = 93;

  
 select * 
 from student
 where marks between 80 and 90;

  
 select * 
 from student
 where city in ('badin','kpk');

 
 select * 
 from student
 where city in ('badin','kpk','islamabad');

 
 select * 
 from student
 where city in ('murree','peshawar');

 select * 
 from student
 where city not in ('badin','kpk');

  select * 
 from student
 order by city asc;
  
 select * 
 from student
 order by marks desc;

  select * 
 from student
 order by marks asc;

 --AGGREGATE FUNCTION:
 
 select count(rollno)
 from student;

  select max(marks)
 from student;

  select min(marks)
 from student;

  select avg(marks)
 from student;

 select sum(marks)
 from student;

 --GROUP CLAUSE:

 select city ,count(rollno)
 from student
 group by city;

 
 select city,name ,count(rollno)
 from student
 group by city,name;

 
 select city ,avg(marks)
 from student
 group by city;

  select city ,avg(marks)
 from student
 group by city
 order by city;

  select city ,avg(marks)
 from student
 group by city
 order by avg(marks);

  select city ,avg(marks)
 from student
 group by city
 order by avg(marks) asc;

 --IF YOU DONT WRITE ASC SO BY DEFAULT ASC HO JATA HAI
 --BUT IN CASE OF DESC WE WRITE NECESSARY:

  select city ,avg(marks)
 from student
 group by city
 order by avg(marks) desc;

 select grade, count(rollno)
 from student
 group by grade;

 -- for the given table,find the total payment according
 -- to each payment table?

 create table payment(
   customer_id int primary key,
   customer varchar(50),
   mode varchar(50),
   city varchar(40)
 );
 

 insert into payment
 (customer_id,customer,mode,city)
 values
 (101,'abbaas','netbanking','sawat'),
 (102,'jabir','credit card','kpk'),
 (103,'rizwan','credit card','badin'),
 (104,'danish','netbanking','mianwali'),
 (105,'raheel','credit card','hyderabad'),
 (106,'shoaib','debit card','bunair'),
 (107,'bola','debit card','lahore'),
 (108,'jamshed','netbanking','hazara'),
 (109,'shitai','netbanking','afghanistan'),
 (110,'rangilla','credit card','faislabad');

select mode, count(customer)
from payment
group by mode;


