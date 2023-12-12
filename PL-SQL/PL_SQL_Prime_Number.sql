/*
Author : Jaydatt Patel
Print Prime Number
*/

declare
	i number;
	j number;
	flag number;
	rem number := 0;
begin
	for i in 2..50
	loop
		flag := 0;
		j := 2;
		
		while(j < i)
		loop
				rem := mod(i,j);
				if (rem = 0) then 
					flag := 1;
					exit when (flag = 1);
				end if;
				j := j + 1;
		end loop;
		
		if(flag = 0) then
			dbms_output.put_line(i);
		end if;
		
	end loop;
end;

/	