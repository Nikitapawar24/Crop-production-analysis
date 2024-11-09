
/*Identifies states that have the largest increase in cultivated area for a specific crop between two years*/

WITH Area_Change AS (
    SELECT
        State_name,  
        Crop,  
        Crop_year,  
        Area,  
        LAG(Area) OVER (PARTITION BY State_name, Crop ORDER BY Crop_year) AS Previous_year_area  
    FROM
        Crop_prod_study  
)
SELECT
    State_name,  
    Crop,  
    Crop_year, 
    Area, 
    Previous_year_area, 
    (Area - Previous_year_area) AS Area_increase 
FROM
    Area_Change
WHERE
    Previous_year_area IS NOT NULL 
    AND Area > Previous_year_area  
ORDER BY
    Area_increase DESC;  


	




WITH Area_Change AS (
    SELECT State_name,Crop,Crop_year,Area,  
        LAG(Area) OVER (PARTITION BY State_name, Crop ORDER BY Crop_year)
		AS Previous_year_area  
    FROM Crop_prod_study  
)
SELECT State_name,Crop,Crop_year,Area,Previous_year_area, 
    (Area - Previous_year_area) AS Area_increase 
FROM Area_Change
WHERE
    Previous_year_area IS NOT NULL 
    AND Area > Previous_year_area  
ORDER BY Area_increase DESC;  
