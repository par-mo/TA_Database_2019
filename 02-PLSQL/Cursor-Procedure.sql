
---------------------------------------------------------    
CREATE TABLE film_genre
(
    Genre_ID   Number(4)    NOT NULL,
    Genre_name Varchar2(20) NOT NULL,
     CONSTRAINT Genre_ID PRIMARY KEY ( Genre_ID )
); 

CREATE SEQUENCE film_genre_seq
  MINVALUE 1
  MAXVALUE 99
  START WITH 1
  INCREMENT BY 1
  CACHE 20;


INSERT INTO film_genre VALUES ( film_genre_seq.NEXTVAL, 'Action'    );
INSERT INTO film_genre VALUES ( film_genre_seq.NEXTVAL, 'Animation' );
INSERT INTO film_genre VALUES ( film_genre_seq.NEXTVAL, 'Comedy'    );
INSERT INTO film_genre VALUES ( film_genre_seq.NEXTVAL, 'Crime'     );
INSERT INTO film_genre VALUES ( film_genre_seq.NEXTVAL, 'Drama'     );
INSERT INTO film_genre VALUES ( film_genre_seq.NEXTVAL, 'Family'    );
-----------------------------------
 SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE genre_from_name2(str IN varchar2, cnumber out number  ) 
IS 
    cursor c1 is
    SELECT Genre_ID
    FROM film_genre
    WHERE Genre_name = str;
 
 BEGIN 
 
 open c1; 
 fetch c1 into cnumber; 
 
   close c1;
END; 

DECLARE 
c number;

BEGIN 
 genre_from_name2('Action',c); 
 INSERT INTO film VALUES ( 14, 'Monster, Inc.',    '01-01-2001', 'English', c, 2, 2, 5  );
 END; 
 
 
 
 
 
  
 