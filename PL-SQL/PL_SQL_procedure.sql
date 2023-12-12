
/*

Author : Jaydatt Patel

create procedure :
	The PL/SQL stored procedure or simply a procedure is 
	a PL/SQL block which performs one or more specific tasks.
	It is just like procedures in other programming languages.

IN parameters: The IN parameter can be referenced by the 
		procedure or function. The value of the parameter cannot 
		be overwritten by the procedure or the function.
OUT parameters: The OUT parameter cannot be referenced by 
		the procedure or function, but the value of the parameter 
		can be overwritten by the procedure or function.
INOUT parameters: The INOUT parameter can be referenced by 
		the procedure or function and the value of the parameter 
		can be overwritten by the procedure or function.

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


/*create procedure to display all record */
create or replace procedure 
	list_s
as
begin
	select * from student;
end;
/

/*create procedure to display record as per id number */
create or replace procedure 
	show(no IN number)
as
begin
	select * from student where id = no;
end;
/

/*create procedure to display record as per id number */
create or replace procedure 
	add_student(id in int, firstname in varchar,
			lastname in varchar, dob in date,
			result in int,city in varchar,
			gender in  varchar)
as
begin
	insert into student values
		(id,firstname,lastname,dob,result,city,gender);
end;
/


/*create procedure to update name */
create or replace procedure 
	update_name(no IN number, fnm IN varchar, lnm IN varchar)
as
begin
	update student set firstname = fnm, lastname = lnm
		where id = no;
end;
/


/*create procedure to delete record as per id number */
create or replace procedure 
	delete_student(no IN number)
as
begin
	delete from student where id = no;
end;
/


/*Normal reverse procedure*/
create or replace procedure 
	rev(pi IN varchar,po OUT varchar)
as
begin
 	select reverse(pi) into po from dual;
end;
/

/* execute procedure */

exec add_student(501,'TYH','IOP','05-dec-1976',66,'Noida','F');

exec update_name(110,'Gopu','Raval');

exec delete_student(109);

variable myp varchar2(100)
exec rev('ABCD',:myp)
print:myp

/*drop procedure*/
drop procedure list_s;
drop procedure show;
drop procedure add_student;
drop procedure update_name;
drop procedure delete_student;
drop procedure rev;
