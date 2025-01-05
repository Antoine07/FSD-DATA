# **Fonctions SQL**

## **1. Fonctions de chaînes**

Les fonctions de chaînes permettent de manipuler des chaînes de caractères. Voici quelques exemples courants :

```sql
SELECT 
    UPPER(name) AS NameUpperPilot, -- Convertit en majuscules
    LOWER(name) AS NameLowerPilot, -- Convertit en minuscules
    SUBSTRING(name, 1, 4) AS NameSubPilot, -- Extrait les 4 premiers caractères
    LENGTH(name) AS LnNamePilot, -- Retourne la longueur de la chaîne
    REPLACE(name, 'e', 'A') AS ReplaceNamePilot -- Remplace 'e' par 'A'
FROM pilots;
```

Pour concaténer des chaînes, utilisez les fonctions suivantes :

```sql
SELECT CONCAT('Hello', 'World') AS SimpleConcat; -- "HelloWorld"

-- Concaténation avec un séparateur
SELECT CONCAT_WS(', ', 'Hello', 'World') AS ConcatWithSeparator; -- "Hello, World"
```

### Conversion en date ou datetime

Vous pouvez convertir des chaînes ou des nombres en formats date/datetime à l'aide de `CONVERT` :

```sql
SELECT CONVERT('20130101', DATE) AS ConvertedToDate; -- Convertit en date
SELECT CONVERT(CURRENT_TIMESTAMP, DATETIME) AS CurrentDateTime; -- Convertit le timestamp actuel en datetime
```

---

## **2. Fonctions de nombres**

Les fonctions numériques permettent de réaliser des opérations mathématiques. Voici quelques fonctions utiles :

- **FLOOR** : Arrondit à l'entier inférieur (plancher)
- **CEILING** : Arrondit à l'entier supérieur (plafond)
- **ROUND** : Arrondit à un nombre décimal spécifié
- Opérations classiques : `+`, `-`, `*`, `/`

Exemple :

```sql
SELECT 
    FLOOR(12.75) AS FloorValue, -- Résultat : 12
    CEILING(12.25) AS CeilingValue, -- Résultat : 13
    ROUND(12.3456, 2) AS RoundedValue; -- Résultat : 12.35
```

---

## **3. Fonctions de dates**

Les fonctions de dates permettent de travailler avec des dates et des heures. Voici quelques exemples utiles :

```sql
SELECT 
    birth_date, -- Date de naissance
    CURDATE() AS CurrentDate, -- Date courante
    YEAR(birth_date) AS YearPilotBD, -- Année
    MONTH(birth_date) AS MonthPilotBD, -- Mois
    DAY(birth_date) AS DayPilotBD, -- Jour
    CURRENT_TIMESTAMP AS CurrentTimestamp, -- Timestamp actuel
    DATE_ADD(birth_date, INTERVAL 1 MONTH) AS DatePlus1Month, -- Ajoute 1 mois
    DATEDIFF(CURRENT_TIMESTAMP, birth_date) AS DaysSinceBirth, -- Différence en jours
    DATE_FORMAT(birth_date, '%W %M %Y') AS FormattedBirthDate -- Formatage personnalisé
FROM pilots;
```

---

## **Exercices**

### **01. Trouvez le jour exact d'il y a un an**

- Écrivez une requête pour déterminer le nom du jour de la semaine qu'il y avait exactement un an.
- Indice : Utilisez `DATE_SUB` pour soustraire 1 an de la date actuelle.

```sql
```

---

### **02. Créez des dates aléatoires proches**

- Générez des dates aléatoires de +/- 3 jours par rapport à la date de naissance la plus récente dans la table `pilots`.
- Indice : Combinez `DATE_ADD` et une fonction aléatoire.

```sql

```

---

### **03. Exercice : Manipulation combinée**

1. Extrayez les 3 premières lettres des noms des pilotes.
2. Créez une chaîne concaténée incluant le nom du pilote et l'année de sa naissance.
3. Affichez les résultats en majuscules et avec un formatage de date personnalisé (jour/mois/année).

Exemple de solution :

```sql

```
