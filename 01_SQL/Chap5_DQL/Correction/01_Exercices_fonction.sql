
SELECT DAYNAME( DATE_SUB( CURDATE(), INTERVAL 1 YEAR) );

-- avec soustraction
SELECT DAYNAME( (SELECT (CURDATE() - INTERVAL 1 YEAR) ));


-- 02

SELECT 
    birth_date, DATE_ADD(birth_date, INTERVAL ( ROUND( RAND() * 7 ) - 3 ) DAY ) as randdate 
FROM pilots 
ORDER BY birth_date DESC 
LIMIT 1;

SELECT 
    DATE_ADD(MAX(birth_date), INTERVAL (ROUND( RAND() * 7 ) - 3 ) DAY ) as randdate 
FROM pilots;

-- 03

SELECT 
    SUBSTRING(`name`, 1, 3) as nameprefix,
    CONCAT( UPPER(`name`), ' ', YEAR(`birth_date`)) as nameyear,
    DATE_FORMAT(`birth_date`, '%d %m %y') as birthdate 
FROM `pilots` ;