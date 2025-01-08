
#### 1. **Somme des âges des pilotes**
   **Question** : Calculez la somme des âges des pilotes dans la table `pilots`.

   ```sql
   SELECT SUM(age) AS total_age
   FROM pilots;
   ```

---

#### 2. **Nombre total de pilotes par compagnie**
   **Question** : Obtenez le nombre total de pilotes pour chaque compagnie dans la table `pilots`.

   ```sql
   SELECT company, COUNT(*) AS num_pilots
   FROM pilots
   GROUP BY company;
   ```

---

#### 3. **Âge moyen des pilotes**
   **Question** : Calculez l'âge moyen des pilotes dans la table `pilots`.

   ```sql
   SELECT AVG(age) AS average_age
   FROM pilots;
   ```

---

#### 4. **Pilote le plus âgé**
   **Question** : Trouvez le pilote le plus âgé dans la table `pilots`.
   - Donnez l'age maxiaml des pilotes par compagnie.

   ```sql
    SELECT `name`, `age` FROM `pilots` WHERE age = (SELECT MAX(age) FROM pilots);
    SELECT `company`, MAX(`age`) as max_age_by_comp FROM `pilots` GROUP BY `company`  ;

   ```

---

#### 5. **Compagnies avec le plus grand nombre de pilotes**
   **Question** : Trouvez les compagnies ayant le plus grand nombre de pilotes. 
   Affichez les codes des compagnies ayant le plus grand nombre de pilots.

   ```sql
   SELECT company, COUNT(company) as nb
   FROM pilots 
   GROUP BY company
   HAVING nb = (
      -- On calcule le groupement ayant le max de pilote(s)
      SELECT COUNT(company) AS num_pilots -- max value
      FROM pilots
      GROUP BY company
      ORDER BY num_pilots DESC
      LIMIT 1)
   ;
   ```
---

#### 6. **Nombre de pilotes ayant volé plus de 30 heures**
   **Question** : Trouvez combien de pilotes ont un nombre total de vol supérieur à 30 heures.

   ```sql

   ```

---

#### 7. **Moyenne des heures de vol par compagnie**
   **Question** : Calculez la moyenne des heures de vol (`num_flying`) pour chaque compagnie.

   ```sql

   ```

---


#### 8. **Compagnies avec au moins 3 pilotes**
   **Question** : Affichez les compagnies ayant au moins 3 pilotes dans leur effectif.

   ```sql

   ```

---

#### 9. **Pilotes ayant volé plus que la moyenne**
   **Question** : Trouvez les pilotes ayant volé plus que la moyenne d'heures de vol dans la table `pilots`.

   ```sql
   SELECT name, num_flying
   FROM pilots
   WHERE num_flying > (SELECT ROUND( AVG(num_flying), 2 ) from pilots) ;
   ```

 

---

#### 10. **Compagnies avec un pilote ayant plus de 40 heures de vol**
   **Question** : Listez les compagnies ayant au moins un pilote ayant volé plus de 40 heures.

   ```sql
 SELECT company
   FROM pilots
   GROUP BY company
   HAVING MAX(num_flying) > 40;

   -- solution avec ANY 

   SELECT company
   FROM pilots p
   GROUP BY company
   HAVING 40 < ANY (SELECT num_flying FROM pilots WHERE company = p.company ) ;

   --- on peut aussi utiliser les fonctions de groupement

   SELECT 
      company, COUNT(*) as nb_pilots
   FROM pilots
   GROUP BY company
   HAVING MAX(num_flying) > 40;

   SELECT 
      company, COUNT(*) as nb_pilots, MAX(num_flying) as max_num_flying
   FROM pilots
   GROUP BY company
   HAVING MAX(num_flying) > 40;
   ```

---

#### 11. **Compagnies avec des pilotes ayant un âge moyen supérieur à 40 ans**
   **Question** : Trouvez les compagnies ayant des pilotes avec un âge moyen supérieur à 40 ans.

   ```sql
   SELECT company
   FROM pilots
   GROUP BY company
   HAVING AVG(age) > 40;
   ```

---

#### 12. Compagnies avec des pilotes ayant un bonus moyen supérieur à 500
   **Question** : Listez les compagnies où le bonus moyen des pilotes est supérieur à 500.

```sql
   SELECT company
   FROM pilots
   GROUP BY company
   HAVING AVG(bonus) > 200;
```

#### 13. Pilotes avec un bonus supérieur à la moyenne de leur compagnie
   **Question** : Trouvez les pilotes dont le bonus est supérieur à la moyenne des bonus des pilotes dans leur compagnie.

```sql

```

### 14 Trouvez les énoncés des trois requêtes suivantes

1. 

```sql
   SELECT 
      company, COUNT(*) 
   FROM pilots
   GROUP BY company
   HAVING MAX(num_flying) > 40;
```

2.

```sql
SELECT 
      company, COUNT(*), MAX(num_flying)
   FROM pilots
   GROUP BY company
   HAVING MAX(num_flying) > 40;
```

3.

```sql
SELECT 
   company, COUNT(*) 
FROM pilots
GROUP BY company
HAVING AVG(bonus) > 200;
```