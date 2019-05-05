SET SERVEROUTPUT ON;

-- TABLE: financial 
DECLARE
  total_sales financial.unitssold%type; 
 BEGIN
 SELECT SUM(financial.unitssold) INTO total_sales
 FROM financial 
 WHERE financial.SEGMENTS= 'Government';
 dbms_output.put_line ('Total amount of sold units for Goverment is:'|| total_sales); 
END;



--------------
-- TABLE: financial 

DECLARE
    total_sales     financial.unitssold%TYPE := 0;
    result_status   VARCHAR2(20);
BEGIN
    SELECT
        SUM(financial.unitssold)
    INTO
        total_sales
    FROM
        financial
    WHERE
        financial.segments = 'Government';

    dbms_output.put_line('Total amount of sold units for Goverment is: '|| total_sales);
 --------     
    IF
        total_sales > 400000
    THEN
        result_status := 'High';
        dbms_output.put_line('The result is  '|| result_status);
    ELSIF total_sales = 400000 THEN
        result_status := 'Ok';
        dbms_output.put_line('The result is  ' || result_status);
    ELSE
        result_status := 'low';
        dbms_output.put_line('The result is  ' || result_status);
    END IF;

END;



