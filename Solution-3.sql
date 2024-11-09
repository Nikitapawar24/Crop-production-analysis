

/*calculates each state's average yield(production per area) and identifies the top N states
  with the highest average yield over multiple years*/

SELECT TOP(5) 
    state_name, 
    AVG(production / area) AS production_per_area
FROM 
    crop_prod_study
WHERE 
    area > 0
GROUP BY 
    state_name
ORDER BY 
    production_per_area DESC;
