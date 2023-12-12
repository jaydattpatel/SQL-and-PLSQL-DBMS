
/*
Author : Jaydatt Patel

NULLIF : The NULLIF() function returns NULL if two expressions are equal, 
		otherwise it returns the first expression.

syntax: NULLIF(expr1, expr2)

*/

DECLARE
	num NUMBER := 0;
	remainder NUMBER := 0;
	temp_num number;
	temp_string varchar(20);

BEGIN

	SELECT NULLIF(25, 25) into temp_num from dual;
	DBMS_OUTPUT.PUT_LINE('NULLIF(25, 25) : ' || temp_num);

	SELECT NULLIF(25, 30) into temp_num from dual;
	DBMS_OUTPUT.PUT_LINE('NULLIF(25, 30) : ' || temp_num);

	SELECT NULLIF('Hello', 'Hello') into temp_string from dual;
	DBMS_OUTPUT.PUT_LINE('NULLIF(Hello, Hello) : ' || temp_string);

	SELECT NULLIF('Hello', 'World') into temp_string from dual;
	DBMS_OUTPUT.PUT_LINE('NULLIF(Hello, World) : ' || temp_string);

	remainder := NULLIF(MOD(num,2),0);
	DBMS_OUTPUT.PUT_LINE('NULLIF(MOD(num,2),0) : ' || remainder);

END;
/