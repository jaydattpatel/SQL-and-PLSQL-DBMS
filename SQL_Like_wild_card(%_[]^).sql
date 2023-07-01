/*
Author : Jaydatt Patel

wild card - Like operator / Not Like operator / escape operator

What are wild cards?
SQL wildcards are special characters used in SQL queries to match patterns in the data. 
Following are the four wildcards used in conjunction with the LIKE operator −

1. % :The percent sign represents zero, one or multiple characters.
2. _ : The underscore represents a single number or character.
3. [] : This matches any single character within the given range in the [].
4. [^] : This matches any single character excluding the given range in the [^].

Note − In the LIKE operator, the above wildcard characters can be used 
individually as well as in combinations with each other. 
The two mainly used wildcard characters are ‘%’ and ‘_’.
The table given below has a few examples showing the WHERE clause 
having different LIKE operators with '%' , '_' , [] and [^] pattern −

Escape characters with LIKE operator :

The escape character in SQL is used to exclude certain wildcard characters from 
the expression of the LIKE operator. 
By doing so, we can use these characters in their general sense.
Using escape, we can also avoid using the characters that are reserved in SQL 
syntax to denote specific commands, such as the single quote “ ' ”, “%” and “_”.
For example, if you need to search for “%” as a literal in the LIKE condition, 
then it is done using Escape character.


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
	(105,'Khushi','Patel','1993-04-15',NULL,'Bangalore','F'),
	(106,'Hitesh','Sharma','1980-08-04',56, NULL,'M'),
	(107,'Mital','Kumawat','1970-07-22',95, 'Mumbai','F'),
	(108,'Jay',NULL,'1975-02-16',60,'Mumbai','M'),
	(109,'Tanvi','Dave','1977-05-18',70, 'Chennai','F'),
	(110,'Ravi',NULL,'1994-06-12',NULL,'Mumbai',NULL);


/* 'Mumbai' select whose character exact match with 'Mumbai' */
select * from student where city like 'Mumbai';

/* 'B%' select whose first character starting with 'B' */
select * from student where city like 'B%';

/* '%i' select whose last character ending with 'i' */
select * from student where city like '%i';

/* '%ba%' select who have character is ba at any position*/
select * from student where city like '%ba%';

/* 'r%a' select whose first character is 'r' and last is 'a' */
select * from student where firstname like 'r%a';

/* '_____' select whose lenght is 5 as '_____' */
select * from student where firstname like '_____';

/* '_a___' select whose lenght is 5 and second character is 'a' as '_a___' */
select * from student where firstname like '_a___';

/* 'ba_%' select whose first character starting 'ba_' and at least 3 lenght*/
select * from student where city like 'ba_%';

/* '__m%' select whose first character starting '__m' and at least 3 lenght*/
select * from student where city like '__m%';

/* '%nn_i' select whose last character ending with 'n_i' and at least 4 lenght*/
select * from student where city like '%nn_i';

/* '%l__' select whose last character ending with 'l__' and at least 3 lenght*/
select * from student where city like '%l__';

/* 'r[i,k]%' select whose first character is 'r' and has special character from [i,k] */
select * from student where firstname like 'r[i,k]%';

/* 'r[b-j]%' select whose first character is 'r' and has special character from range [b-j] */
select * from student where firstname like 'r[b-j]%';

/* '[b-j]%' select who has the first and last character lies anywhere in the range [b-i] */
select * from student where firstname like '[b-j]%';

/* '[^b-j]%' select who has the first and last character not lies anywhere in the range [^b-i] */
select * from student where firstname like '[^b-j]%';

/* '%!%%' where '!' is escape so it will '%\%%' select who has '%' at any position */
select * from student where firstname like '%!%%' escape '!' ;

/* 'R!%' where '!' is escape so it will 'R\%' select who has 'R%' at any position */
select * from student where firstname like 'R!%' escape '!';

/* 'R%!%' where '!' is escape so it will 'R%\%' select whose first char is 'R' and last is '%'  */
select * from student where firstname like 'R%!%' escape '!';

delete from student;	/*delete all records from table*/

drop table student; /*drop table*/


