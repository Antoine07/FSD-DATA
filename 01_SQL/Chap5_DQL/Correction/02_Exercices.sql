-- 1

SELECT * FROM `pilots` WHERE `company` =  'AUS';

-- 2 

SELECT * FROM  `pilots` WHERE `company` =  'FRE1' AND `num_flying` > 15 ;

-- 3

SELECT * FROM  `pilots` WHERE `company` =  'FRE1' AND `num_flying` > 20 ;

-- 4 

SELECT `name` FROM `pilots` WHERE `company` IN ( 'FRE1', 'AUS' ) AND  `num_flying` > 20 ;

SELECT `name` FROM `pilots` WHERE  ( `company` = 'FRE1' OR  `company` =  'AUS' ) AND `num_flying` > 20 ;

-- 5

SELECT `name`,  `num_flying`   FROM `pilots` WHERE  `num_flying` BETWEEN 190 AND 200 ;

-- strictement 

SELECT `name`,  `num_flying`   FROM `pilots` WHERE  `num_flying` > 190 AND   `num_flying` < 200 ;

-- 6

SELECT `name`, `birth_date` FROM `pilots` WHERE YEAR(`birth_date`) > '1978' ;

-- 7

SELECT `name`, `birth_date` FROM `pilots` WHERE YEAR(`birth_date`) < '1978' ;

-- 8

SELECT `name`, `birth_date` FROM `pilots` WHERE YEAR(`birth_date`) > '1978'  AND YEAR(`birth_date`) < '2000' ;

-- 9

SELECT `name`, `next_flight` FROM `pilots` WHERE DATE(`next_flight`) > '2020-05-08';

-- 10

SELECT `name` FROM `pilots` WHERE `company` IN ('AUS', 'FRE1');


-- 11

SELECT `name` FROM `pilots` WHERE `company` NOT IN ('AUS', 'FRE1');
SELECT `name` FROM `pilots` WHERE NOT( `company` IN ('AUS', 'FRE1') );
SELECT `name` FROM `pilots` WHERE `company` <> 'AUS'  AND  `company` <>  'FRE1';

-- 12 

SELECT `name` FROM `pilots` WHERE `company` LIKE '%a%';


-- 13 

SELECT `name` FROM `pilots` WHERE `company` LIKE 'f%';

-- 14

SELECT `name`, `company` FROM `pilots` WHERE `company` LIKE '%i_';

