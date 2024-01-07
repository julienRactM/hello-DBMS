-- 1. Observez le schéma relationnel de la base de données UEFA EURO 2012ci-dessus. Analysez les cardinalités.
-- Eteam = typo ?
-- Il est possible que nous soyons plusieurs à avoir lu le tableau dans le mauvais sens pour les cardinalités, ce qui rendrait la formulation originale plus cohérente.
-- Game – goal et eteam – goal paraissent selon moi être à l’envers, dans la mesure où un match devrait être associé à 0 ou plus de goals (1 : 0..N) et chaque goal ne peut être associé qu’à un seul match où il a été marqué (N..1).
-- C’est également vrai pour eteam – goal, où une équipe peut être associée à plusieurs goals (1 :N) et un goal ne peut être associé qu’à une seule équipe qui l’a marqué (0 :1).
-- Pour ce qui est de la relation game – eteam elle n’est pas cohérente, plusieurs games devraient pouvoir être associés à plusieurs équipes dans une relation (N : N) tandis qu’une eteam devrait pouvoir être associée à 0 ou plus games (0..N)



-- 2. La requête ci-dessous permet d’afficher le but marqué par un joueur dont le nom de famille est "Bender".
--  L'astérisque (*) indique qu'il faut énumérer toutes les colonnes du tableau - une façon d’appeler toutes les colonnes
--  de la table goal (matchid, teamid, player, gtime). Modifiez cette requête afin d’afficher le numéro de match et le nom
--  du joueur pour tous les buts marqués par l'Allemagne. Afin d’identifier les joueurs allemands, vérifiez que : teamid = 'GER'.
SELECT matchid, player
FROM goal
WHERE TRIM(teamid) = 'GER'


-- 3. Créez une requête permettant d’afficher les colonnes id, stadium, team1, team2 pour le match dont l’id est 1012.
SELECT id, stadium, team1, team2
FROM game
WHERE id = '1012'


-- 4. La requête suivante permet de joindre la table game et la table goal sur la colonne id-matchid. Modifiez cette requête afin d’afficher player, teamid, stadium et mdate de chaque but allemand.
-- Pas d’Alias pour la première commande.
SELECT goal.player goal.teamid, game.stadium, game.mdate
FROM game
JOIN goal ON game.id = goal.matchid
WHERE goal.teamid = 'GER'


-- 5. Créez une requête permettant d’afficher team1, team2 et player pour chaque but marqué par un joueur appelé Mario.
SELECT game.team1, game.team2, goal.player
FROM game
JOIN goal ON game.id = goal.matchid
WHERE goal.player LIKE '%Mario%'


-- 6. Créez une requête permettant de joindre la table goal et la table eteam sur les clés id - teamid.
SELECT *
FROM goal
JOIN eteam ON goal.teamid = eteam.id


-- 7. Créez une requête permettant d’afficher player, teamid, coach, gtime pour tous les buts marqués dans les 10 premières minutes des matchs.
SELECT g.player, g.teamid, e.coach, g.gtime
FROM goal g
JOIN eteam e ON g.teamid = e.id
WHERE g.gtime <= 10


-- 8. La requête suivante permet de joindre la table game et la table eteam sur les clés team1 – et eteam.id.
-- Créez une requête permettant d’afficher les dates des matches ainsi que le nom de l'équipe dont "Fernando Santos"
--  était le coach de l’équipe team1.
SELECT g.mdate, e.teamname
FROM game g
JOIN eteam e ON g.team1 = e.id
WHERE e.coach LIKE '%Fernando Santos%';


-- 9. Créez une requête permettant d’afficher la liste des joueurs pour chaque but marqué lors d'un match dont le stade
-- était le “National Stadium, Warsaw”.
SELECT g.player
FROM game ga
JOIN goal g ON ga.id = g.matchid
WHERE ga.stadium LIKE '%National Stadium, Warsaw%';


-- 10.Créez une requête permettant d’afficher le nombre total de buts marqués pour chaque équipe de la table goal.
-- La condition du HAVING permet de valider
SELECT e.teamname, COUNT(g.goal) as goals_count
FROM goal g
JOIN eteam e ON e.id = g.teamid
GROUP BY e.teamname
HAVING COUNT(g.goal) > 0


-- 11.Créez une requête permettant d’afficher les stades et le nombre de buts marqués dans chacun des stades de
-- la jointure de game-goal.
SELECT ga.stadium, COUNT(g.goal) as goals_count
FROM goal g
JOIN game ga ON ga.id = g.matchid
GROUP BY ga.stadium


-- 12.Pour chaque match où l’équipe de France a marqué, créez une requête permettant d’afficher l'id du match,
--  la date du match et le nombre de buts marqués par "FRA".
SELECT ga.id, ga.mdate, COUNT(g.goal) as score_count
FROM goal g
JOIN game ga ON ga.id = g.matchid
JOIN eteam e ON e.id = g.teamid
WHERE TRIM(e.teamname) = "FRA"
GROUP BY ga.id
