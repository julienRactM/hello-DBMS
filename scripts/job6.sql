
-- 1. Créez une requête permettant d’afficher la population totale du monde.
SELECT SUM(Population)
FROM world


-- 2. Créez une requête permettant d’afficher la population totale de chacun des continents.
SELECT Region, SUM(Population) as Total_Population
FROM world
GROUP BY Region


-- 3. Créez une requête permettant d’afficher le PIB total du continent de chacun des continents.
SELECT Region, SUM(GDP) as Total_PIB
FROM world
GROUP BY Region


-- 4. Créez une requête permettant d’afficher le PIB total du continent africain.
SELECT
	CASE
		WHEN TRIM(Region) LIKE '%AFRICA%' THEN 'AFRICA'
      ELSE TRIM(Region)
	END AS Region_Category,
	SUM(GDP) as Total_GDP
FROM world
WHERE TRIM(Region) LIKE '%AFRICA%'


-- 5. Créez une requête permettant d’afficher le nombre de pays ayant une superficie supérieure ou égale à 1 000 000m2.
SELECT COUNT(Country) as Country_1M²_Count
FROM world
WHERE AREA < 1000000


-- 6. Créez une requête permettant d’afficher la population totale des pays suivants : Estonia, Latvia, Lithuania.
SELECT SUM(Population)
FROM world
WHERE TRIM(Country) IN ('Estonia', 'Latvia', 'Denmark');


-- 7. Créez une requête permettant d’afficher le nombre de pays de chaque continent.
SELECT Region, COUNT(Country)
FROM world
GROUP BY Region


-- 8. Créez une requête permettant d’afficher les continents ayant une population totale d’au moins 100 millions d’individus.
SELECT Region, Population
FROM world
GROUP BY TRIM(Region)
HAVING MAX(Population) >= 100000000
