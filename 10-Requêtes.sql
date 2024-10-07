USE db_space_invaders;


-- Requête N°1

SELECT * 
from t_joueur 
ORDER BY jouNombrePoints DESC 
LIMIT 5;



-- Requête N°2 

SELECT MAX(armprix) AS PrixMaximum, MIN(armprix) AS PrixMinimum, AVG(armprix) AS PrixMoyen 
from t_arme;

-- Requête N°3

SELECT t_commande.fkJoueur AS idJoueur, COUNT(t_detail_commande.detQuantiteCommande) AS NombreCommandes
FROM t_commande
JOIN t_detail_commande
ON t_commande.idCommande = t_detail_commande.fkCommande
GROUP BY t_commande.fkJoueur
ORDER BY NombreCommandes DESC;


-- Requête N°4

SELECT fkJoueur AS IdJoueur, COUNT(*) AS NombreCommandes 
FROM t_commande 
GROUP BY fkJoueur 
HAVING COUNT(*) > 2;


-- Requête N°5

SELECT DISTINCT jouPseudo, armNom 
FROM t_arme
JOIN t_detail_commande
ON t_detail_commande.fkArme = t_arme.idArme
JOIN t_commande
ON t_commande.idCommande = t_detail_commande.fkCommande
JOIN t_joueur
ON t_commande.fkJoueur = t_joueur.idJoueur;


-- Requête N°6

SELECT idJoueur AS IdJoueur, SUM(t_arme.armPrix) AS TotalDepense
FROM t_joueur
JOIN t_commande
ON t_commande.fkJoueur = t_joueur.idJoueur
JOIN t_detail_commande
ON t_commande.idCommande = t_detail_commande.fkCommande
JOIN t_arme
ON t_detail_commande.fkArme = t_arme.idArme
GROUP BY idJoueur
ORDER BY TotalDepense DESC LIMIT 10;



-- Requête N°7

SELECT idJoueur, idCommande 
From t_joueur
LEFT JOIN t_commande 
ON t_joueur.idJoueur = t_commande.fkJoueur; 




-- Requête N°8

SELECT jouPseudo, idCommande 
From t_joueur
RIGHT JOIN t_commande
ON t_joueur.idJoueur = t_commande.fkJoueur; 


-- Requête N°9

SELECT jouPseudo, SUM(detQuantiteCommande)
From t_joueur
LEFT JOIN t_commande
ON t_joueur.idJoueur = t_commande.fkJoueur
LEFT JOIN t_detail_commande
ON t_detail_commande.fkCommande = t_commande.idCommande
GROUP BY jouPseudo;


-- Requête N°10

SELECT jouPseudo, COUNT(t_detail_commande.fkArme) 
FROM t_joueur
JOIN t_commande
ON t_joueur.idJoueur = t_commande.fkJoueur
JOIN t_detail_commande
ON t_detail_commande.fkCommande = t_commande.idCommande
JOIN t_arme
ON t_detail_commande.fkArme = t_arme.idArme
GROUP BY t_joueur.jouPseudo
Having COUNT(DISTINCT t_detail_commande.fkArme) > 3;

