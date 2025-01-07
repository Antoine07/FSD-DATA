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

**Objectif :** Trouver les pilotes travaillant pour des compagnies situées dans certaines rues.  

```sql
SELECT * 
FROM pilots 
WHERE company IN (
    SELECT comp 
    FROM companies
);
```

---

## **2. Sous-requêtes avec IN**

La clause `IN` compare une valeur à une liste de résultats provenant d'une sous-requête.  

### **Exemple : Trouver les pilotes dans un pays spécifique**

```sql
SELECT * 
FROM pilots 
WHERE company IN (
    SELECT comp 
    FROM companies 
    WHERE city = 'France'
);
```

---

### **NOT IN**


#### Trouvez les `companies` qui n'ont pas de pilote.  

```sql
SELECT * 
FROM companies 
WHERE comp NOT IN (
    SELECT company 
    FROM pilots
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
