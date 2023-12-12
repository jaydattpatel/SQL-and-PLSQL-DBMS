/*

Author : Jaydatt Patel

create trigger:

	Triggers are stored programs, which are automatically 
	executed or fired when some events occur. Triggers are, 
	in fact, written to be executed in response to any of the 
	following events −

A database manipulation (DML) statement 
(DELETE, INSERT, or UPDATE)

A database definition (DDL) statement 
(CREATE, ALTER, or DROP).

A database operation 
(SERVERERROR, LOGON, LOGOFF, STARTUP, or SHUTDOWN).

syntax: 
CREATE [OR REPLACE ] TRIGGER trigger_name  
	{BEFORE | AFTER | INSTEAD OF }  
{INSERT [OR] | UPDATE [OR] | DELETE}  
[OF col_name]  
	ON table_name  
[REFERENCING OLD AS o NEW AS n]  
	[FOR EACH ROW]  
WHEN (condition)   
DECLARE 
   Declaration-statements 
BEGIN  
   Executable-statements 
EXCEPTION 
   Exception-handling-statements 
END; 

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


/*create trigger*/
create or replace trigger 
	trig_before before 
	delete or insert or update on student
	for each row 
	when (new.id > 0)

declare
	
begin
	dbms_output.put_line('Trigger before');
	dbms_output.put_line('New value : ' || :new.result);
	dbms_output.put_line('Old value : ' || :old.result);
end;
/

create or replace trigger 
	trig_after after 
	delete or insert or update on student
	for each row 
	when (new.id > 0)

declare
	
begin
	dbms_output.put_line('Trigger after');
	dbms_output.put_line('New value : ' || :new.result);
	dbms_output.put_line('Old value : ' || :old.result);
end;
/


/* execute trigger */

update student set firstname = 'Bhavik', lastname = 'Roy' where id = 110;
insert into student values(201,'Manan','Panchal','11-jan-1980',78,'Mumbai','M'),