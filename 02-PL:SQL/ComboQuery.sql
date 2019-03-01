-- First you need to insert the financial table into your databse 
SET SERVEROUTPUT ON

SELECT query1.*
FROM (SELECT segments,SUM(FINANCIAL.UNITSSOLD) AS total_amt 
        FROM financial 
        GROUP BY financial.segments) query1, 
        
            ( SELECT MAX (query2.total_amt) AS highest_amt
            FROM (SELECT segments,SUM(financial.UNITSSOLD) AS total_amt
            FROM financial
            GROUP BY financial.segments) query2) query3
            
WHERE query1.total_amt=query3.highest_amt;

            
            
 
 
 
 