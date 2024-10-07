-- Administrateur du jeu
CREATE ROLE Administrateur;

-- Création de l’utilisateur :
CREATE USER 'lise'@'localhost' IDENTIFIED BY 'ldje-aw';

-- Privilèges de l’utilisateur :
GRANT ALL PRIVILEGES ON db_space_invaders.* to Administrateur with grant option;

-- lise dans le rôle d'admin
GRANT 'Administrateur' TO 'lise'@'localhost';


-- Joueur
CREATE ROLE Joueur;

-- Création de l’utilisateur :
CREATE USER 'bob'@'localhost' IDENTIFIED BY 'bjsb_de';

-- Privilèges de l’utilisateur :
-- -- Droit de lecture des informations sur la table t_arme.
GRANT SELECT ON db_space_invaders.t_arme to Joueur;

-- Droit de créer une commande.
GRANT CREATE ON db_space_invaders.t_commande to Joueur;

-- Droit de lecture dans la table commande.
GRANT SELECT ON db_space_invaders.t_commande to Joueur;

-- bob dans le rôle joueur
GRANT 'Joueur' TO 'bob'@'localhost';


-- Gestionnaire de la boutique

CREATE ROLE GestionnaireBoutique;

-- Création de l’utilisateur :
CREATE USER 'carl'@'localhost' IDENTIFIED BY 'cakf';


-- Privilèges de l’utilisateur :
-- Droit de lecture dans la table t_joueur.
GRANT SELECT ON db_space_invaders.t_joueur to 'GestionnaireBoutique';

-- Droit de mise à jour, lecture, et suppression des armes.
GRANT UPDATE, SELECT, DELETE ON db_space_invaders.t_arme to 'GestionnaireBoutique’;

-- Droit de lecture dans la table t_commande.
GRANT SELECT ON db_space_invaders.t_commande to 'GestionnaireBoutique’;

-- carl dans le rôle Gestionnaire
GRANT 'GestionnaireBoutique' TO 'carl'@'localhost';
