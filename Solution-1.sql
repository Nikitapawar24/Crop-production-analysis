
--Calculate crop yield (production per unit area) to assess which crops are the most efficient in production.


SELECT   crop,
         Round(Sum(production/area),2) AS crop_yield
FROM     crop_prod_study
GROUP BY crop
ORDER BY crop_yield DESC;