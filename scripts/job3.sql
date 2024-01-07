-- 1. Créez une requête permettant d’afficher toutes les colonnes de la table students.
SELECT *
FROM students


-- 2. Créez une requête permettant de filtrer la table et d’afficher les élèves âgés de
-- strictement plus de 20 ans.
SELECT *
FROM students
WHERE age > 20


-- 3. Créez une requête permettant de faire un classement des élèves selon leur note
-- dans un ordre croissant, puis dans un ordre décroissant.
-- La question pose une grosse problématique car A+ et A- seront quel que soit le tri effectuer afficher avant ou
-- après A, il faut donc soit utiliser une condition CASE dans le order by ou  bien garder un tableau parallèle
--  associant des valeurs numériques à chaque possibilitées de notes, puis effectuer une requête INNER Join
-- and ORDER BY la colonne de tri numérique.

-- Croissant.
SELECT *
FROM students
WHERE Ranking IN ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F')
ORDER BY
  CASE
    WHEN Ranking = 'A+' THEN 1
    WHEN Ranking = 'A' THEN 2
    WHEN Ranking = 'A-' THEN 3
    WHEN Ranking = 'B+' THEN 4
    WHEN Ranking = 'B' THEN 5
    WHEN Ranking = 'B-' THEN 6
    WHEN Ranking = 'C+' THEN 7
    WHEN Ranking = 'C' THEN 8
    WHEN Ranking = 'C-' THEN 9
    WHEN Ranking = 'D+' THEN 10
    WHEN Ranking = 'D' THEN 11
    WHEN Ranking = 'D-' THEN 12
    WHEN Ranking = 'F' THEN 13
  END ASC;

-- Décroissant
-- Il suffit d’inverser la méthode d’order by sur la dernière ligne avec :
-- END DESC :

SELECT *
FROM students
WHERE Ranking IN ('A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-', 'F')
ORDER BY
  CASE
    WHEN Ranking = 'A+' THEN 1
    WHEN Ranking = 'A' THEN 2
    WHEN Ranking = 'A-' THEN 3
    WHEN Ranking = 'B+' THEN 4
    WHEN Ranking = 'B' THEN 5
    WHEN Ranking = 'B-' THEN 6
    WHEN Ranking = 'C+' THEN 7
    WHEN Ranking = 'C' THEN 8
    WHEN Ranking = 'C-' THEN 9
    WHEN Ranking = 'D+' THEN 10
    WHEN Ranking = 'D' THEN 11
    WHEN Ranking = 'D-' THEN 12
    WHEN Ranking = 'F' THEN 13
  END DESC;
