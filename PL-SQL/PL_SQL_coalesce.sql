
/*
Author : Jaydatt Patel
function 'coalesce' : find first not null value and return that value
*/
DECLARE
	num1 number := &snum1;
	num2 number := &snum2;
	num3 number := &snum3;
	result number;

BEGIN
	/*find first not null value and return that value */
	result := coalesce(num1, num2, num3);
	DBMS_OUTPUT.PUT_LINE('Result : ' || result);

END;
/

/*
Enter value for snum1: NULL
Enter value for snum2: 5
Enter value for snum3: 7
Result : 5
*/