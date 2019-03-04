----Records----
---Example1: The following example illustrates the concept of table-based records: 
SET SERVEROUTPUT ON;
DECLARE 
   director_rec directors%rowtype; 
BEGIN 
   SELECT * into director_rec 
   FROM directors 
   WHERE director_id = 5;  
   dbms_output.put_line('Director ID: ' || director_rec.director_id); 
   dbms_output.put_line('Director First Name: ' || director_rec.director_first_name); 
   dbms_output.put_line('Director Last Name: ' || director_rec.director_last_name); 
   dbms_output.put_line('Director Salary: ' || director_rec.director_salary); 
END; 
/

-----Example 2: Cursor-based records 
DECLARE 
   CURSOR director_cur is 
      SELECT director_id, director_first_name, director_last_name  
      FROM directors; 
   director_rec director_cur%rowtype; 
BEGIN 
   OPEN director_cur; 
   LOOP 
      FETCH director_cur into director_rec; 
      EXIT WHEN director_cur%notfound; 
      DBMS_OUTPUT.put_line(director_rec.director_id || ' ' || director_rec.director_last_name); 
   END LOOP; 
END; 
/




