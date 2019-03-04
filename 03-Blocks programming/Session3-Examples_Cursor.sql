------Cursor without parameters (simplest)------
--------------EXAMPLE 1------------
SET Serveroutput ON; 
CREATE OR REPLACE Function FindDirector
   ( name_in IN varchar2 )
   
   RETURN number
IS
   cnumber number;

   CURSOR cursor1
   IS
     SELECT director_id
     FROM directors
     WHERE director_last_name = name_in;

BEGIN

   OPEN cursor1;
   FETCH cursor1 INTO cnumber;

   if cursor1%notfound then
      cnumber := 1;
   end if;

   CLOSE cursor1;

RETURN cnumber;

END;
/
--
DECLARE -- Calling the function
y number (2); 
BEGIN 
y:= FindDirector('Bird');
Dbms_Output.Put_Line('Director ID is  '||y);
END;
/

----------------- Directors table (TP1) --------
--------------------EXAMPLE 2------------------
SET Serveroutput ON; 
DECLARE  
   total_rows number(2); 
BEGIN 
   UPDATE directors 
   SET director_salary = director_salary + 500; 
   IF sql%notfound THEN 
      dbms_output.put_line('no directors selected'); 
   ELSIF sql%found THEN 
      total_rows := sql%rowcount;
      dbms_output.put_line( total_rows || ' directors selected '); 
   END IF;  
END; 
/ 
-----------------EXAMPLE 3--------------------
DECLARE 
   c_id directors.director_id%type; 
   c_name directors.director_last_name%type; 
   c_salary directors.director_salary%type; 
   CURSOR c_directors is 
      SELECT director_id, director_last_name, director_salary FROM directors; 
BEGIN 
   OPEN c_directors; 
   LOOP 
   FETCH c_directors into c_id, c_name, c_salary; 
      EXIT WHEN c_directors%notfound; 
      dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_salary); 
   END LOOP; 
   CLOSE c_directors; 
END; 
/
----------------- EXMPLE 4----------------
--- cursor with parameters 
SET Serveroutput ON; 
DECLARE
    rec_director directors%ROWTYPE;
    CURSOR cur_director (low_salary NUMBER, high_salary NUMBER)
    IS
        SELECT *
        FROM directors
        WHERE director_salary BETWEEN low_salary AND high_salary;
BEGIN
    -- Rich director
    DBMS_OUTPUT.PUT_LINE('Rich director: ');
    OPEN cur_director(80000,180000);
    LOOP
        FETCH cur_director INTO rec_director;
        EXIT WHEN cur_director%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(rec_director.director_last_name || ': ' ||rec_director.director_salary);
    END LOOP;
    CLOSE cur_director;
 
    -- Very rich directors
    DBMS_OUTPUT.PUT_LINE( '---- ' );

    DBMS_OUTPUT.PUT_LINE('Very rich directors: ');
    OPEN cur_director(180000,300000);
    LOOP
        FETCH cur_director INTO rec_director;
        EXIT WHEN cur_director%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(rec_director.director_last_name || ': ' ||rec_director.director_salary);
    END LOOP;
    CLOSE cur_director;
 
END;






