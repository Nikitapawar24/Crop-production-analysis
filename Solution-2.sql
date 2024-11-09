
/*calculates the year-over-year percentage growth in crop production for each state and crop.*/


SELECT
    State_name, 
    Crop,  
    Crop_year,  
    Production,  
	LAG(Production) OVER (PARTITION BY State_name, Crop ORDER BY Crop_year) AS previous_year_production,
	CASE
        WHEN LAG(Production) OVER (PARTITION BY State_name, Crop ORDER BY Crop_year) IS NULL THEN NULL 
        WHEN LAG(Production) OVER (PARTITION BY State_name, Crop ORDER BY Crop_year) = 0 THEN NULL  
        ELSE 
            CAST(ROUND(
                ((Production - LAG(Production) OVER (PARTITION BY State_name, Crop ORDER BY Crop_year)) / 
                LAG(Production) OVER (PARTITION BY State_name, Crop ORDER BY Crop_year)) * 100, 2 
           ) AS VARCHAR(15)) + '%'
    END AS production_growth_percentage 
	
FROM 
    Crop_prod_study 
ORDER BY 
    State_name,  
    Crop,  
    Crop_year;


