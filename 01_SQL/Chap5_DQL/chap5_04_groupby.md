# **DQL – Requêtes et Fonctions de Groupement**

## **Fonctions de groupe**

Les fonctions de groupe permettent de réaliser des calculs sur un ensemble de lignes et retournent une valeur unique pour chaque groupe. Elles s’utilisent principalement dans la clause `SELECT`. 

### **Liste des fonctions principales :**

| **Fonction**       | **Description**                                                        |
|---------------------|------------------------------------------------------------------------|
| `AVG([DISTINCT] exp)` | Calcule la **moyenne** des valeurs d'une expression.                 |
| `COUNT(* \| [DISTINCT] exp)` | Renvoie le **nombre de lignes** (ou valeurs distinctes) correspondant. |
| `MAX([DISTINCT] exp)` | Trouve la **valeur maximale**.                                       |
| `MIN([DISTINCT] exp)` | Trouve la **valeur minimale**.                                       |
| `SUM([DISTINCT] exp)` | Effectue la **somme** des valeurs d'une expression.                 |
| `GROUP_CONCAT(exp)` | Concatène les valeurs dans un seul champ séparé par des virgules.     |
| `VARIANCE(exp)`     | Calcule la **variance** des données.                                  |
| `STDDEV(exp)`       | Calcule l'**écart-type** (standard deviation).                        |

>[!NOTE] 
>Si aucune clause `GROUP BY` n'est utilisée, les fonctions de groupement opèrent sur **l’ensemble des lignes** de la table.

---

## **Groupement de lignes**

La clause `GROUP BY` est utilisée pour regrouper les lignes d'une table selon une ou plusieurs colonnes.  
Le résultat est un résumé des données par groupe.

### **Syntaxe générale :**

```sql
SELECT col1 [, col2, ...], fonction_groupe
FROM table
WHERE (conditions)
GROUP BY col1 [, col2, ...]
HAVING condition_02
ORDER BY col1 [ASC | DESC] [, col2 ...]
LIMIT n;
```

- **`WHERE`** : Filtre les lignes avant le groupement.  
- **`GROUP BY`** : Définit les colonnes utilisées pour créer les groupes.  
- **`HAVING`** : Pose des conditions **après** le groupement (utile pour filtrer les groupes).  
- **`ORDER BY`** : Trie les résultats finaux.  

>[!WARNING] Attention
>Toutes les colonnes listées dans le `SELECT` doivent être soit incluses dans la clause `GROUP BY`, soit être utilisées dans une fonction de groupement.

---

## Calcul de la moyenne des heures de vol**

Calculez la **moyenne** des heures de vol pour chaque compagnie.

```sql
SELECT company, ROUND( AVG(num_flying), 2 ) AS avg_flying_hours
FROM pilots
GROUP BY company;
```

Cette requête utilise la fonction `AVG()` pour calculer la moyenne des heures de vol (`num_flying`) pour chaque compagnie (`company`). La clause `GROUP BY` permet de regrouper les résultats par compagnie.

---

## Moyenne filtrée par bonus

Calculez la **moyenne des heures de vol** des pilotes ayant un bonus de 200 €, par compagnie.

Récupérez les données suivantes pour mettre à jour vos données.

[data dump](./DUMP/data.sql)


```sql
-- ajout de la colonne bonus
ALTER TABLE companies
ADD COLUMN bonus DECIMAL(10, 2) DEFAULT 0;

SELECT company, ROUND( AVG(num_flying), 2 ) AS avg_flying_hours
FROM pilots
WHERE bonus = 200
GROUP BY company;
```

Cette requête filtre les pilotes ayant un bonus de 200 € et calcule la moyenne des heures de vol pour chaque compagnie en utilisant `AVG()`.

---

Listez les compagnies ayant **plus d’un pilote**, ainsi que leur **nombre de pilotes**.

```sql
SELECT company, COUNT(*) AS num_pilots
FROM pilots
GROUP BY company
HAVING COUNT(*) > 1;
```

La fonction `COUNT(*)` compte le nombre de pilotes pour chaque compagnie. La clause `HAVING COUNT(*) > 1` filtre les compagnies qui ont plus d'un pilote.

---

### Groupement multi-critères**

Calculez le **nombre de pilotes** par compagnie **et par type d’avion**.

```sql
SELECT company, plane, COUNT(*) AS num_pilots
FROM pilots
GROUP BY company, plane;
```

Cette requête groupe les pilotes par compagnie et par type d'avion (`plane`) et utilise la fonction `COUNT(*)` pour compter le nombre de pilotes dans chaque groupe.

---

### Étendue des heures de vol

Calculez l’**étendue** (différence entre les valeurs MAX et MIN) des heures de vol pour chaque compagnie.

```sql
SELECT company, MAX(num_flying) - MIN(num_flying) AS flying_range
FROM pilots
GROUP BY company;
```


---

### Somme des jours de vol

Affichez la **somme des jours de vol** par compagnie, uniquement pour celles où la somme dépasse 30 jours.

```sql
SELECT company, SUM(num_flying) AS total_days
FROM pilots
GROUP BY company
HAVING SUM(num_flying) > 30;
```

---

###  Moyenne filtrée par pays

Calculez la **moyenne des heures de vol** des compagnies basées en **Paris**.

```sql
SELECT company, AVG(num_flying) AS avg_flying_hours
FROM pilots
WHERE company IN (
    SELECT comp FROM companies WHERE city = 'Paris'
)
GROUP BY company;
```

Cette requête calcule la moyenne des heures de vol des compagnies dont le pays est la France. La sous-requête dans la clause `WHERE` permet de sélectionner les compagnies basées en France.
