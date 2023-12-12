/*
Author : Jaydatt Patel
if-else statement with nested
*/

/*create table result */
create table result
	(	id int primary key, 
		name varchar(20),
		sub1_marks int,
		sub2_marks int,
		sub3_marks int,
		total int,
		average float,
		class varchar(10)
	);


/*create PL/SQL file for entry*/
DECLARE
	sno int := &sno;
	sname varchar(20) := '&sname';
	s1 int := &s1;
	s2 int := &s2;
	s3 int := &s3;
	total int;
	avr float;
	class varchar(10);

BEGIN

	total := s1+s2+s3;
	avr := total/3;
	if s1>=35 AND s2>=35 AND s3>=35 then
		if avr>60 then 
			class := 'first';
		end if;
		if avr>50 AND avr<60 then 
			class := 'second';
		end if;
		if avr>40 AND avr<50 then 
			class := 'third';
		end if;
	else
		class := 'fail';
	end if;

	insert  into result values(sno,sname,s1,s2,s3,total,avr,class);
END;
/
	