## **QCM : Sous-requêtes en SQL**

### **1. Une sous-requête est toujours :**  
- [ ] Exécutée après la requête principale.  
- [x] Enfermée entre parenthèses.  
- [x] Compatible avec la requête principale en termes de types de données.  
- [ ] Obligatoirement une requête corrélée.  

---

### **2. Que renvoie la requête suivante ?**  
```sql
SELECT * 
FROM pilots 
WHERE company IN (
    SELECT comp 
    FROM companies 
    WHERE city = 'Paris'
);
```
- [ ] Les pilotes travaillant pour toutes les compagnies.  
- [x] Les pilotes travaillant pour des compagnies basées à Paris.  
- [ ] Les compagnies sans pilotes.  
- [ ] Rien, car `IN` ne fonctionne pas avec des sous-requêtes.  

---

### **3. Une sous-requête corrélée :**  
- [x] Est exécutée pour chaque ligne de la requête principale.  
- [ ] Ne peut pas être utilisée avec `SELECT`.  
- [ ] Est toujours plus rapide qu'une jointure.  
- [x] Doit contenir une référence à une table de la requête principale.  

---

### **4. Quelle solution permet d'éviter les problèmes liés à des valeurs `NULL` dans une sous-requête ?**  
- [ ] Ajouter un index sur la colonne concernée.  
- [ ] Utiliser uniquement des jointures.  
- [x] Filtrer les `NULL` dans la sous-requête avec `IS NOT NULL`.  
- [ ] Ajouter une colonne supplémentaire dans la table.

```sql
SELECT 1 FROM pilots WHERE 9 NOT IN ( 7, 8 , NULL ); -- retounre rien
SELECT 1 FROM pilots WHERE 9 NOT IN ( 7, 8  ) ; -- retourne autant de 1 que d'enregistrement dans la table 
```

---

### **5. La requête suivante est correcte :**  
```sql
SELECT * 
FROM pilots 
WHERE num_jobs IN (
    SELECT num_street 
    FROM companies
);
```
- [ ] Oui, car elle utilise une sous-requête valide.  
- [x] Non, car les colonnes comparées n'ont pas de lien logique.  
- [ ] Non, car `IN` ne peut pas être utilisé dans une sous-requête.  
- [ ] Oui, si `num_jobs` et `num_street` ont le même type de données.  

---

### **6. Trouver les compagnies sans pilotes en SQL peut se faire avec :**  
- [x] `NOT IN` avec un filtre sur les valeurs `NULL`.  
- [ ] `MAX` pour sélectionner les compagnies sans pilotes.  
- [ ] Une jointure avec `GROUP BY`.  
- [ ] Une sous-requête dans la clause `SELECT`.  

```sql
-- on cherche les companies qui n'ont pas de référence dans la table pilots
SELECT comp, name
   FROM companies
   WHERE comp NOT IN (
      SELECT
        DISTINCT company
      FROM pilots
      WHERE company IS NOT NULL
)
; 
```
---

### **7. Complétez cette phrase : Les sous-requêtes dans `SELECT` :**  
- [x] Peuvent retourner une seule valeur par ligne.  
- [ ] Sont interdites en SQL standard.  
- [ ] Ne peuvent pas inclure de jointures.  
- [x] Sont toujours plus rapides que les sous-requêtes corrélées.  

---
