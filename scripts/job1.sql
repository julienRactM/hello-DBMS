/* DB crée en SQL*/

-- 1.
SELECT *
FROM world
WHERE TRIM(Country) = 'Germany'


-- 2.
SELECT *
FROM world
WHERE TRIM(Country) IN ('Sweden', 'Norway', 'Denmark');


-- 3.

SELECT *
FROM world
WHERE Area > '200000' AND Area < '300000'
