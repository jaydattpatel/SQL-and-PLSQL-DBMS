/*
Author : Jaydatt Patel
find mod or remainder
*/

DECLARE
	num number := &num;
	remainder number;

BEGIN

	remainder := mod(num,2);
	DBMS_OUTPUT.PUT_LINE('Remainder : ' || remainder);
END;
/