
/*

Author : Jaydatt Patel

Data Definition Language (DDL)
DDL commands: create, alter and drop 

Tables: student, student_resultheet, student, emp_dept and emp_sal

Create or delete database and table, add primary key, 
add or modify or delete attributes of table,

Data Manipulation Language (DML)
DML commands: insert, select, delete and update.

Insert values into student table with field names using insert
command,
Display the table student using select command,
Update student address in student table using update command,
Delete a row from student table.
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
		gender varchar(10));

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

/* Show all value in table */
select * from student;	

/* distinct to view without duplication */
select distinct city from student; 

/* Update value */
update student 
	set firstname = "Jay", lastname = "Modi" 
	where id = 108; 

/* count records */
select 	count(*) as "Total Record",	/*count all records*/
		count(distinct city) as "Total City"/*count all filled city records ignoring duplicate*/
	from student; 


/* Maximum from int or char*/
select id, firstname, max(result) from student; 
select id, firstname, max(city) from student;

/* Minimum from int or char */
select id, firstname, min(result) from student; 
select id, firstname, min(city) from student;

 /* Sum all int value */
select sum(result) as "Sum" from student;

/* Average of int all value */
select avg(result) as "Average "from student; 

/* display null or not */
select * from student 
	where (lastname is NULL) or (result is NULL)
		or (city is null); 

/* or with where */
select * from student 
	where ((result < 60) or (result > 88)); 

/*not between with where */
select * from student 
	where result not between 55 and 80; 

/*and with where*/
select id, firstname, city from student 
	where (id >= 102) and (city != 'Mumbai');

/*and Not with where*/
select id, firstname,city from student 
	where (id >= 105) and not (city = 'Ahmedabad'); 


/* order by column ascending or decending*/
select * from student 
	order by firstname asc; /* order by column */
select * from student 
	order by id; /*default ascending*/
select * from student 
	order by result desc limit 4; /*order by column accending (asc) decending (dsc)*/
select * from student 
	order by 5 asc ; /* select column number 5 to sort*/ 


/* limit record to view*/
select * from student limit 3; /*display only 3 records*/
select * from student 
	order by result desc limit 4; /*display only 4 records*/

/* to dispaly data with specific column name and concatination*/
select 	id as "Student ID", 
		(firstname || ' ' || lastname) as "Name", /* concate(firstname ||' '||lastname)*/
		dob as "Birth Date",
		city as "Location",
		current_date as "Today"
		from student;

/* to_char for conver into string*/
select id, firstname, to_char(result) from student; 
select to_char(avg(result),'99999.99')from student;


/* to get sub string from string*/
select substr('oracle',2,4) from dual; 
select substr(firstname,2,4) from student; 

/* replace character */
select translate ('Student','nt','AB') from dual;
select translate (firstname,'a','Q') from student;

/*initcap to captital every first character */
select initcap('i like to pl sql') from dual; 
select initcap(firstname) from student;

/*all upper capital*/
select upper ('I like sql') from dual; 
select upper (firstname) from student;

/*all lower capital*/ 
select lower ('I Like Sql') from dual;	
select lower (firstname) from student;

/*total length of character and space filled by '*' in left */
select lpad ('CODL',8,'*') from dual;
select lpad (firstname,10,'*') from student;

/*total length of character and space filled by '*' in right */
select rpad ('CODL',8,'*') from dual;
select rpad (firstname,10,'*') from student;

/*remove space from left side*/
select ltrim ('          abc') from dual;
select ltrim (firstname) from student;

/*remove space from right side*/
select rtrim ('abc          ') from dual;
select rtrim (firstname) from student;

/* delete recored from table */
delete from student where city = "Ahmedabad";	/*delete specific record from table*/
delete from student;	/*delete all records from table*/

/*drop table*/
drop table student;


