SET SERVEROUTPUT ON;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Welcome to DDS Lab');
END;
/

BEGIN
	NULL;
END;
/

--We can write DML (insert, update, delete etc.) in BEGIN-END Block
--But cannot write DDL (Create) in BEGIN-END Block

--BEGIN-END always returns a single row, that is why, we can not write [SELECT * FROM Table_Name] in that block
--But multiple rows can be fetchd by using loop.

BEGIN
	insert into money values (5, 'D', 500);
END;
/

commit;

DECLARE
	t_name varchar2(20);
	t_taka number;
BEGIN
	select name, taka into t_name, t_taka from money where id=5;
	DBMS_OUTPUT.PUT_LINE(t_name);
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/



--select * from money;