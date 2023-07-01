
/*

Author : Jaydatt Patel

Data Definition Language (DDL)
DDL commands: create, alter and drop 

Tables: student, student_marksheet, student, emp_dept and emp_sal

Create or delete database and table, add primary key, 
add or modify or delete attributes of table,

Datatype:
int,smallint,bigint,
boolean,bit(n),varbit(n),
char(n),varchar(n),text,
date,timestamp,
decimal(x,y),float,real
JSON

*/

show databases;
show tables;

create database college; /*create database in MySql*/
show databases; /* show databases in MySql */
use college; /* select database to oeration in MySql*/

/*create table*/
create table student
	(	id int primary key, 
		firstname varchar(20) not null,
		lastname varchar(20) not null default '0',
		dob date, 
		sex text, 
		marks smallint );

/*alter table to add primary key and colunm, modify attribute name and types,*/
alter table student add primary key(firstname,dob); /*define primary key */
alter table student add column city int;	/*add column*/
alter table student modify city varchar(20);	/*modify attribute type*/
alter table student rename column sex to gender;
alter table student drop gender;	/*drop column*/

desc student;	/* describe properties of table (in MySql)*/

/*insert multiple records.*/
insert into student values
	(101,'Rahul','Shah','1990-12-01',85,'Ahmedabad'),
	(102,'Amit','Verma','1992-09-03',90,'Delhi'),
	(103,'Hitesh','Sharma','1991-08-04',56, 'Mumbai'),
	(104,'Abc',NULL,'1995-05-09',60, NULL);	

/*insert selected attributes*/
insert into student(id,firstname,dob,city) 
		values(999,'xyz','1994-06-12','Ahmedabad'); 

/* Show all value in table */
select * from student;	

/*create index and drop index of table*/
create index SS on student(id,firstname);
alter table student drop index SS;

/*create unique index and drop index of table*/
create unique index Icity on student(id,city); 
alter table student drop index Icity;

/* delete recored from table */
delete from student where firstname = "Abc";	/*delete specific record from table*/
delete from student;	/*delete all records from table*/

/*drop table*/
drop table student;
drop table if exists student;


