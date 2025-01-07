##  Exercices Avancés sur le `GROUP BY`

### 1 Meilleur pilote par compagnie

Affichez le pilote ayant le maximum d'heures de vol pour chaque compagnie.

#### Indices : 
- Combinez `GROUP BY` avec une sous-requête ou une fonction de fenêtre (`WINDOW FUNCTION`) comme `ROW_NUMBER`.

### 2 Distribution des bonus

Classez les compagnies en fonction du total des bonus versés aux pilotes. Affichez uniquement les 3 premières compagnies avec un ordre décroissant des bonus.

#### Indices : 
- Utilisez `SUM` pour calculer le total des bonus par compagnie.  
- Utilisez `LIMIT 3` ou une clause `FETCH`.

### 3 Répartition des pilotes

Affichez pour chaque compagnie le pourcentage de pilotes qu’elle emploie par rapport au total des pilotes.

#### Indices :
- Utilisez une sous-requête pour obtenir le nombre total de pilotes.
- Calculez le pourcentage à l’aide de l’opérateur division.

### 4 Âge moyen des pilotes par tranche d’âge

Ajoutez une colonne fictive `age` à la table `pilots`, puis regroupez les pilotes par tranches d’âge (par exemple : 20-30, 31-40, etc.) et calculez l'âge moyen des pilotes dans chaque tranche.

#### Indices :
- Utilisez `CASE` pour créer des tranches d'âge. Exemple :  
  ```sql
  CASE
    WHEN age BETWEEN 20 AND 30 THEN '20-30'
    WHEN age BETWEEN 31 AND 40 THEN '31-40'
    ELSE '41+'
  END AS tranche_age
  ```

### 5 Performance moyenne par avion

Ajoutez une table `flights` avec les colonnes `pilot_id`, `plane`, et `performance_score`. Calculez la performance moyenne par type d’avion.

#### Indices :
- Faites un `JOIN` entre `pilots` et `flights` avant de grouper par `plane`.

### 6 Écart entre deux compagnies

Calculez la différence entre le salaire moyen des pilotes de deux compagnies spécifiques (`Air France` et `British Airways`).

#### Indices :
- Utilisez une sous-requête pour calculer les moyennes par compagnie, puis une différence dans une requête parente.

### 7 Variation des heures par mois

Ajoutez une colonne fictive `flight_date` à la table `flights`. Calculez pour chaque compagnie la somme des heures de vol par mois, puis identifiez les mois où la somme des heures est supérieure à une valeur donnée (par exemple, 500 heures).

#### Indices :
- Utilisez `EXTRACT(MONTH FROM flight_date)` pour grouper par mois.

---

## 7. Combinaisons avec plusieurs tables

### 7.1 Liste des compagnies actives

Créez une table `airports` avec les colonnes `airport_id` et `company`. Ajoutez une relation entre les compagnies et leurs aéroports. Affichez uniquement les compagnies ayant au moins 3 aéroports.

#### Indices :
- Faites un `JOIN` entre `pilots` et `airports`.  
- Utilisez `HAVING COUNT(*) >= 3`.

### 7.2 Vols annulés

Ajoutez une colonne `status` à la table `flights` (valeurs possibles : `completed`, `cancelled`). Calculez pour chaque compagnie le pourcentage de vols annulés.

#### Indices :
- Utilisez un `CASE` pour filtrer les vols annulés. Exemple :  
  ```sql
  SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) / COUNT(*) * 100
  ```

### 7.3 Analyse croisée : avion et mois

Affichez un tableau croisé des performances moyennes (`performance_score`) des pilotes pour chaque avion et chaque mois.

#### Indices :
- Combinez `GROUP BY plane, EXTRACT(MONTH FROM flight_date)`.

---

## 8. Exercices Défi

### 8.1 Combinaison complexe avec `GROUP BY`

Ajoutez une table `missions` avec les colonnes `mission_id`, `pilot_id`, `type` (`combat`, `training`), et `duration`.  
Calculez pour chaque compagnie :  
1. La durée totale des missions de combat.  
2. La durée totale des missions d’entraînement.  
3. La proportion des deux types de mission.

#### Indices :
- Combinez plusieurs `CASE` dans le `SELECT`. Exemple :  
  ```sql
  SUM(CASE WHEN type = 'combat' THEN duration ELSE 0 END) AS total_combat,
  SUM(CASE WHEN type = 'training' THEN duration ELSE 0 END) AS total_training
  ```

---

### 8.2 Classement dynamique des pilotes

Classez tous les pilotes en fonction de leur nombre total d’heures de vol au sein de leur propre compagnie, puis affichez leur rang.

#### Indices :
- Utilisez une fonction de fenêtre comme `RANK()` ou `DENSE_RANK()`.

---

### 8.3 Points cumulés sur les vols

Créez une table `points` avec les colonnes `pilot_id`, `flight_date`, et `points_earned`.  
Pour chaque pilote, affichez ses points cumulés jusqu’à chaque date (`cumulative sum`).

#### Indices :
- Utilisez une fonction de fenêtre comme `SUM(points_earned) OVER (PARTITION BY pilot_id ORDER BY flight_date)`.
