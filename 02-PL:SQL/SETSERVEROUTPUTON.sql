set serveroutput on

DECLARE
    student_id number(9) NOT NULL := 32765283;
    student_name varchar2(20) := 'Brad Kingston';
    student_faculty CONSTANT varchar2(20) := 'Computer science';
BEGIN
    dbms_output.put_line('Student information:');
    dbms_output.put_line(' - Number: ' || student_id );
    dbms_output.put_line(' - Name: ' || student_name);
    dbms_output.put_line(' - Faculty: ' || student_faculty);
END;
