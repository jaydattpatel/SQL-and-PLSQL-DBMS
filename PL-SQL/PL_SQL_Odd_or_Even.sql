/*
Author : Jaydatt Patel
chech number is odd or over with mod
*/

DECLARE
	num number := &num;
	remainder number;

BEGIN

	remainder := mod(num,2);
	if remainder = 0 then 
		DBMS_OUTPUT.PUT_LINE('Even');
	else 
		DBMS_OUTPUT.PUT_LINE('Odd');
	end if;
END;
/