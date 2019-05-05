/*
    DATABASE course SPRING 2019
      Solution : Exercise 1 
    M. Parhizkar 
    
*/ 
----------------------------------------
--DROP TABLE FILM CASCADE CONSTRAINTS; 
--DROP TABLE company CASCADE CONSTRAINTS;
--DROP TABLE MAIN_ACTOR CASCADE CONSTRAINTS; 
--DROP TABLE DIRECTOR CASCADE CONSTRAINTS; 
----------------------------------------
----------------- TABLE : Company -----------------------

CREATE TABLE company (
    company_id        NUMBER(4)  NOT NULL,
    company_name      VARCHAR2(30) NOT NULL,
    company_country   VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_company PRIMARY KEY ( company_id ) --Company: primary key 
);
----------------- TABLE : Main_actor -----------------------
CREATE TABLE main_actor (
    main_actor_id   NUMBER(4)  NOT NULL,
    first_name      VARCHAR2(20) NOT NULL,
    last_name       VARCHAR2(20) NOT NULL,
    birthday        DATE NOT NULL,
    country         VARCHAR2(20),
    CONSTRAINT PK_main_actor PRIMARY KEY ( main_actor_id )--Main_actor: primary key
);
------------------ TABLE :  director ----------------------
CREATE TABLE director (
    director_id           NUMBER(4) NOT NULL ,
    director_first_name   VARCHAR2(20),
    director_last_name    VARCHAR2(20) NOT NULL,
    director_bd           DATE,
    country               VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_director PRIMARY KEY ( director_id )--Director: primary key
);
---------------- TABLE : film ------------------------
CREATE TABLE film (
    film_id         NUMBER(4)  NOT NULL,
    title           VARCHAR2(35) NOT NULL,
    year            DATE NOT NULL,
    language        VARCHAR2(20),
    director_id     NUMBER(4) NOT NULL,
    main_actor_id   NUMBER(4) NOT NULL,
    company_id      NUMBER(4) NOT NULL,
    category        VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_film PRIMARY KEY ( film_id ), --film: primary key
    CONSTRAINT fK_film_main_actor FOREIGN KEY (main_actor_id) REFERENCES main_actor, -- main_actor:  FOREIGN KEY Constraint
    CONSTRAINT fK_film_director FOREIGN KEY (director_id) REFERENCES director,-- director:  FOREIGN KEY Constraint
    CONSTRAINT fK_film_company  FOREIGN KEY (company_id) REFERENCES company-- company:  FOREIGN KEY Constraint
);



-------------------------------------------------------- DATA ------------------------------------------------------------------------------------
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (1,'Ivan','Reitman',     TO_DATE('1946','YYYY'),'Slovakia');
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (2,'Joseph','Mankiewicz',TO_DATE('1909','YYYY'),'USA');
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (3,'John','Lasseter',TO_DATE('1957','YYYY'),'USA');
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (4,'Pete','Doctor',NULL,'USA');
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (5,'James','Cameron',TO_DATE('1954','YYYY'),'Canada');
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (6,'Paul','Haggis',TO_DATE('1953','YYYY'),'Canada');
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (7,'Brad','Bird',NULL,'USA');
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (8,'Henry','Hobson',TO_DATE('1985','YYYY'),'USA');
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (9,'Steven','Soderbergh',TO_DATE('1963','YYYY'),'USA');
INSERT INTO DIRECTOR (Director_ID, Director_First_Name, Director_Last_Name, Director_BD, Country) VALUES (10,'Jason','Reitman',NULL,'Canada');
---------------------------------
INSERT INTO COMPANY (Company_ID, Company_Name, Company_Country) VALUES (1, 'Imagine Entertainment', 'USA');
INSERT INTO COMPANY (Company_ID, Company_Name, Company_Country) VALUES (2, 'Pixar', 'USA');
INSERT INTO COMPANY (Company_ID, Company_Name, Company_Country) VALUES (3, 'Twentieth Fox', 'USA');
INSERT INTO COMPANY (Company_ID, Company_Name, Company_Country) VALUES (4, 'Bob Yari Production', 'USA');
INSERT INTO COMPANY (Company_ID, Company_Name, Company_Country) VALUES (5, 'Carolco Picture', 'USA');
INSERT INTO COMPANY (Company_ID, Company_Name, Company_Country) VALUES (6, 'Lionsgate', 'USA');
INSERT INTO COMPANY (Company_ID, Company_Name, Company_Country) VALUES (7, 'Warner Bros', 'USA');
INSERT INTO COMPANY (Company_ID, Company_Name, Company_Country) VALUES (8, 'Paramount Picture', 'USA');
INSERT INTO COMPANY (Company_ID, Company_Name, Company_Country) VALUES (9, 'Bedford Falls Company', 'USA');
---------------------------------
INSERT INTO MAIN_ACTOR (Main_Actor_ID, First_Name, Last_Name, Birthday, Country) VALUES (1, 'Arnold', 'Schwarzenger', TO_DATE('1947','YYYY'), 'Austria');
INSERT INTO MAIN_ACTOR (Main_Actor_ID, First_Name, Last_Name, Birthday, Country) VALUES (2, 'Billy', 'Crystal', TO_DATE('1948','YYYY'), 'USA');
INSERT INTO MAIN_ACTOR (Main_Actor_ID, First_Name, Last_Name, Birthday, Country) VALUES (3, 'Owen', 'Wilson', TO_DATE('1968','YYYY'), 'USA');
INSERT INTO MAIN_ACTOR (Main_Actor_ID, First_Name, Last_Name, Birthday, Country) VALUES (4, 'Don', 'Cheadle', TO_DATE('1964','YYYY') , NULL);
INSERT INTO MAIN_ACTOR (Main_Actor_ID, First_Name, Last_Name, Birthday, Country) VALUES (5, 'Brad', 'Garrett', TO_DATE('1960','YYYY') , 'USA');
INSERT INTO MAIN_ACTOR (Main_Actor_ID, First_Name, Last_Name, Birthday, Country) VALUES (6, 'Sam', 'Worthington', TO_DATE('1976','YYYY'), 'UK');
INSERT INTO MAIN_ACTOR (Main_Actor_ID, First_Name, Last_Name, Birthday, Country) VALUES (7, 'Bette', 'Davis', TO_DATE('1908','YYYY'), NULL );
INSERT INTO MAIN_ACTOR (Main_Actor_ID, First_Name, Last_Name, Birthday, Country) VALUES (8, 'George', 'Clooney', TO_DATE('1961','YYYY'), 'USA');
INSERT INTO MAIN_ACTOR (Main_Actor_ID, First_Name, Last_Name, Birthday, Country) VALUES (9, 'Michael', 'Douglas', TO_DATE('1944','YYYY'), 'USA');
---------------------------------
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (1, 'Monster, Inc.', TO_DATE('2001','YYYY'), 'English', 'Animation', 2, 2, 5);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (2, 'Kindergarten Cop.', TO_DATE('1990','YYYY'), 'English', 'Comedy', 1, 1, 1);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (3, 'Ratatouille', TO_DATE('2007','YYYY'), 'English', 'Animation', 5, 2,7);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (4, 'Cars', TO_DATE('2006','YYYY'), NULL, 'Family', 2, 2,3);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (5, 'All about Eve', TO_DATE('1950','YYYY'), 'English', 'Drama', 7, 3, 2);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (6, 'Crash', TO_DATE('2004','YYYY'), 'English', 'Crime', 4, 4, 6);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (7, 'Terminator 2', TO_DATE('1991','YYYY'), 'English', 'Action', 1, 4, 5);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (8, 'Ocean’s twelve', TO_DATE('2004','YYYY'), 'English', 'Crime', 8, 7, 9);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (9, 'Avatar', TO_DATE('2009','YYYY'), 'English', 'Action', 6, 3, 5);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (10, 'Solaris', TO_DATE('2002','YYYY'), 'English', 'Drama', 8, 3, 9);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (11, 'Up in the air', TO_DATE('2009','YYYY'), NULL,'Drama', 8, 8, 10);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (12, 'Traffic', TO_DATE('2000','YYYY'), 'English', 'Crime', 9, 9, 9);
INSERT INTO FILM (Film_ID, Title, Year, Language, Category, Main_Actor_ID, Company_ID, Director_ID) VALUES (13, 'Maggie', TO_DATE('2015','YYYY'), 'English', 'Drama', 1, 6, 8);
