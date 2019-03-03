-- First you need to insert the financial table into your databse 
 /* Subqueries: 
WHERE clause: 
Most often, the subquery will be found in the WHERE clause. These subqueries are also called nested subqueries.
*/
 
SET SERVEROUTPUT ON

SELECT
    *
FROM
    financial
WHERE
    financial.unitssold IN (
        SELECT
            financial.unitssold
        FROM
            financial
        WHERE
            financial.unitssold > 4400
    );

SELECT
    director.director_first_name,
    director.director_last_name,
    subquery1.directed_movie_total
FROM
    director,
    (
        SELECT
            film.director_id,
            COUNT(*) AS directed_movie_total
        FROM
            film
        GROUP BY
            film.director_id
    ) subquery1
WHERE
    subquery1.director_id = director.director_id;



--------------------------------------------------------
SELECT
    film.director_id,
    COUNT(*) AS directed_movie_total
FROM
    film
GROUP BY
    film.director_id;