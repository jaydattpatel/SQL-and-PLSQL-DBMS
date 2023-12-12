/*
Author : Jaydatt Patel

exception handling
*/
DECLARE

	a int := &a;
	b int := &b;
	ans int;

BEGIN

	ans := a/b;
	dbms_output.put_line('The result after division : ' || ans);

EXCEPTION

	WHEN zero_divide THEN
			dbms_output.put_line('Division by zero, please check your values');
			dbms_output.put_line('a = ' || a);
			dbms_output.put_line('b = ' || b);
END;
/