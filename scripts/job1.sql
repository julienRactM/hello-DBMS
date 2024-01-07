/* DB crée en SQL*/

-- 1. Modifiez la requête ci-dessus afin d’afficher la population de “Germany”.
SELECT *
FROM world
WHERE TRIM(Country) = 'Germany'


-- 2. Modifiez la requête ci-dessus afin d’afficher le nom et la population des pays
-- “Sweden”, “Norway” et “Denmark”.
SELECT *
FROM world
WHERE TRIM(Country) IN ('Sweden', 'Norway', 'Denmark');


-- 3. Créez une requête permettant d’afficher les pays dont la superficie est
-- supérieure à 200 000 mais inférieure à 300 000.

SELECT *
FROM world
WHERE Area > '200000' AND Area < '300000'
