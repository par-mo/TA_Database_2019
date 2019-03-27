/*
    DATABASE course SPRING 2019
      Solution : Exercise 2 
    M. Parhizkar 
    
*/ 
------------------------------Q.  1------------------------------
DROP SEQUENCE seq_company_id;
DROP SEQUENCE seq_actor_id;
DROP SEQUENCE seq_director_id;
DROP SEQUENCE seq_film_id;

CREATE SEQUENCE seq_film_id MINVALUE 1 MAXVALUE 20 START WITH 1 INCREMENT BY 1 CACHE 20;
CREATE SEQUENCE seq_main_actor_id MINVALUE 1 MAXVALUE 10 START WITH 1 INCREMENT BY 1 CACHE 20;
CREATE SEQUENCE seq_company_id MINVALUE 1 MAXVALUE 10 START WITH 1 INCREMENT BY 1 CACHE 20;
CREATE SEQUENCE seq_director_id MINVALUE 1 MAXVALUE 15 START WITH 1 INCREMENT BY 1 CACHE 20;
-------------------------------Q.  2-----------------------------
SELECT language, genre FROM film;
-------------------------------Q.  3-----------------------------
SELECT first_name, last_name FROM main_actor;

-------------------------------Q.  4-----------------------------
SELECT * FROM director WHERE director_country = 'Canada';
-------------------------------Q.  5-----------------------------
SELECT * FROM film WHERE genre = 'Drama';
-------------------------------Q.  6-----------------------------
SELECT * FROM film WHERE year = (SELECT MAX(year) FROM film) AND language = 'English';

-------------------------------Q.  7-----------------------------
SELECT
    director.director_first_name, director.director_last_name, film.film_title
FROM
    director INNER JOIN film ON 
    director.director_id = film.director_id;
-------------------------------Q.  8-----------------------------
   
SELECT
    main_actor.last_name
FROM
    main_actor
    JOIN film ON main_actor.main_actor_id = film.main_actor_id
    JOIN director ON director.director_id = film.director_id
GROUP BY
    last_name,
    director.director_last_name
HAVING
    COUNT(*) > 1;

-------------------------------Q.  9-----------------------------
SELECT DISTINCT
    director.*
FROM
    director LEFT OUTER JOIN film ON director.director_id = film.director_id
    --Table A: director / Table B: film 
WHERE
    film.genre = 'Action'
    AND   director.country = 'Canada';
   
-------------------------------Q. 10-----------------------------
CREATE or REPLACE VIEW director_max_movie AS 
SELECT
    subquery1.director_id AS "Director ID",
    subquery1.director_last_name AS "Director last name",
    subquery2.last_name AS "Main actor last name"
FROM
    ( SELECT director.director_id, director.director_last_name,
            COUNT(film.title) AS "directed_movies"
        FROM  director
            INNER JOIN film ON director.director_id = film.director_id
        GROUP BY
            director.director_last_name,
            director.director_id
        ORDER BY
            "directed_movies" DESC, director.director_last_name
    ) subquery1
    INNER JOIN (
        SELECT
            director.director_id,
            main_actor.last_name
        FROM
            director
            INNER JOIN film ON director.director_id = film.director_id
            INNER JOIN main_actor ON film.main_actor_id = main_actor.main_actor_id
    ) subquery2 ON subquery1.director_id = subquery2.director_id;











