### **Exercices de base sur l'agrégation**

#### 1. **Somme des âges des pilotes**
   **Question** : Calculez la somme des âges des pilotes dans la table `pilots`.

   ```sql
  
   ```

---

#### 2. **Nombre total de pilotes par compagnie**
   **Question** : Obtenez le nombre total de pilotes pour chaque compagnie dans la table `pilots`.

   ```sql
  
   ```

---

#### 3. **Âge moyen des pilotes**
   **Question** : Calculez l'âge moyen des pilotes dans la table `pilots`.

   ```sql
   ```

---

#### 4. **Pilote le plus âgé**
   **Question** : Trouvez le pilote le plus âgé dans la table `pilots`.

   ```sql

   ```

---

#### 5. **Compagnies avec le plus grand nombre de pilotes**
   **Question** : Trouvez les compagnies ayant le plus grand nombre de pilotes. Affichez le nom de la compagnie et le nombre de pilotes.

   ```sql

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
  
   ```

---

#### 10. **Compagnies avec un pilote ayant plus de 40 heures de vol**
   **Question** : Listez les compagnies ayant au moins un pilote ayant volé plus de 40 heures.

   ```sql
 
   ```

---

#### 11. **Compagnies avec des pilotes ayant un âge moyen supérieur à 40 ans**
   **Question** : Trouvez les compagnies ayant des pilotes avec un âge moyen supérieur à 40 ans.

   ```sql
  
   ```

---

#### 12. Compagnies avec des pilotes ayant un bonus moyen supérieur à 500
   **Question** : Listez les compagnies où le bonus moyen des pilotes est supérieur à 500.

```sql
SELECT company
FROM pilots
GROUP BY company
HAVING AVG(bonus) > 500;
```

#### 13. Pilotes avec un bonus supérieur à la moyenne de leur compagnie
   **Question** : Trouvez les pilotes dont le bonus est supérieur à la moyenne des bonus des pilotes dans leur compagnie.

```sql
SELECT name, bonus, company
FROM pilots p1
WHERE bonus > (
  SELECT AVG(bonus) 
  FROM pilots p2 
  WHERE p1.company = p2.company
);
```