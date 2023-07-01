/*
Author : Jaydatt Patel

The join clause allows us to retrieve data from two or more related tables into a 
meaningful result set. We can join the table using a SELECT statement and a join condition. 
It indicates how SQL Server can use data from one table to select rows from another table. 
In general, tables are related to each other using foreign key constraints.

Here are the different types of the JOINs in SQL:
1)JOIN OR INNER JOIN
2)SELF JOIN
3)CROSS JOIN
4)OUTER JOIN

1)JOIN OR INNER JOIN: This JOIN returns all records from multiple tables that 
		satisfy the specified join condition. It is the simple and most popular 
		form of join and assumes as a default join. If we omit the INNER keyword 
		with the JOIN query, we will get the same output.

2)SELF JOIN: A table is joined to itself using the SELF JOIN. It means that each 
		table row is combined with itself and with every other table row. The SELF 
		JOIN can be thought of as a JOIN of two copies of the same tables. We can 
		do this with the help of table name aliases to assign a specific name to 
		each table's instance. The table aliases enable us to use the table's 
		temporary name that we are going to use in the query. It's a useful way to 
		extract hierarchical data and comparing rows inside a single table.

3)CROSS JOIN: CROSS JOIN in SQL Server combines all of the possibilities of two or 
		more tables and returns a result that includes every row from all contributing 
		tables. It's also known as CARTESIAN JOIN because it produces the Cartesian 
		product of all linked tables. The Cartesian product represents all rows present 
		in the first table multiplied by all rows present in the second table.


4) OUTER JOIN: OUTER JOIN in SQL Server returns all records from both tables that 
		satisfy the join condition. In other words, this join will not 
		return only the matching record but also return all unmatched 
		rows from one or both tables.

Types of Outer join:
	1.LEFT (OUTER) JOIN: Returns all records from the left table, and the matched 
		records from the right table
	2.RIGHT (OUTER) JOIN: Returns all records from the right table, 
		and the matched records from the left table
	3.FULL (OUTER) JOIN: Returns all records when there is a match in either 
		left or right table

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

create table contact
	(	id int, 
		email varchar(20),
		mobile varchar(15) );

create table course
	(	id int, 
		course_name varchar(20),
		fee int );

/*insert multiple records.*/
insert into student values
	(101,'Rahul','Shah','1990-12-01',85,'Ahmedabad','M'),
	(102,'Riya','Shah','1995-05-09',70, 'Ahmedabad','F'),
	(103,'Rekha','Kapoor',NULL,40,'Ahmedabad','F'),
	(104,'Amit','Verma','1992-09-03',90,'Delhi','M'),
	(105,'Khushi','Patel','1993-04-15',NULL,'Bangalore','F'),
	(106,'Hitesh','Sharma','1980-08-04',56, NULL,'M'),
	(107,'Mital','Kumawat','1970-07-22',95, 'Mumbai','F'),
	(108,'Jay',NULL,'1975-02-16',60,'Mumbai','M'),
	(109,'Tanvi','Dave','1977-05-18',70, 'Chennai','F'),
	(110,'Ravi',NULL,'1994-06-12',NULL,'Mumbai',NULL);

insert into contact values
	(101,'101@contact','+91 101'),
	(102,'102@contact','+91 102'),
	(104,'104@contact','+91 104'),
	(105,'105@contact','+91 105'),
	(109,'109@contact','+91 109'),
	(110,'110@contact','+91 110');

insert into course values
	(101,'c language',5000),
	(103,'c++',6000),
	(104,'SQL',7000),
	(105,'Java',8000),
	(107,'Python',9000),
	(109,'HTML',1000);
	

/* join or Inner join */
select student.id, student.firstname,student.city,
	course.course_name,course.fee from student
		inner join course on student.id = course.id;

select student.id, student.firstname,student.city,
	course.course_name,course.fee from student
		inner join course on student.id = course.id 
		where student.city = 'Ahmedabad';

select student.id, student.firstname,
	course.course_name,course.fee,
	contact.email, contact.mobile from student
	inner join course on student.id = course.id
	inner join contact on course.id = contact.id;


/* Self join */
select student.id, student.firstname,student.city,
	course.course_name,course.fee from student,course 
		where student.id = course.id 
		order by student.firstname;s

select student.id, student.firstname,
	course.course_name,course.fee,
	contact.email,contact.mobile
	from student,course,contact
	where student.id = course.id and 
		student.id = contact.id order by student.id;

/* cross join */
select student.id, student.firstname,student.city,
	course.course_name,course.fee from student
		cross join course on student.id = course.id;

select student.id, student.firstname,
	course.course_name,course.fee,
	contact.email,contact.mobile
	from student
	cross join course on student.id = course.id
	cross join contact on course.id = contact.id;

/* left join or left outer join */
select student.id, student.firstname,student.city,
	course.course_name,course.fee from student
		left outer join course on student.id = course.id;

select student.id, student.firstname,
	course.course_name,course.fee,
	contact.email,contact.mobile
	from student
	left join course on student.id = course.id
	left join contact on course.id = contact.id;

/* right join or right outer join */
select student.id, student.firstname,student.city,
	course.course_name,course.fee from student
		right outer join course on student.id = course.id;

select student.id, student.firstname,
	course.course_name,course.fee,
	contact.email,contact.mobile
	from student
	right join course on student.id = course.id
	right join contact on course.id = contact.id;

/* full join or full outer join */
select student.id, student.firstname,student.city,
	course.course_name,course.fee from student
		full join course on student.id = course.id;

select student.id, student.firstname,
	course.course_name,course.fee,
	contact.email,contact.mobile
	from student
	full join course on student.id = course.id
	full join contact on course.id = contact.id;
