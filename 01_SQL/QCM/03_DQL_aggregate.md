### **QCM - DQL et Fonctions de Groupement**

#### **1. Quelle fonction est utilisée pour calculer la moyenne des valeurs d'une colonne ?**  
- [ ] `AVG()`  
- [ ] `SUM()`  
- [ ] `COUNT()`  
- [ ] `GROUP_CONCAT()`  

---

#### **2. La clause `GROUP BY` permet de :**  
- [ ] Regrouper les lignes selon une ou plusieurs colonnes.  
- [ ] Calculer des valeurs agrégées sur toutes les lignes de la table.  
- [ ] Trier les résultats d’une requête.  
- [ ] Filtrer les lignes selon une condition.  

---

#### **3. Quelle est la différence entre `WHERE` et `HAVING` ?**  
- [ ] `WHERE` filtre les groupes après le groupement, `HAVING` avant.  
- [ ] `WHERE` filtre les lignes avant le groupement, `HAVING` après.  
- [ ] Les deux clauses sont identiques.  
- [ ] `HAVING` est utilisé uniquement avec `ORDER BY`.  

---

#### **4. Quelle requête permet de compter les pilotes par compagnie ayant plus d'un pilote ?**  
- [ ]
```sql
SELECT company, COUNT(*) AS num_pilots  
FROM pilots  
GROUP BY company  
HAVING COUNT(*) > 1;  
```  
- [ ] 
```sql
SELECT company, COUNT(*)  
FROM pilots;  
```  
- [ ] 
```sql
SELECT company, COUNT(*)  
WHERE COUNT(*) > 1  
GROUP BY company;  
```  
- [ ] 
```sql
SELECT company, num_pilots  
FROM pilots  
GROUP BY company  
HAVING num_pilots > 1;  
```  

---

#### **5. Quelle fonction concatène les valeurs d'une colonne séparées par des virgules ?**  
- [ ] `MAX()`  
- [ ] `COUNT()`  
- [ ] `GROUP_CONCAT()`  
- [ ] `STDDEV()`  

---

#### **6. Quelle requête calcule l'étendue des heures de vol pour chaque compagnie ?**  
- [ ] 
```sql
SELECT company, MAX(num_flying) + MIN(num_flying) AS flying_range  
FROM pilots  
GROUP BY company;  
```  
- [ ] 
```sql
SELECT company, MAX(num_flying) - MIN(num_flying) AS flying_range  
FROM pilots  
GROUP BY company;  
```  
- [ ] 
```sql
SELECT company, MAX(num_flying) / MIN(num_flying) AS flying_range  
FROM pilots  
GROUP BY company;  
```  
- [ ] 
```sql
SELECT company, MAX(num_flying) AS flying_range  
FROM pilots  
GROUP BY company;  
```  

---

#### **7. Pour calculer la somme des jours de vol des compagnies dépassant 30 jours, quelle clause est nécessaire ?**  
- [ ] `HAVING SUM(num_flying) > 30`  
- [ ] `WHERE SUM(num_flying) > 30`  
- [ ] `GROUP BY num_flying > 30`  
- [ ] `ORDER BY SUM(num_flying) > 30`  

---

#### **8. Une requête contient la fonction `ROUND(AVG(num_flying), 2)`. Que fait cette fonction ?**  
- [ ] Elle calcule la moyenne des heures de vol et arrondit le résultat à deux décimales.  
- [ ] Elle arrondit chaque valeur avant de calculer la moyenne.  
- [ ] Elle calcule le total des heures de vol puis arrondit.  
- [ ] Elle affiche uniquement deux chiffres après la virgule pour toutes les colonnes.  
