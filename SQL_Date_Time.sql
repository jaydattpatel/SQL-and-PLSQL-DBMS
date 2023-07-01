
/*
Author : Jaydatt Patel

 date and time functions
*/

show databases;
show tables;

create database college; /*create database in MySql*/
show databases; /* show databases in MySql */
use college; /* select database to oeration in MySql*/

create table student
	(	id int primary key, 
		firstname varchar(20) not null ,
		lastname varchar(20),
		dob date,
		marks int,
		city varchar(20) );

insert into student values
	(101,'Rahul','Shah','1990-12-01',85,'Ahmedabad'),
	(102,'Amit','Verma','1992-09-03',90,'Delhi'),
	(103,'Hitesh','Sharma','1991-08-04',56, 'Mumbai'),
	(104,'Jay','Modi','1995-05-09',60, 'Ahmedabad');	

select 	id as "Student ID", 
		dob as "Birth Date",
		current_date as "Today"
		from student; 

/* sysdate = current_date*/

/*Sun, Mon,.....*/
select to_char(sysdate,'day') as "Day" from dual;  

/*display current time */
select to_char(sysdate,'hh24:mi:ss am') as "Time" from dual;
select to_char(sysdate,'hh12:mi:ss am') as "Time" from dual;
select to_char(sysdate,'hh24:mi am') as "Time" from dual;
select to_char(sysdate,'hh12:mi am') as "Time" from dual;

/*display current year */
select to_char(sysdate,'year') as "Year" from dual;
select to_char(sysdate,'yyyy') as "Year" from dual;
select to_char(sysdate,'yy') as "Year" from dual;


/*display current month */
select to_char(sysdate,'month') as "Month" from dual;
select to_char(sysdate,'mm') as "Month" from dual;

/*display current date */
select to_char(sysdate,'dd') as "Date" from dual;

/* Date and Time */
select to_char(sysdate,'dd/mm/yyyy hh:mi:ss am day') as "Date" from dual;

/*convert string to date*/
select to_date('27042023','dd/mm/yyyy') from dual;
select to_date('270423','dd/mm/yy') from dual;
select to_date('20230427','yyyy/mm/dd') from dual;
select to_date('202304','yyyy/mm') from dual;

/* difference of the month between two dates*/
select months_between ('20-Aug-2010' , '25-Feb-2011') from dual;
select months_between (current_date,'20-Aug-2010') from dual;
select months_between (current_date,dob) from student;

/* display by adding number of month in date*/
select add_months ('5-Aug-2019',7) from dual;
select add_months (current_date,5) from dual;
select add_months (dob,2) from student;

/*extract year from date*/
select EXTRACT(year FROM current_date)  as "Year" from dual;
select EXTRACT(year FROM dob) as "Year" from student;

/*extract month from date*/
select EXTRACT(month FROM current_date) as "Month"  from dual;
select EXTRACT(month FROM dob) as "Month"  from student;

/*extract day from date*/
select EXTRACT(day FROM current_date) as "Day"  from dual;
select EXTRACT(day FROM dob)  as "Day" from student;

/* manually age calculate*/
select ((months_between (current_date,dob))/12) as "Age "from student;

delete from student;	/*delete all records from table*/

drop table student;


