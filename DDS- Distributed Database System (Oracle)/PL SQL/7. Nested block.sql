/*
Problem: Write a PL/SQL  code to implement the following-
-> Prompt to user: "Enter last 3 digits of your ID = "
-> Nested anonymous blocks (BEGIN-END)
-> Take input in the outer block
-> Check even-odd in the inner block
-> Print even-odd in the outer block
*/

SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT "Enter Last 3 Digits of Your ID= ";

DECLARE
	A NUMBER;
	B INT;

BEGIN
	A := &X;
	B := 0;
	BEGIN
		-- A := &X; [Possible to take input in inner block]	
		B := MOD(A,2);
	END;
	
	IF B = 0 THEN
		DBMS_OUTPUT.PUT_LINE('ZERO');
	ELSE
		DBMS_OUTPUT.PUT_LINE('ONE');
	END IF;

END;
/

ACCEPT Y CHAR PROMPT "Enter your name = ";

DECLARE 
	NAME VARCHAR2(20);
BEGIN
	NAME := '&Y'; --[WARNING: Always put single inverted comma while taking string input]
	DBMS_OUTPUT.PUT_LINE('WOOOW ' || NAME || ' IS A VERY NICE NAME');
END;
/