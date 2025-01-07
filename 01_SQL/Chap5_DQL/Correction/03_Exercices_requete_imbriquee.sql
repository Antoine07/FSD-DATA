-- 0

SELECT `name`
FROM `pilots` 
WHERE num_flying = (SELECT MAX(num_flying) FROM pilots) ;

-- Question: Quelles sont les coordonnées des compagnies qui employent des pilotes faisant moins de 90 heures de vol ?

SELECT 
    num_street, 
    street,
    city
FROM companies 
WHERE comp IN (
    SELECT company
    FROM pilots 
    WHERE num_flying < 90
);

-- Question: Sélectionnez le pilote ayant fait le plus d'heures de vol sans utiliser l'opérateur MAX.

SELECT name 
FROM pilots 
WHERE num_flying >= ALL (SELECT num_flying FROM pilots ) ;

-- requete avec order by et limit pour obtenir le max 

SELECT name 
FROM pilots 
WHERE num_flying >= (SELECT num_flying FROM pilots ORDER BY num_flying DESC LIMIT 1 ) ;

-- Avec MAX 

SELECT name
FROM pilots
WHERE num_flying = (SELECT MAX(num_flying) FROM pilots) ;

-- 

/*
Question: Sélectionner les noms (name) et le nombre d'heures de vol (num_flying) des pilotes dont le nombre d'heures de vol est inférieur au moins un nombre de vol dans la pilots.

ANY contraire de ALL <=> c'est au moins une valeur qui vérifie la condition 
*/

SELECT name, num_flying
FROM pilots
WHERE num_flying < ANY ( SELECT num_flying FROM pilots );

--  Question: Faites la somme des heures de vol des pilotes dont le nom de la compagnie est Air France, vous ne connaissez pas bien sûr la clef primaire de la compagnie.

SELECT sum(num_flying)
FROM pilots 
WHERE company = (
	SELECT comp FROM companies 
	WHERE name='Air france' -- on passe par le nom de la compagnie dans la table companies
);

--  Ajoutez maintenant la compagnie suivante dans la table companies.

-- example de syntaxe pour ajouter des valeurs avec un SET 

INSERT INTO `companies`
SET `comp` = 'ITA', 
    `street` = 'mapoli', 
    `city` = 'Rome', 
    `name` = 'Italia Air',
    `num_street` = 20;

-- Question: Trouvez toutes les compagnies n'ayant pas de pilotes.

SELECT *
FROM companies
WHERE comp NOT IN (
    SELECT company
    FROM pilots
    WHERE company IS NOT NULL -- pensez à mettre cette condition pour éviter le false 
);

-- Question: Sélectionnez tous les pilotes dont le nombre d'heures de travail est inférieur à tous les nombres d'heures de travail de la compagnie CHI.

SELECT name, num_flying
FROM pilots p
WHERE num_flying < ALL ( 
    SELECT  num_flying 
    FROM pilots
    WHERE company = 'CHI'
);

-- Question: Sélectionnez tous les pilotes dont le nombre d'heures de travail est inférieur à la somme des nombres d'heures de travail de la compagnie CHI.

SELECT name, num_flying
FROM pilots p
WHERE num_flying <  ( 
    SELECT  SUM( num_flying )
    FROM pilots
    WHERE company = 'CHI'
);

-- Question: Trouver les pilotes ayant fait plus d'heures de vol qu'au moins un pilote travaillant pour "CHI".

SELECT name, num_flying
FROM pilots p
WHERE num_flying > ANY ( 
    SELECT  num_flying 
    FROM pilots
    WHERE company = 'CHI'
);

--  Question: Sélectionnez la longueur des noms des pilotes dont la longueur de leurs noms est inférieur à toutes les longueurs des noms de la compagny FRE1.

-- char_length

SELECT length(p.name) as name_length, name
FROM pilots as p 
WHERE length(p.name) < ALL (
    SELECT length(p2.name)
    FROM pilots p2 
    WHERE p2.company = 'FRE1'
);

SELECT length(name) as name_length, name
FROM pilots 
WHERE length(name) < ALL (
    SELECT length(name)
    FROM pilots 
    WHERE company = 'FRE1'
);

-- Question: Selectionnez les compagnies qui ont les pilotes les plus expérimentés

SELECT * FROM companies WHERE comp IN (
    SELECT company 
    FROM pilots 
    WHERE num_flying = (
        SELECT MAX(num_flying)
        FROM pilots
    )
);

-- Question: Sélectionnez le pilote(s) le moins expérimenté(s)

SELECT name 
FROM pilots 
WHERE num_flying = ( SELECT MIN(num_flying) FROM pilots );

-- Question: Calculer les heures totales de vol des pilotes d'une compagnie spécifique de votre choix 

SELECT SUM(num_flying) 
FROM pilots
WHERE company = (
    SELECT comp 
    FROM companies
    WHERE name = 'austra air'
);

-- Question: Trouver les pilotes avec des noms courts dans une compagnie donnée** Sélectionnez les noms des pilotes dont la longueur de leurs noms est inférieure à la longueur des noms de tous les pilotes travaillant pour la compagnie "FRE1". 

SELECT name 
FROM pilots
WHERE LENGTH(name) < ALL(
    SELECT LENGTH(name)
    FROM pilots
    WHERE company = 'FRE1'
);

INSERT INTO companies (comp, street, city, num_street, name, status) 
VALUES ('NEW1', "Avenue de l'Air", 'Toulouse', 45, 'Skyline Aviation', 'published');

-- Question: 

ALTER TABLE pilots ADD COLUMN plane VARCHAR(50);

UPDATE pilots
SET plane = 'A380'
WHERE name in ('Alan', 'Sophie', 'Albert', 'Benoit');

UPDATE pilots
SET plane = 'A320'
WHERE name in ('Tom', 'John', 'Yi');

UPDATE pilots
SET plane = 'A340'
WHERE name in ('Yan', 'Pierre');

-- Question: Sélectionnez les coordonnées des compagnies ayant des pilotes dont le nombre d'heures de vol est inférieur à tous les nombres d'heures de vol (chaque heure de vol) des A380.

SELECT name, street, city
FROM companies
WHERE comp IN (
    SELECT company
    FROM pilots
    WHERE num_flying < ALL (
        SELECT num_flying
        FROM pilots
        WHERE plane = 'A380' 
    )
);