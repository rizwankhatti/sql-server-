create database uni;
use uni;

create table student_1(
  rollno int primary key,
  name varchar(50),
  marks int not null,
  grade varchar(1),
  city varchar(50)
 );
 
 insert into student_1
 (rollno,name,marks,grade,city)
 values
 (110,'danish',78,'C','karachi'),
 (111,'rizwan',12,'F','badin'),
 (112,'shoaib',85,'B','badin'),
 (113,'jabir',96,'A','badin'),
 (114,'raheel',93,'A','kpk'),
 (115,'bola',82,'B','kpk');

 drop table student_1;


 alter table student_1
 drop column age;

 alter table student_1
 add age int not null default 19;

 alter table student_1
 alter column age varchar(2);

exec sp_rename 'student_1.age','stu_age','column';

alter table student_1
alter column stu_age int;

 insert into student_1
 (rollno, name, marks,age)
 values
 (107,'hadi',68,100);
 
 select * from student_1;

