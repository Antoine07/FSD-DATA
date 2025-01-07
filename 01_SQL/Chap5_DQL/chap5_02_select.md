# **DQL - Requêtes de Sélection (Data Query Language)**

MySQL est une base de données optimisée pour effectuer des requêtes de sélection de données. Ces requêtes permettent d'extraire des données à partir de tables, ce qui est essentiel pour manipuler les informations. Une bonne définition des tables et des relations entre elles est cruciale pour une extraction efficace des données.

### Exemple de table `pilots` :

| name | num_flying | company | certificate |
|------|------------|---------|-------------|
| John | 200        | AUS     | ct-1        |
| Alice| 150        | FRE1    | ct-2        |
| Bob  | 300        | AUS     | ct-1        |
| Eva  | 180        | FRE2    | ct-3        |

### **Sélectionner des données avec `SELECT`**

La commande `SELECT` permet d'extraire des données d'une table. Par exemple, pour extraire toutes les colonnes de la table `pilots` :

```sql
SELECT * FROM pilots;
```

Cela extrait toutes les lignes et colonnes de la table.

---

## **1. Projection (Sélection de Colonnes)**

Une projection extrait une ou plusieurs colonnes spécifiques d'une table. Voici quelques exemples :

```sql
-- Sélectionne uniquement la colonne 'name' (projection)
SELECT `name` FROM pilots;

-- Sélectionne les colonnes 'name' et 'certificate'
SELECT `name`, `certificate` FROM pilots;
```

---

## **2. Restriction (Filtrage avec `WHERE`)**

Pour restreindre les résultats d'une requête, on utilise la clause `WHERE`. Elle permet de filtrer les lignes en fonction d'une condition.

```sql
-- Sélectionne uniquement la ligne où le 'certificate' est égal à 'ct-1'
SELECT * FROM pilots WHERE certificate='ct-1';
```

Les opérateurs de comparaison que vous pouvez utiliser dans la clause `WHERE` sont : `=`, `<`, `>`, `<=`, `>=`, `<>` (ou `!=`).

Exemple de condition sur un texte :

```sql
-- Sélectionne les pilotes de la compagnie 'AUS'
SELECT * FROM pilots WHERE company='AUS';
```

---

## **3. Structure de la commande `SELECT`**

La syntaxe complète de la commande `SELECT` est la suivante :

```sql
SELECT
    [DISTINCT] select_expression,... -- Sélection des expressions
    [FROM table_references] -- Table(s) à interroger
    [WHERE where_definition] -- Condition de filtrage
    [ORDER BY {nom_de_colonne} [ASC | DESC]] -- Ordre des résultats
    [LIMIT [offset,] lignes] -- Limite du nombre de résultats
```

### **DISTINCT**

L'option `DISTINCT` permet d'extraire des valeurs uniques, sans doublons.

```sql
-- Sélectionne les valeurs distinctes de 'num_jobs'
SELECT DISTINCT num_jobs FROM pilots;

-- Sélectionne les couples distincts (num_jobs, name)
SELECT DISTINCT num_jobs, name FROM pilots;
```

### **Clause `WHERE` - Opérateurs et Logiques**

Vous pouvez utiliser des opérateurs de comparaison et des opérateurs logiques comme `AND`, `OR`, `NOT`, `LIKE`, et plus encore.

Exemples :

```sql
-- Sélectionne les pilotes dont le nombre d'heures est supérieur à 150 et qui sont dans la compagnie 'AUS'
SELECT name FROM pilots WHERE num_flying > 150 AND company = 'AUS';

-- Sélectionne les pilotes dont le nom commence par 'A' (LIKE pour correspondance partielle)
SELECT name FROM pilots WHERE name LIKE 'A%';
```

### **Clause `ORDER BY`**

La clause `ORDER BY` permet de trier les résultats par ordre croissant (`ASC`) ou décroissant (`DESC`).

```sql
-- Trie les résultats par ordre croissant du nombre d'heures de vol
SELECT name FROM pilots ORDER BY num_flying ASC;

-- Trie les résultats par ordre décroissant du nombre d'heures de vol
SELECT name FROM pilots ORDER BY num_flying DESC;
```

---

## **4. Limitation des Résultats avec `LIMIT`**

La clause `LIMIT` permet de spécifier combien de lignes doivent être retournées.

```sql
-- Limite les résultats à 3 pilotes
SELECT * FROM pilots LIMIT 3;
```

---

## **Exercices**

### **01. Sélectionner tous les pilotes de la compagnie 'AUS'**

```sql
```

### **02. Sélectionner les pilotes de la compagnie 'FRE1' ayant fait plus de 15 heures de vol**

```sql
```

### **03. Sélectionner les pilotes de la compagnie 'FRE1' ayant fait plus de 20 heures de vol**

```sql
```

### **04. Sélectionner les pilotes des compagnies 'FRE1' ou 'AUS' ayant fait plus de 20 heures de vol**

```sql
```

### **05. Sélectionner les pilotes ayant fait entre 190 et 200 heures de vol**

```sql
```

### **06. Sélectionner les pilotes nés après 1978**

```sql
```

### **07. Sélectionner les pilotes nés avant 1978**

```sql
```

### **08. Sélectionner les pilotes nés entre 1978 et 2000**

```sql
```

### **09. Sélectionner les pilotes ayant un vol programmé après le 2020-05-08**

```sql
```

### **10. Sélectionner tous les noms des pilotes dans les compagnies : 'AUS' et 'FRE1'**

```sql
```

### **11. Sélectionner tous les pilotes qui ne travaillent pas pour les compagnies : 'AUS' ou 'FRE1'**

```sql
```

### **12. Sélectionner tous les pilotes dont le nom de la compagnie contient un 'A'**

```sql
```

### **13. Sélectionner tous les pilotes dont le nom de la compagnie commence par 'F'**

```sql
```

### **14. Sélectionner tous les pilotes dont le nom de la compagnie contient un 'I' suivi d'un caractère**

```sql
```

---

## **Bonus**

### **01. Ajouter une colonne `bonus` à la table `pilots`**

```sql

```

### **02. Sélectionner le pilote avec le meilleur bonus**

```sql
```

### **03. Sélectionner les heures de vol distinctes dans la table `pilots`**

```sql
```

### **04. Calculer combien de pilotes sont en dessous de la moyenne des heures de vol**

```sql
```

### **05. Calculer le pourcentage des heures de vol de chaque pilote par rapport au total**

```sql

```

### **06. Utiliser une expression régulière pour récupérer tous les pilotes dont le code de leur(s) compagnie(s) se termine(nt) par 'R' suivi de 2 caractères**

```sql
```

### **07 Trouver les compagnies actives dans une ville donnée**
**Objectif :** Afficher les compagnies situées à "France" dont le statut est `published`.

```sql

```

---

### **08 Identifier les pilotes proches d’un vol programmé**
**Objectif :** Lister les pilotes dont le prochain vol (`next_flight`) est prévu avant le 1er février 2025 ou qui ont moins de 100 heures de vol (`num_flying`).

```sql

```

---

### **09 Trouver les compagnies dans plusieurs villes**
**Objectif :** Afficher les compagnies qui sont situées soit à "Australie", soit à "Chine".

```sql

```
