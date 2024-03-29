-- Procedure: Receive parameters but does not return anything

SET SERVEROUTPUT ON;

-- IN , OUT TYPE VARIABLE

CREATE OR REPLACE PROCEDURE isEven (A IN MONEY.ID%TYPE, B OUT MONEY.ID%TYPE) IS

BEGIN
	B := 10;
	DBMS_OUTPUT.PUT_LINE(A);
END isEven;
/

DECLARE 
	NUM MONEY.ID%TYPE;
BEGIN
	isEven(2, NUM);
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/


-- IN OUT VARIABLE


CREATE OR REPLACE PROCEDURE isOdd (A IN OUT MONEY.ID%TYPE) IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	A := 10;
END isOdd;
/

DECLARE 
	NUM MONEY.ID%TYPE;
BEGIN
	NUM := 5;
	isOdd(NUM);
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/