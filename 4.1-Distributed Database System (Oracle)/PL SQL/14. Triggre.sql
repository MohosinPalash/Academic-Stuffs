SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- Statement level trigger: no operatin but shows the trigger [It shows single time even though multilpe row is affected]
-- Row level trigger: must affect one or more row and show the trigger [It shows every time if a row is affected]

CREATE OR REPLACE TRIGGER INSERT_MSG
AFTER INSERT ON MONEY

DECLARE

BEGIN
	DBMS_OUTPUT.PUT_LINE('ROW INSERTED');
END;
/

CREATE OR REPLACE TRIGGER EXEC_MSG1
AFTER INSERT OR DELETE ON MONEY

DECLARE

BEGIN
	DBMS_OUTPUT.PUT_LINE('EXECUTED!');
END;
/

-- Statement level trigger
CREATE OR REPLACE TRIGGER EXEC_MSG2
AFTER UPDATE ON MONEY

DECLARE

BEGIN
	DBMS_OUTPUT.PUT_LINE('UPADTED [STATEMENT LEVEL]!');
END;
/

-- Row level trigger
CREATE OR REPLACE TRIGGER EXEC_MSG3
AFTER UPDATE OF TAKA ON MONEY FOR EACH ROW

DECLARE

BEGIN
	DBMS_OUTPUT.PUT_LINE('UPADTED [ROW LEVEL]!');
END;
/


-- Trigger is not used to show message it may also performs operation
-- Now we will store the old data in a new table before updating 


drop table money1;

create table money1 (id number, name varchar2(20), taka number);

commit;


CREATE OR REPLACE TRIGGER STORE_VALUE
BEFORE UPDATE ON MONEY FOR EACH ROW

DECLARE
	A MONEY.ID%TYPE;
	B MONEY.NAME%TYPE;
	C MONEY.TAKA%TYPE;

BEGIN
	A := :OLD.ID;
	B := :OLD.NAME;
	C := :OLD.TAKA;
	INSERT INTO MONEY1 VALUES (A, B, C);
END;
/