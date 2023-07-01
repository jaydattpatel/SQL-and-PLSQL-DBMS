
/*

Author : Jaydatt Patel

between, in, group by, having, view, any, all

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
		lastname varchar(20),
		dob date,
		result int,
		city varchar(20),
		gender varchar(8) );


/*insert multiple records.*/
insert into student values
	(101,'Rahul','Shah','1990-12-01',85,'Ahmedabad','M'),
	(102,'Riya','Shah','1995-05-09',70, 'Ahmedabad','F'),
	(103,'Rekha','Kapoor',NULL,40,'Ahmedabad','F'),
	(104,'Amit','Verma','1992-09-03',90,'Delhi','M'),
	(105,'Khushi','Patel','1993-04-15',66,'Bangalore','F'),
	(106,'Hitesh','Sharma','1980-08-04',56, NULL,'M'),
	(107,'Mital','Kumawat','1970-07-22',95, 'Mumbai','F'),
	(108,'Jay',NULL,'1975-02-16',60,'Mumbai','M'),
	(109,'Tanvi','Dave','1977-05-18',70, 'Chennai','F'),
	(110,'xyz',NULL,'1994-06-12',73,'Mumbai',NULL);


/* between  with where */
select * from student 
	where dob between "1992-01-01" and "1995-01-01"; 

/* in (....) and not in (.....) with where */
select * from student where 
	id in (102,104,106,108) and 
	city not in ('Ahmedabad') and
	gender in ('M'); 

/* group by and order by */
select city, count(id) as "No of Student",
		count(result) as "Updated result", 
		sum(result) as "Total Result",
		avg(result) as "Average result"
	from student group by city order by 5; /* order by 5 means avg(result)*/

/* having with order by and order by*/
select city, count(id) as "No of Student",
		count(result) as "Updated result", 
		sum(result) as "Total Result",
		avg(result) as "Average result"
	from student group by city having count(id) >= 2 order by 5;

/* create view, alter and dispaly*/
create or replace view details as
	select id as "ID",
		firstname as "Name",
		dob as "Birth date",
		city as "Area"
	from student;

select * from details;

alter view details as
	select result as "Result"
	from student;

drop view details; /*drop view if exist details;*/

/* any operator with subquery where */
select * from student where 
	result = any (select result from student where result > 70);

/* all operator with subquery where */
select * from student where 
	result = all (select result from student where result > 30 );

delete from student;	/*delete all records from table*/

drop table student; /*drop table*/


