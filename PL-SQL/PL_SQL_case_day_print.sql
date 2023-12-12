
/*
Author : Jaydatt Patel
keyword 'case' : case will give value as per condition satisfy.
*/

DECLARE
	num number := &snum1;
	day varchar(20);

BEGIN
	day := case
		when num=0 then 'Sunday'
		when num=1 then 'Monday'
		when num=2 then 'Tuesday'
		when num=3 then 'Wedsday'
		when num=4 then 'Thursday'
		when num=5 then 'Friday'
		when num=6 then 'Saturday'
	else
		'Invalid'
	end;

	DBMS_OUTPUT.PUT_LINE('RESULT: '||day);

END;
/



