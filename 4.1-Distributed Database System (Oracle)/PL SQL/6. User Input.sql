SET VERIFY OFF;
SET SERVEROUTPUT ON;

--INTEGER INPUT

DECLARE
	A int := &x;
	B int := &y;
BEGIN
	DBMS_OUTPUT.PUT_LINE(A+B);
END;
/

-- CHARACTER INPUT

DECLARE
	A varchar2(50) := '&Enter_Name';
	B varchar2(50) := '&Enter_Address';
BEGIN
	DBMS_OUTPUT.PUT_LINE(A || ' ' || B);
END;
/