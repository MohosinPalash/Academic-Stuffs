-- Function: Both receive parameters and return values

SET SERVEROUTPUT ON;

-- Without Parameter

CREATE OR REPLACE FUNCTION testFunction RETURN NUMBER IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(15);
	RETURN 10;
END testFunction;
/

DECLARE 
	NUM NUMBER;
BEGIN
	NUM := testFunction;
	DBMS_OUTPUT.PUT_LINE(NUM);
END;
/

-- With Parameter
-- NOTE: A function can return only single value but bu using out type parameter we can return multiple values

CREATE OR REPLACE FUNCTION testFunction (A IN MONEY.ID%TYPE, B OUT MONEY.ID%TYPE) 
RETURN NUMBER IS

BEGIN
	DBMS_OUTPUT.PUT_LINE(A);
	B := 113;
	RETURN A+10;
END testFunction;
/

DECLARE 
	NUM NUMBER;
	NUM_OUT NUMBER;
BEGIN
	NUM := testFunction(7, NUM_OUT);
	DBMS_OUTPUT.PUT_LINE(NUM || ' ' || NUM_OUT);
END;
/