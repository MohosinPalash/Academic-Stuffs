SET SERVEROUTPUT ON;

DECLARE
	A MONEY.NAME%TYPE;
	B MONEY.TAKA%TYPE;

BEGIN
	
	FOR i IN (SELECT NAME, TAKA FROM MONEY) LOOP
		A := i.NAME;
		B := i.taka;
		DBMS_OUTPUT.PUT_LINE('NAME = ' || A || ' BALANCE = ' || B);
	END LOOP;
END;
/