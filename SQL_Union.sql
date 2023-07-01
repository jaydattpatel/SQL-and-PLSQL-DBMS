/*
Author : Jaydatt Patel

Union:
UNION is an SQL operator which combines the result of two 
or more SELECT queries and provides the single set in the output.

Syntax of UNION in SQL:

SELECT Column_Name_1, Column_Name_2 ...., Column_NameN FROM Table_Name_1  
UNION   
SELECT Column_Name1, Column_Name_2 ...., Column_Name_N FROM Table_Name_2  
UNION
.
.
. 
UNION  
SELECT Column_Name1, Column_Name_2 ...., Column_Name_N FROM Table_Name_N ;  
 */

CREATE TABLE New_Employee  
(  
Employee_Id INT NOT NULL,   
Employee_Name Varchar (40),  
Emp_Age INT,  
Emp_Salary INT  
);  

CREATE TABLE Old_Employee  
(  
Employee_Id INT NOT NULL,   
Employee_Name Varchar (40),  
Emp_Age INT,  
Emp_Salary INT  
);  

INSERT INTO Old_Employee VALUES 
	(101, 'Akhil', 28, 25000),  
	(102, 'Abhay', 27, 26000),  
	(103, 'Sorya', 26, 29000),  
	(104, 'Abhishek', 27, 26000),  
	(105, 'Ritik', 26, 29000),  
	(106, 'Yash', 29, 28000); 

INSERT INTO New_Employee VALUES 
	(201, 'Jack', 28, 45000),  
	(202, 'Berry', 29, 35000),  
	(105, 'Ritik', 26, 29000),  
	(203, 'Shyam', 27, 26000),  
	(204, 'Ritika', 28, 38000),  
	(106, 'Yash', 29, 28000);  

SELECT * FROM Old_Employee
	UNION 
		SELECT * FROM New_Employee;