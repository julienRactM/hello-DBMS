-- 1. Créez une requête permettant d’afficher les prix nobels de 1986.
SELECT *
FROM nobel
WHERE yr = 1986


-- 2. Créez une requête permettant d’afficher les prix nobels de littérature de 1967.
SELECT *
FROM nobel
WHERE yr = 1967 AND subject = 'Literature'


-- 3. Créez une requête permettant d’afficher l’année et le sujet du prix nobel d’Albert Einstein.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'


-- 4. Créez une requête permettant d’afficher les détails (année, sujet, lauréat) des
-- lauréats du prix de Littérature de 1980 à 1989 inclus.

SELECT *
FROM nobel
WHERE yr >= '1980' AND yr <= '1989'

-- 5. Créez une requête permettant d’afficher les détails des lauréats du prix de
-- Mathématiques. Combien y en a-t-il ?
-- N_Winners devrait afficher Le nombre de lauréats du prix de Mathématiques que j’ai traduit par Mathematics vu que la table est en anglais.
-- Ce nombre sera 0 vu qu’il n’y en a jamais eu.
SELECT *, COUNT(winner) AS N_Winners
FROM nobel
WHERE subject = 'Mathematics'
