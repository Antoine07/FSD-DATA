
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


CREATE TABLE `pilots`(
    `certificate` VARCHAR(6),
    `company`  CHAR(4),
    `num_flying` DECIMAL(5,1), -- 5 chiffres 4 chiffres avant virgule et 1 après
    `name` VARCHAR(20),
    CONSTRAINT `pk_certificate` PRIMARY KEY (`certificate`),
    CONSTRAINT `uq_name` UNIQUE(`name`)
)ENGINE=InnoDB ;

ALTER TABLE `pilots` 
ADD CONSTRAINT `fk_pilots_company` FOREIGN KEY (`company`) REFERENCES `companies`(`comp`);