create database vote;
use vote;

create table voter_Table(
  voter_Id int,
  voter_Name varchar(50),
  voter_Age int
);

--NOT NULL CONSTRAINT

select * from voter_Table;

insert into voter_Table
(voter_Id,voter_Age)
values
(1,20);

delete from voter_Table where voter_Id = 1;

alter table voter_Table
alter column voter_Name varchar(50) not null;

alter table voter_Table
alter column voter_Name varchar(50) null;

-- UNIQUE COSTRAINT

alter table voter_Table add unique(voter_Id);

insert into voter_Table values (1,'rizwan',20);
insert into voter_Table values (1,'uzair',25);

alter table voter_Table drop constraint[UQ__voter_Ta__B794072AF7EF4337];
alter table voter_Table drop constraint[UQ__voter_Ta__B794072A842F77D5];

alter table voter_Table add primary key(voter_Id);

alter table voter_Table
alter column voter_Id int not null;

alter table voter_Table drop constraint[PK__voter_Ta__B794072BED3DCCD6];

create table voter_city(
  C_Id int,
  C_Name varchar(50),
  voter_Id int
);

select * from voter_Table;
select * from voter_city;

alter table voter_city add foreign key (voter_Id)
references voter_Table(voter_Id);

alter table voter_city drop constraint[FK__voter_cit__voter__5FB337D6];

alter table voter_Table add check( voter_Age >= 18);

insert into voter_Table values (1,'rizwan',20);
insert into voter_Table values (2,'rizwan',18);
insert into voter_Table values (3,'rizwan',16);

alter table voter_Table drop constraint[CK__voter_Tab__voter__619B8048];

alter table voter_Table add default 18 for voter_Age;

insert into voter_Table
(voter_Id,voter_Name)
values
(5,'sufyan');