/*
Database Course 
Session 4
18/03/2019
Author: M. Parhizkar 
*/



-- database: financial 
SET SERVEROUTPUT ON;

-- New procedure: bestunitssold
CREATE OR REPLACE PROCEDURE bestunitssold AS 

max_unit financial.unitssold%TYPE; 
best_unit financial.segments%TYPE;
-- best_unit has same datatype as financial.segments

BEGIN
    SELECT MAX(unitssold) INTO max_unit FROM financial; 
    SELECT  segments INTO   best_unit FROM financial WHERE unitssold=(SELECT MAX(unitssold) FROM financial);
    
    dbms_output.put_line(best_unit || ' - max:  ' || max_unit );
    
END;
/


-- execute the procedure bestunitssold
BEGIN
    bestunitssold;
END;




