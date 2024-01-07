
-- 1. Créez une requête permettant d’afficher les pays dont la population est supérieure à celle de "Russia".
SELECT *
FROM world
WHERE Population > (SELECT Population FROM world WHERE TRIM(Country) = 'Russia');


-- 2. Créez une requête permettant d’afficher les pays d'Europe dont le PIB par habitant est supérieur à celui d’ "Italy".
-- Il me semble que le PIB et le GDP ne sont pas exactement la même chose mais :
SELECT *
FROM world
WHERE GDP > (SELECT GDP FROM world WHERE TRIM(Country) = 'Italy');

-- 3. Créez une requête permettant d’afficher les pays dont la population est supérieure
-- à celle du Royaume-Uni mais inférieure à celle de l'Allemagne.
SELECT *
FROM world
WHERE Population > (SELECT Population FROM world WHERE TRIM(Country) = 'United Kingdom') AND Population < (SELECT Population FROM world WHERE TRIM(Country) = 'Germany') ;


-- 4. L'Allemagne (80 millions d'habitants) est le pays le plus peuplé d'Europe.
-- L'Autriche (8,5 millions d'habitants) compte 11% de la population allemande.
-- Créez une requête permettant d’afficher le nom et la population de chaque pays d'Europe, en pourcentage de la population de l'Allemagne.
SELECT
    Country,
    Population,
    ROUND((Population * 100 / 80000000.0), 1) || '%' AS pourcentage
FROM world
WHERE TRIM(Region) LIKE '%EUROPE%';


-- 5. Créez une requête permettant de trouver le plus grand pays de chaque continent, en indiquant son continent, son nom et sa superficie.
SELECT Country, Region, Max(Population)
FROM world
GROUP BY Region


-- 6. Créez une requête permettant de trouver les continents où tous les pays ont une population inférieure ou égale à 25 000 000.
SELECT Region
FROM world
GROUP BY TRIM(Region)
HAVING MAX(Population) <= 25000000
