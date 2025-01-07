# **Sous-requêtes en SQL**

Les sous-requêtes permettent de réaliser des requêtes imbriquées pour traiter des cas complexes. Elles peuvent être utilisées avec des clauses comme `IN`, `ALL`, `EXISTS`, ou encore dans des conditions.  

---

## **1. Introduction aux sous-requêtes**

Une sous-requête est une requête imbriquée à l'intérieur d'une autre.  

**Caractéristiques importantes :**  
- Les sous-requêtes sont entourées de parenthèses.  
- Elles doivent retourner un résultat compatible avec la requête principale.  

### **Exemple simple**  

Imaginons deux tables :  
- `pilots`
- `companies` 

**Objectif :** Trouver les pilotes travaillant pour des compagnies répertoriées dans la table `companies`.  

```sql
SELECT * 
FROM pilots 
WHERE company IN (
    SELECT comp 
    FROM companies
);
```

**Explication :**  
- La sous-requête retourne la liste des codes de compagnies (`comp`) dans la table `companies`.
- La requête principale sélectionne tous les pilotes dont le code de compagnie (`company`) correspond à un des résultats de la sous-requête.

---

## **2. Sous-requêtes avec IN**

La clause `IN` compare une valeur à une liste de résultats provenant d'une sous-requête.  

### **Exemple : Trouver les pilotes travaillant dans une ville spécifique**

```sql
SELECT * 
FROM pilots 
WHERE company IN (
    SELECT comp 
    FROM companies 
    WHERE city = 'Paris'
);
```

**Explication :**  
- La sous-requête extrait les codes de compagnies (`comp`) dont la ville (`city`) est "Paris".
- La requête principale sélectionne les pilotes associés à ces compagnies.

---

### **NOT IN**

#### Trouver les compagnies qui n'ont pas de pilote.  

```sql
SELECT * 
FROM companies 
WHERE comp NOT IN (
    SELECT company 
    FROM pilots
);
```

**Problème potentiel :** Si la sous-requête retourne des valeurs `NULL` dans la colonne `company`, la condition `NOT IN` échoue, car une comparaison avec `NULL` donne toujours `FALSE`.  

**Solution : Filtrer les valeurs `NULL` dans la sous-requête :**  

```sql
SELECT * 
FROM companies 
WHERE comp NOT IN (
    SELECT company 
    FROM pilots 
    WHERE company IS NOT NULL
);
```

---

## **3. Sous-requêtes corrélées**

Une sous-requête corrélée est exécutée une fois pour chaque ligne de la requête principale.  

### **Exemple : Trouver les pilotes avec un nombre de vols supérieur au nombre moyen de vols de leur compagnie**

```sql
SELECT * 
FROM pilots AS p  -- convention prendre la premiere lettre du nom de la table le AS est optionnel pilots p marche également
WHERE num_flying > (
    SELECT AVG(num_flying) 
    FROM pilots 
    WHERE company = p.company
);
```

**Explication :**  
- La sous-requête calcule la moyenne des vols (`AVG(num_flying)`) pour chaque compagnie (`company`).
- La requête principale compare le nombre de vols du pilote (`num_flying`) avec cette moyenne.

---

## **4. Sous-requêtes dans SELECT**

Les sous-requêtes peuvent également être utilisées pour enrichir les résultats d'une requête principale.  

### **Exemple : Afficher chaque pilote avec le nom de sa compagnie**

```sql
SELECT 
    p.name AS pilot_name,
    p.company AS pilot_company,
    (SELECT name 
     FROM companies 
     WHERE comp = p.company) AS company_name
FROM pilots p;
```

**Explication :**  
- La sous-requête retourne le nom de la compagnie (`name`) pour chaque pilote en faisant correspondre `comp` (code de la compagnie dans `companies`) avec `company` (code de la compagnie dans `pilots`).

---

## **5. Éviter les erreurs fréquentes**

### **Exemple d'erreur : Comparer des colonnes incompatibles**  

```sql
SELECT * 
FROM pilots 
WHERE num_jobs IN (
    SELECT num_street 
    FROM companies
);
```

**Problème :**  
- La colonne `num_jobs` représente un nombre d'emplois (entier), tandis que `num_street` est un numéro de rue (petit entier non signé).
- Ces deux colonnes n'ont aucun lien logique ou sémantique.

**Correction :** Utilisez des colonnes ayant un lien logique clair, comme `company` et `comp` pour lier les tables `pilots` et `companies`.  

---

## **6. Bonnes pratiques**

1. **Assurez-vous que les colonnes comparées ont un sens logique.**
   - Par exemple, liez `company` dans `pilots` à `comp` dans `companies`.
2. **Vérifiez la compatibilité des types de données.**
   - Utilisez `CAST` ou `CONVERT` si nécessaire pour harmoniser les types.
3. **Minimisez les sous-requêtes corrélées.**
   - Elles peuvent être inefficaces pour les grandes bases de données. Essayez de les remplacer par des jointures si possible.
4. **Gérez les valeurs `NULL`.**
   - Filtrez ou traitez explicitement les `NULL` pour éviter des comportements imprévisibles.


## Exercices

1.  Quelles sont les coordonnées des compagnies qui employent des pilotes faisant moins de 90 heures de vol ?

2. Sélectionnez le pilote ayant fait le plus d'heures de vol sans utiliser l'opérateur MAX.

3. Faites la somme des heures de vol des pilotes dont le nom de la compagnie est Air France, vous ne connaissez pas bien sûr la clef primaire de la compagnie.

4. Ajoutez maintenant la compagnie suivante dans la table companies.

```sql
INSERT INTO `companies`
SET `comp` = 'ITA', 
    `street` = 'mapoli', 
    `city` = 'Rome', 
    `name` = 'Italia Air',
    `num_street` = 20;
```

5. Trouvez toutes les compagnies n'ayant pas de pilotes.

6. Sélectionnez tous les pilotes dont le nombre d'heures de travail est inférieur à tous les nombres d'heures de travail de la compagnie CHI.

7. Sélectionnez la longueur des noms des pilotes dont la longueur de leurs noms est inférieur à toutes les longueurs des noms de la compagny FRE1.


8. Trouver les compagnies employant des pilotes expérimentés


9. Sélectionner le pilote le moins expérimenté

10. Calculer les heures totales de vol des pilotes d'une compagnie spécifique de votre choix**


11. Ajouter une nouvelle compagnie dans la table `companies`
**Objectif :** Insérez une nouvelle compagnie avec les données suivantes :  
- `comp`: 'NEW1'  
- `street`: 'Avenue de l'Air'  
- `city`: 'Toulouse'  
- `num_street`: 45  
- `name`: 'Skyline Aviation'  
- `status`: 'published'  

```sql
INSERT INTO companies (comp, street, city, num_street, name, status) 
VALUES ('NEW1', 'Avenue de l\'Air', 'Toulouse', 45, 'Skyline Aviation', 'published');
```

Trouver les pilotes avec des noms courts dans une compagnie donnée**
Sélectionnez les noms des pilotes dont la longueur de leurs noms est inférieure à la longueur des noms de tous les pilotes travaillant pour la compagnie "FRE1".  


12. (+++) Ajoutez la colonne plane à la table pilots :

```sql

UPDATE pilots
SET plane = 'A380'
WHERE name in ('Alan', 'Sophie', 'Albert', 'Benoit');

UPDATE pilots
SET plane = 'A320'
WHERE name in ('Tom', 'John', 'Yi');

UPDATE pilots
SET plane = 'A340'
WHERE name in ('Yan', 'Pierre');
```  

  
Sélectionnez les coordonnées des compagnies ayant des pilotes dont le nombre d'heures de vol est inférieur à tous les nombres d'heures de vol (chaque heure de vol) des A380.

