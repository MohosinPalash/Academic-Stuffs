--All Exception List: https://docs.oracle.com/cd/B14117_01/appdev.101/b10807/07_errs.htm

SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
	A MONEY.TAKA%TYPE;
	B NUMBER := -2;
	RES NUMBER;
	customException EXCEPTION;
BEGIN

	SELECT TAKA INTO A FROM MONEY WHERE ID=1;
	
	IF B < 0 THEN
		RAISE customException;
	END IF;
	
	RES := A/B;
	
EXCEPTION
	WHEN customException THEN
		DBMS_OUTPUT.PUT_LINE('Divisor is negative!');
		RES := A / ((-1) * B);
		DBMS_OUTPUT.PUT_LINE(RES);
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('Multiple Rows Found!');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No data found!');
	WHEN ZERO_DIVIDE THEN
		DBMS_OUTPUT.PUT_LINE('Divided by zero!');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('Others Error Found!');

END;
/