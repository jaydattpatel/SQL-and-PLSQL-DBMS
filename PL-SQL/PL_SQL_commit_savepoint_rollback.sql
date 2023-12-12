/*
Author : Jaydatt Patel

Operation :	Commit-savepoint-rollback
*/

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
insert into student values(999,'Rahul','Shah','01-dec-1990',85,'Ahmedabad','M');


/*PL-SQL quiry*/

DECLARE
	no student.id%type;
	fnm student.firstname%type;
	lnm student.lastname%type;
	ct student.city%type;
	gen student.gender%type;

BEGIN
	no := &no;
	fnm := '&fnm';
	lnm := '&lnm';
	ct := '&ct';
	gen := '&gen';
	insert into student values(no,fnm,lnm,NULL,NULL,ct,gen);
	dbms_output.put_line('One Record Entered');
	COMMIT;

	--adding savepoint
	SAVEPOINT savehere;

	--Second row insert
	no := &no;
	fnm := '&fnm';
	lnm := '&lnm';
	ct := '&ct';
	gen := '&gen';
	insert into student values(no,fnm,lnm,NULL,NULL,ct,gen);
	dbms_output.put_line('Second Record Rolled Back');
	ROLLBACK TO savehere;

END;
/
	