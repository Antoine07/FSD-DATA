# **Sous-requêtes en SQL**

Les sous-requêtes permettent de réaliser des requêtes imbriquées pour traiter des cas complexes. Elles peuvent être utilisées avec des clauses comme `IN`, `ALL`, `EXISTS`, ou encore dans des conditions.  

---

## **1. Introduction aux sous-requêtes**

Une sous-requête est une requête imbriquée à l'intérieur d'une autre.  

**Caractéristiques importantes :**  
- Les sous-requêtes sont entourées de parenthèses.  
- Elles doivent retourner un résultat compatible avec la requête principale.  
- L'utilisation de clauses comme `ORDER BY` dans une sous-requête est limitée (uniquement avec `LIMIT`).  

### **Exemple simple**  

Imaginons deux tables :  
- `pilots` avec des colonnes `id`, `name`, et `num_jobs`.  
- `companies` avec des colonnes `id`, `name`, et `num_street`.  

**Objectif :** Trouver les pilotes travaillant pour des compagnies situées dans certaines rues.  

```sql
SELECT * 
FROM pilots 
WHERE num_jobs IN (
    SELECT num_street 
    FROM companies
);
```

**Explications :**  
1. La sous-requête retourne une liste des `num_street` dans la table `companies`.  
2. La requête principale sélectionne les pilotes ayant un `num_jobs` correspondant à un `num_street` dans cette liste.  

---

## **2. Sous-requêtes avec IN**

La clause `IN` compare une valeur à une liste de résultats provenant d'une sous-requête.  

### **Exemple : Trouver les pilotes dans des rues spécifiques**

```sql
SELECT * 
FROM pilots 
WHERE num_jobs IN (
    SELECT num_street 
    FROM companies 
    WHERE city = 'Paris'
);
```

---

### **Attention à NOT IN**

La clause `NOT IN` retourne des résultats inattendus si la sous-requête contient des valeurs `NULL`.  

#### Exemple problématique :  

```sql
SELECT * 
FROM pilots 
WHERE num_jobs NOT IN (
    SELECT num_street 
    FROM companies
);
```

Si la sous-requête retourne une liste avec `NULL`, la condition sera toujours évaluée comme `FALSE`.  

**Solution : Filtrer les valeurs `NULL` dans la sous-requête :**  

```sql
SELECT * 
FROM pilots 
WHERE num_jobs NOT IN (
    SELECT num_street 
    FROM companies 
    WHERE num_street IS NOT NULL
);
```

---

## **3. Sous-requêtes avec ALL**

La clause `ALL` compare une valeur avec *toutes* les valeurs d'une sous-requête.  

### **Exemple simple :**

Trouver les compagnies où `num_street` est plus grand que toutes les valeurs d'une autre table.  

```sql
SELECT * 
FROM companies 
WHERE num_street > ALL (
    SELECT num_street 
    FROM pilots
);
```

**Explications :**  
1. La sous-requête retourne une liste de toutes les valeurs de `num_street` dans `pilots`.  
2. La condition vérifie si chaque `num_street` de `companies` est plus grand que **toutes** ces valeurs.  

---

### **Exercice : Appliquer des sous-requêtes avec ALL**  

Ajoutez les données suivantes à la table `companies` :  

```sql
UPDATE companies
SET street = 'Shenton Park', city = 'Perth', num_street = 20
WHERE comp = 'AUS';

UPDATE companies
SET street = 'Rue de la Lieure', city = 'Voiron', num_street = 11
WHERE comp = 'FRE1';
```

**Questions :**  
1. Trouvez les compagnies où le `num_street` est supérieur à toutes les valeurs dans `pilots`.  
2. Sélectionnez les pilotes ayant un nombre d’heures de vol inférieur à **toutes** les heures de vol des pilotes de la compagnie `CHI`.  

---

## **4. Sous-requêtes corrélées avec EXISTS**

Les sous-requêtes corrélées s’exécutent pour chaque ligne de la requête principale. L’opérateur `EXISTS` vérifie si une sous-requête retourne des résultats.  

### **Exemple simple : Trouver les compagnies ayant des pilotes**

```sql
SELECT * 
FROM companies 
WHERE EXISTS (
    SELECT 1 
    FROM pilots 
    WHERE pilots.num_jobs = companies.num_street
);
```

**Explications :**  
1. La sous-requête vérifie pour chaque compagnie si un pilote a le même `num_jobs` que le `num_street` de la compagnie.  
2. Si la sous-requête retourne un résultat, la ligne de la requête principale est incluse.  

---

### **Exercice : Sous-requêtes corrélées**

Ajoutez un champ `last_name` dans la table `pilots` :  

```sql
ALTER TABLE pilots 
ADD COLUMN last_name VARCHAR(50);

UPDATE pilots
SET last_name = 'Dupont' WHERE name IN ('Alan', 'Yi', 'Sophie');
UPDATE pilots
SET last_name = 'Chai' WHERE name IN ('Yan', 'Benoit', 'Pierre');
```

**Questions :**  
1. Trouvez les adresses des compagnies qui **n’ont pas de pilote**.  
2. Listez les pilotes ayant le même `last_name` en utilisant deux écritures différentes.  

---

## **5. Synthèse et bonnes pratiques**

### **Quand utiliser des sous-requêtes ?**  
- Lorsqu’un problème est difficile à résoudre avec des jointures seules.  
- Lorsque vous avez besoin de conditions complexes sur des données filtrées.  

### **Alternatives aux sous-requêtes :**  
- Les jointures sont souvent plus performantes pour les bases de données volumineuses.  

Voici cinq exercices supplémentaires qui suivent une progression plus douce, en s'appuyant sur vos tables `pilots` et `companies`. Ces exercices introduisent graduellement des concepts tout en renforçant les notions déjà vues.

---

#### **Exercice  Pilotes et compagnies**
Listez les pilotes et le nom de leur compagnie. Assurez-vous de n'afficher que les pilotes ayant une compagnie attribuée.

---

#### **Exercice Nombre de vols**
Calculez la somme totale des heures de vol effectuées par tous les pilotes affiliés à des compagnies situées en France (`city = 'France'`).

---

#### **Exercice  Pilotes récents**
Sélectionnez les pilotes ayant un certificat dont le numéro se termine par "1". Affichez leur nom, leur date de création (`created`) et leur compagnie.

---

#### **Exercice Compagnies sans numéros de rue**
Identifiez les compagnies pour lesquelles le numéro de rue (`num_street`) est NULL. Affichez leur nom et leur ville.

---

#### **Exercice  Sous-requête avec NOT EXISTS**
Trouvez les pilotes qui ne sont associés à aucune compagnie active, en utilisant une sous-requête avec `NOT EXISTS`.
