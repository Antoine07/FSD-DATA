
-- Ajout du champ status à la table companies

ALTER TABLE `companies` 
ADD COLUMN `status` ENUM('published', 'unpublished', 'draft')  ;

-- oublie du default 

ALTER TABLE `companies` 
MODIFY `status`  ENUM('published', 'unpublished', 'draft') DEFAULT 'draft' ;

-- ajout de num_street
ALTER TABLE `companies` 
ADD COLUMN `num_street` SMALLINT UNSIGNED;


-- supprimer la colonne
ALTER TABLE `companies` DROP COLUMN `num_street`;

-- ajout de la colonne name

ALTER TABLE `companies` ADD `num_street` SMALLINT UNSIGNED AFTER `city` ;