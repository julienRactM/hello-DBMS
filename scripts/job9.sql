-- On va rechercher S’il existe des écarts importants entre la mortalité infantile et le taux de mortalité global
-- dans les pays dont le climat est désertique et où l’accès à l’information par téléphone et la densité des
-- populations est très faible. On observe également comment cela semble impacter la natalité dans ces pays.

-- On évite volontairement les données Arable et Crops qui sont très important vis-à-vis de la mortalité en général
--  pour essayer d’identifier d’autres critères propre à l’environnement et

-- On attribue 0 aux valeurs manquantes de la colonne Climat, pour observer s’il l’absence de donnée peut nous apporter une information utile.
SET Climate = CASE WHEN Climate = '' THEN 0 ELSE Climate END

-- On drop un pays qui contient trop de données manquante pour l'étude en question
DELETE FROM world
WHERE Country = 'Western Sahara';


-- On rend les floats accessibles en nettoyant la db
UPDATE WORLD
SET
"Pop_Density" = REPLACE ("Pop_Density", ",", "."),
"Coastline" = REPLACE ("Coastline", ",", "."),
"Net_migration" = REPLACE ("Net_migration", ",", "."),
"Infant_mortality" = REPLACE ("Infant_mortality", ",", "."),
"Literacy" = REPLACE ("Literacy", ",", "."),
"Phones" = REPLACE ("Phones", ",", "."),
"Arable" = REPLACE ("Arable", ",", "."),
"Crops" = REPLACE ("Crops", ",", "."),
"Other" = REPLACE ("Other", ",", "."),
"Birthrate" = REPLACE ("Birthrate", ",", "."),
"Deathrate" = REPLACE ("Deathrate", ",", "."),
"Agriculture" = REPLACE ("Agriculture", ",", "."),
"Industry" = REPLACE ("Industry", ",", "."),
"Service" = REPLACE ("Service", ",", ".")


-- Recherche : (SVP voir ce job là sur le document World si possible)
SELECT Country, ABS(((Infant_Mortality - Deathrate)/(Deathrate+ Infant_Mortality))*100) AS Death_related_To_Infant_Mortality, Deathrate, Infant_Mortality, Birthrate, Pop_Density, Phones
FROM world
WHERE Climate = 1 AND Deathrate > 10
ORDER BY ABS(((Infant_Mortality - Deathrate)/(Deathrate+ Infant_Mortality))*100) DESC


-- On remarque que parmi les 28 pays dont le climat est désertique, l’intégralité des pays Sub-Sahariens
--  au climat désertique ont un taux de mortalité supérieur à 10 et seulement L’Afghanistan présente un taux
--  de mortalité important parmi les pays des autres régions partageant ce climat.

-- Parmi ces 8 pays, on s’intéresse pour le moment aux 5 pays dont l’écart entre la mortalité et la mortalité infantile
--  est le plus important et on remarque que ces pays ont également des taux de natalité élevé, supérieure de 7% à
--   la moyenne globale des pays de ce climat.  La densité de la population est elle six fois plus faible que la moyenne
--   des pays de ce climat.

-- On note également qu’une très faible partie de la population de ces pays possédaient des téléphones.

-- Le faible partage d’information et une basse densité de la population d’un pays sont des facteurs aggravants
-- de mortalité infantile, le manque d’accès aux soins et aux pratiques sanitaires recommandées dans un climat aussi hostile
--  à certainement du entraîner la mort de nombreux nouveau-nées.

-- Malheureusement nous n’avons pas d’accès aux dates de ces mesures donc certaines de ces données sont difficile
-- à interpréter mais j’estimes que ces données datent probablement d’une période entre 1993 et 2003, vu le faible accès
-- aux téléphones au Niger et en Afghanistan où entre 0.1-0.4% des habitants en possédait un tandis qu’en 2014,
--  80% des adultes males Afghanistan déclarait en posséder un.

-- Ces pays sont nombreux a avoir été impliqués dans des conflits armés sur leur territoire dans les années 90,
-- ce qui rend l’interprétation des données sur la mortalité délicate.

-- Le Botswana en particulier à un taux de mortalité infantile très faible en rapport à son taux de mortalité.
-- Après recherche, je n’ai pas trouvé de guerre majeure ou de catastrophe naturelle qui ait pu s’y passer,
-- donc il est possible que des maladies expliquent ce phénomène.
