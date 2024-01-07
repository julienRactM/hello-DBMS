-- 1. Créez une requête permettant de trouver les noms de pays commençant par la lettre B.


SELECT *
FROM world
WHERE TRIM(Country) LIKE  'B%'


-- 2. Créez une requête permettant de trouver les noms de pays commençant par “Al”.
SELECT *
FROM world
WHERE TRIM(Country) LIKE  'Al%'


-- 3. Créez une requête permettant de trouver les noms de pays finissant par la lettre y.
SELECT *
FROM world
WHERE TRIM(Country) LIKE  '%y'


-- 4. Créez une requête permettant de trouver les noms de pays finissant par “land”.
SELECT *
FROM world
WHERE TRIM(Country) LIKE  '%land'


-- 5. Créez une requête permettant de trouver les noms de pays contenant la lettre w.
SELECT *
FROM world
WHERE TRIM(Country) LIKE  '%w%'


-- 6. Créez une requête permettant de trouver les noms de pays contenant “oo” ou “ee”.
SELECT *
FROM world
WHERE TRIM(Country) LIKE  '%oo%' OR TRIM(Country) LIKE '%ee%'


-- 7. Créez une requête permettant de trouver les noms de pays contenant au moins
-- trois fois la lettre a.
SELECT *
FROM world
WHERE LENGTH(REPLACE(Country, 'a', '')) <= LENGTH(Country) - 3;
-- Ou peut être fait ainsi :
SELECT *
FROM world
WHERE (Country LIKE '%a%a%a%') AND NOT (Country LIKE '%a%a%a%a%');


-- 8. Créez une requête permettant de trouver les noms de pays ayant la lettre r
-- comme seconde lettre.
SELECT *
FROM world
WHERE UPPER(Country) LIKE '_R%';
