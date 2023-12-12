/*
Author : Jaydatt Patel
chech string is palindrom
*/

/* Solution-1 */
declare
	 ss varchar(100) := 'madam';
	 rev varchar(100);

begin 

   	select reverse(ss) into rev from dual;

	if ss=rev then
		dbms_output.put_line('palindrome');
	else
		dbms_output.put_line('Not palindrome');
	end if;

end;
/

/* Solution-2 */
declare
	 ss varchar(100) := 'madam';
	 rev varchar(100);
	 i number;
	 j number;
	 ch char;

begin 
	i := length(ss);
	j := i;
	while(j>0)
	loop
		ch := substr(ss,j,1);
		rev := rev || ch;
		j := j - 1;
	end loop;

	if ss=rev then
		dbms_output.put_line('palindrome');
	else
		dbms_output.put_line('Not palindrome');
	end if;
	
end;
/

/* Solution-3 */
declare
	 ss varchar(100) := 'madam';
	 rev varchar(100);
	 i number;
	 j number;
	 ch char;

begin 
	i := length(ss);
	for j in reverse 1..i
	loop
		ch := substr(ss,j,1);
		rev := rev || ch;
	end loop;

	if ss=rev then
		dbms_output.put_line('palindrome');
	else
		dbms_output.put_line('Not palindrome');
	end if;
	
end;
/