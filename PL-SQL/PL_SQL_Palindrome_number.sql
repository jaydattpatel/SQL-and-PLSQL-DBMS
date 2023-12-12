/*
Author : Jaydatt Patel
chech number is palindrom or not
*/
declare
	num int;
	temp int;
	reverse int;
	remainder int;

begin 
	num := 12321;
	temp := num;
	reverse := 0;

	while(temp>0)
	loop
		remainder := mod(temp,10);
		reverse := reverse * 10 + remainder;
		temp := temp/10;
	end loop;
	if num=reverse then
		dbms_output.put_line('number is palindrome');
	else
		dbms_output.put_line('number is not palindrome');
	end if;
end;
/