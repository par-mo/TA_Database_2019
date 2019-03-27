CREATE TABLE professors( 
professor_id numeric (20) not null,
professor_name varchar2(75) not null,
faculty_name varchar2(75),
CONSTRAINT prof_pk PRIMARY KEY (professor_id)
);


CREATE TABLE uni_courses( 
uni_course_id numeric (20) not null,
professor_id numeric (20)   not null,
CONSTRAINT fk_professors
FOREIGN KEY (professor_id)
REFERENCES professors (professor_id)
);

 ---------------------------

INSERT INTO uni_courses
(uni_course_id, professor_id)
VALUES (250, 600) ;

----------
INSERT INTO professors
(professor_id, professor_name, faculty_name)
VALUES (600,'John Smith','Math');

