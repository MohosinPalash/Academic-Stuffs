SET SERVEROUTPUT ON; 

--Variable Declaration
/*
DECLARE
	t_name varchar2(20);
	t_taka number;
BEGIN
	select name, taka into t_name, t_taka from money where id=5;
	DBMS_OUTPUT.PUT_LINE(t_name);
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/
*/

-- Anchors: Variable Declaration
/*
DECLARE
	t_name money.name%TYPE;
	t_taka money.taka%TYPE;
BEGIN
	select name, taka into t_name, t_taka from money where id=1;
	DBMS_OUTPUT.PUT_LINE(t_name);
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/
*/

-- Assignment Operator
/*
DECLARE
	t_taka money.taka%TYPE;
BEGIN
	t_taka := 500;
	update money set taka=t_taka where id =1;
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/
*/

-- Variable Initialize

DECLARE
	t_taka money.taka%TYPE := 700;
BEGIN
	update money set taka=t_taka where id =1;
	DBMS_OUTPUT.PUT_LINE(t_taka);
END;
/

commit;

select * from money;
