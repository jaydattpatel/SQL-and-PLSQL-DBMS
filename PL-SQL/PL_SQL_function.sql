
/*

Author : Jaydatt Patel

create function :

CREATE [OR REPLACE] FUNCTION function_name 
[(parameter_name [IN | OUT | IN OUT] type [, ...])] 
RETURN return_datatype 
{IS | AS} 
BEGIN 
   < function_body > 
END [function_name];

*/

/*create table*/
create table student
	(	id int primary key, 
		firstname varchar(20) not null,
		lastname varchar(20),
		dob date,
		result int,
		city varchar(20),
		gender varchar(8));


/*insert multiple records.*/
insert into student values(101,'Rahul','Shah','01-dec-1990',85,'Ahmedabad','M');
insert into student values(102,'Riya','Shah','09-may-1995',70, 'Ahmedabad','F');
insert into student values(103,'Rekha','Kapoor',NULL,40,'Ahmedabad','F');
insert into student values(104,'Amit','Verma','03-oct-1992',90,'Delhi','M');
insert into student values(105,'Khushi','Patel','15-apr-1993',NULL,'Bangalore','F');
insert into student values(106,'Hitesh','Sharma','04-aug-1980',56, NULL,'M');
insert into student values(107,'Mital','Kumawat','22-jul-1970',95, 'Mumbai','F');
insert into student values(108,'Jay',NULL,'16-feb-1975',60,'Mumbai','M');
insert into student values(109,'Tanvi','Dave','18-sep-1977',70, 'Chennai','F');
insert into student values(110,'xyz',NULL,'12-jun-1994',NULL,'Mumbai',NULL);


/*create general function like addition */
create or replace function add_fun(a number, b number)
	return number as c number;
begin
	c := a + b;
	return c;
end;
/

/*create function to count total record of student */
create or replace function total_students 
	return number as total number; 
begin
   select count(*) into total from student; 
   return total; 
end; 
/ 

/*create function to find min */
create or replace function min_id 
	return number as m number; 
begin
   select min(id) into m from student; 
   return m; 
end; 
/ 

/*create function to find max */
create or replace function max_id 
	return number as m number; 
begin
   select max(id) into m from student; 
   return m; 
end; 
/ 


/*PL-SQL Quiry-1 */
declare
	a number := &a;
	b number := &b;
	result number;

begin
	result := add_fun(a,b);
	dbms_output.put_line('SUM = ' ||result);
end;
/

/*PL-SQL Quiry-2 */
declare
	temp number;

begin
	temp := total_students();
	dbms_output.put_line('Total Student= ' ||temp);

	temp := min_id();
	dbms_output.put_line('Min ID = ' ||temp);

	temp := max_id();
	dbms_output.put_line('Max ID = ' ||temp);
end;
/


/*drop procedure*/
drop function add_fun;
drop function total_students;
