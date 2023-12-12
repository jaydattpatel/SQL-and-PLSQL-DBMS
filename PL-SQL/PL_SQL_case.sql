
/*
Author : Jaydatt Patel
keyword 'case' : case will give value as per condition satisfy.
*/

DECLARE
	num1 number := &snum1;
	num2 number := &snum2;
	num3 number := &snum3;
	result number;

BEGIN
	/*case will give value as per condition satisfy.*/
	v_result := CASE
		WHEN num1 IS NOT NULL THEN num1
		WHEN num2 IS NOT NULL THEN num2
	ELSE 
		num3
	END;
	DBMS_OUTPUT.PUT_LINE('RESULT: '||result);

END;
/



