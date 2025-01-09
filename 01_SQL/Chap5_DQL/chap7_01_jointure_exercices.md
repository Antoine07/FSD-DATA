# Exercices

### **1. Liste des pilotes et leur compagnie**
Écrivez une requête qui affiche le nom des pilotes et le nom de leur compagnie.

```sql
SELECT 
    p.name as pilot_name,
    c.name as company_name
FROM pilots p
INNER JOIN companies c
ON c.comp = p.company;
```

---

### **2. Pilotes et leurs villes**
Trouvez les pilotes et les villes dans lesquelles se trouvent leurs compagnies. Affichez les colonnes `name` (pilote) et `city` (ville).

```sql
SELECT
    p.name as pilot_name,
    c.city as company_city
FROM pilots p 
INNER JOIN companies c 
ON c.comp = p.company; 
```

---

### **3. Compagnies sans pilotes**
Identifiez les compagnies qui n'ont aucun pilote assigné. Utilisez une jointure externe.

```sql
SELECT
    c.name as comapny_name
FROM companies c 
LEFT OUTER JOIN pilots p 
ON c.comp = p.company
WHERE p.company IS NULL;
```

---

### **4. Bonus total par compagnie**
Calculez le total des bonus des pilotes pour chaque compagnie. Affichez les colonnes `name` (compagnie) et `bonus` (bonus des pilotes).

```sql
SELECT
   c.name,
   SUM(p.bonus) as total_bonus
FROM pilots p 
INNER JOIN companies c 
ON c.comp = p.company
GROUP BY c.name;
```

---

### **5. Pilotes ayant plus de 40 vols**
Affichez le nom des pilotes, leur compagnie, et leur nombre de vols (`num_flying`) pour ceux ayant effectué plus de 40 vols.

```sql
SELECT 
    p.name as pilot_name,
    c.name as company_name,
    p.num_flying
FROM pilots p
INNER JOIN companies c
ON c.comp = p.company
WHERE p.num_flying > 40 ;
```

---

### **6. Âge moyen des pilotes par compagnie**
Affichez le nom des compagnies et l'âge moyen des pilotes qui y travaillent.

```sql
SELECT 
    c.name as company_name,
    ROUND( AVG(p.age), 2 ) as avg_age
FROM companies c
INNER JOIN pilots p
ON c.comp = p.company
GROUP BY c.name;
```

---

### **7. Détails des compagnies "published"**
Listez les noms des pilotes uniquement pour les compagnies ayant le statut "published" (voir les données et sinon voir le DUMP).

```sql
SELECT 
   p.name as pilot_name
FROM companies c
INNER JOIN pilots p
ON c.comp = p.company
WHERE c.status = 'published';
```
---

### **8. Correspondance entre bonus pilote et compagnie**
Trouvez les pilotes dont le bonus est égal ou supérieur au bonus de leur compagnie. Affichez les colonnes `name` (pilote), `bonus` (pilote), et `bonus` (compagnie).

```sql
SELECT 
    p.name as pilot_name,
    p.bonus as pilot_bonus, 
    c.bonus as company_bonus
FROM pilots p 
INNER JOIN companies c
ON c.comp = p.company
WHERE p.bonus >= c.bonus ;
```

---

*Les exercices suivants sont plus difficiles*

### 🎱 🎱  **Exercice 9. Pilotes par ville**
Affichez le nom des pilotes et la ville de leur compagnie pour les villes de "Paris", "Tokyo", et "New York".

```sql
SELECT 
    p.name as pilot_name,
    c.city as company_city
FROM pilots p
INNER JOIN companies c
ON c.comp = p.company
WHERE c.city IN ("Paris", "Tokyo", "New York");
```
---

### 🎱 🎱 **Exercice 10. Avion le plus utilisé par compagnie**
Pour chaque compagnie, identifiez le type d'avion (`plane`) le plus utilisé par les pilotes. Affichez le nom de la compagnie et le type d'avion.

```sql
SELECT 
    c.name as company_name,
    GROUP_CONCAT( p.plane ) as group_plane
FROM companies c
INNER JOIN pilots p
ON c.comp = p.company
GROUP BY c.name
ORDER BY LENGTH(group_plane) DESC;

SELECT 
    c.name AS company_name,
    p.plane AS plane_type,
    COUNT(*) AS usage_count -- compte le nombre de couple ( c.name, p.plane ) == nombre de fois qu'une compagnie utilise cet avion
FROM pilots p
INNER JOIN companies c
ON p.company = c.comp
GROUP BY c.name, p.plane
ORDER BY usage_count DESC;
```

---

### 🎱 🎱 **Exercice 11. Moyenne d'âge des pilotes par compagnie**
Affichez le nom des compagnies et la moyenne d'âge de leurs pilotes.

```sql
SELECT 
    c.name as company_name,
    ROUND(AVG(p.age)) as average_age
FROM companies c
INNER JOIN pilots p
ON c.comp = p.company
GROUP BY c.name;
```

---

###  🎱 🎱 **Exercice 12  Compagnies classées par nombre total de bonus**
Affichez les noms des compagnies et le total des bonus de leurs pilotes, triés par ordre décroissant.

```sql
SELECT 
    c.name as company_name,
    SUM(p.bonus) as total_bonus
FROM companies c
INNER JOIN pilots p
ON c.comp = p.company
GROUP BY c.name
ORDER BY total_bonus DESC;
```

--- 

### 🎱 🎱 **Exercice 13 Liste des compagnies avec leurs villes et la moyenne des heures de vol de pilotes de plus de 40 ans**

Affichez les noms des compagnies, leur ville et la moyenne des heures de vol pour les pilotes ayant plus de 40 ans.

```sql
SELECT 
     c.name as company_name,
     c.city as company_city,
     ROUND( AVG(p.num_flying), 2 ) as average_num_flying
FROM companies c
INNER JOIN pilots p
ON c.comp = p.company
WHERE p.age > 40
GROUP BY c.name, c.city ;
```