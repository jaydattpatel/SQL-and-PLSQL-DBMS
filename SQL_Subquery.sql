
/*

Author : Jaydatt Patel
sub-query

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
		gender varchar(8));

create table student_backup
	(	id int primary key, 
		firstname varchar(20) not null,
		lastname varchar(20),
		dob date,
		result int,
		city varchar(20),
		gender varchar(8),
		check (result>=0 or result <=100) );

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
	(110,'xyz',NULL,'1994-06-12',NULL,'Mumbai',NULL);


/* sub-query with where */
select id, firstname, result, city from student
	where result = (select max(result) from student);

 select id, firstname, result, city from student
    where result in (select result from student where result >= 85)
    	order by result desc;;


/* sub-query with insert */
insert into student_backup
  select * from  student 
   	where id in (select id from student where id < 105);

/*sub-query with update*/
update student set result = result + 2 
	where result in (select result from student where result < 70);

/*sub-query with delete*/
delete from student_backup
   where id in (select id from student_backup 
   		where city = 'Ahmedabad' and id > 102 );


/* sub-query with from */
select result from
	(select result,id from student 
	where result >= 70) Temp_Table;

select result, count(id) as "No of Student"from
	(select result,id from student 
	where result >= 70) Temp_Table 
	group by result;

 /* sub-query with select */
select id, firstname,
	(select sum(id + result) from student) 
		as "I+R" from student;

delete from student;	/*delete all records from table*/

drop table student; /*drop table*/


