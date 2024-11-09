
--calculates the variation in production across different crops and states (Tip: use VAR function)

SELECT
    State_name,  
    Crop,  
    VAR(Production) AS production_variation
FROM
    Crop_prod_study  
GROUP BY
    State_name,  
    Crop  
ORDER BY
    production_variation DESC; 