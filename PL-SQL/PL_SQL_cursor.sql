/*
Author : Jaydatt Patel

cursor to point record of table
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

create table contact
	(	id int primary key, 
		email varchar(20),
		mobile varchar(15) );

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


/* Pl-Sql quiry  - 1*/
DECLARE

cursor cur_point is select id, firstname, result from student;

no student.id%type;
name student.firstname%type;
marks student.result%type;


BEGIN

	open cur_point;
	loop
		exit when cur_point%notfound;
		fetch cur_point into no,name, marks;
		if (marks <= 70) then
			dbms_output.put_line('No: '||no || ', Name: ' || name ||', marks: '|| marks);
		end if;
	end loop;
	close cur_point;

END;
/



/* Pl-Sql quiry  - 2*/

DECLARE
 	cursor cur is select * from student;
 	st student%rowtype;

BEGIN
	open cur;
	loop
		fetch cur into st;
		exit when (cur%rowcount > 5);
		dbms_output.put_line('-----------------------');
		dbms_output.put_line('Id : ' || st.id || 
							' Name : ' || st.firstname ||' '||st.lastname);
	end loop;
	dbms_output.put_line('cut%rowcount : ' || cur%rowcount);
	close cur;
END;
/

/* Pl-Sql quiry  - 3 */

DECLARE
 	cursor cur is select student.id, student.firstname, student.result,
 		contact.email,contact.mobile from student
 		left outer join contact on student.id = contact.id ;
	no student.id%type;
	name student.firstname%type;
	marks student.result%type;
	em contact.email%type;
	ml contact.mobile%type;


BEGIN
	open cur;
	loop
		fetch cur into no,name,marks,em,ml;
		exit when (cur%rowcount > 8);
		dbms_output.put_line('-----------------------');
		dbms_output.put_line('Id : ' || no || 
							' Name : ' || name ||
							'Marks: ' || marks || 
							' Email : ' || em ||
							'Mobile : ' || ml);
	end loop;
	dbms_output.put_line('cut%rowcount : ' || cur%rowcount);
	close cur;
END;
/
