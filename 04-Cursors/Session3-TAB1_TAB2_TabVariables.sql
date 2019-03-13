SET Serveroutput ON; 
--------Two new tables creation ---------
CREATE TABLE tab1 (x1 NUMBER, y1 VARCHAR2(20), z1 VARCHAR2(40)) TABLESPACE users;
CREATE TABLE tab2 (x2 NUMBER, y2 NUMBER, z2 NUMBER) TABLESPACE users;
-----INSERT values in new table tab1 ---------
DECLARE
  i   NUMBER := 0;
BEGIN
  FOR i IN 0 .. 13
  LOOP
     INSERT INTO tab1(x1, y1, z1)
          VALUES (i, dbms_random.string('l',20), dbms_random.string('l',40));
  END LOOP;
END;
/
-------INSERT values in new table tab2 ---------
DECLARE
  i   NUMBER := 0;
BEGIN
  FOR i IN 0 .. 6
  LOOP
     INSERT INTO tab2(x2, y2, z2)
          VALUES (i, TRUNC(dbms_random.value*1000), TRUNC(dbms_random.value*100));
                 END LOOP;
END;
/
-------Queries---------
SELECT * FROM tab1;
SELECT * FROM tab2; 


------ New part --------

DECLARE
  TYPE tab1_tab_type IS TABLE OF tab1%ROWTYPE
     INDEX BY BINARY_INTEGER;

  i              INTEGER     := 0;
  tab1_tab         tab1_tab_type;
  tab1_tab_empty   tab1_tab_type;

  CURSOR c_1
  IS
     SELECT x1, y1, z1
       FROM tab1;

  CURSOR c_2
  IS
     SELECT x2, TO_CHAR (y2), TO_CHAR (z2)
       FROM tab2;
BEGIN
  FOR c_c IN c_1
  LOOP
     tab1_tab (i) := (c_c);
     i := i + 1;
  END LOOP;

  FOR c_c IN c_2
  LOOP
     tab1_tab (i) := (c_c);
     i := i + 1;
  END LOOP;

  FOR my_row IN 0 .. i - 1
  LOOP
     DBMS_OUTPUT.put_line (   RPAD (TO_CHAR (tab1_tab (my_row).x1), 9)
                           || RPAD (tab1_tab (my_row).y1, 30)
                           || RPAD (tab1_tab (my_row).z1, 30)
                          );
  END LOOP;

  tab1_tab := tab1_tab_empty;  --erase tab1_tab of all values
END;
/











