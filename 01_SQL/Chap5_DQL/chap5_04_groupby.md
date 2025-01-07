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

**Note :**  
Si aucune clause `GROUP BY` n'est utilisée, les fonctions de groupement opèrent sur **l’ensemble des lignes** de la table.

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

⚠️ **Attention :**  
Toutes les colonnes listées dans le `SELECT` doivent être soit incluses dans la clause `GROUP BY`, soit être utilisées dans une fonction de groupement.

---

## **Exercices pratiques : Groupement de données**

### **01. Calcul de la moyenne des heures de vol**

Calculez la **moyenne** des heures de vol pour chaque compagnie.  

---

### **02. Moyenne filtrée par bonus**

Calculez la **moyenne des heures de vol** des pilotes ayant un bonus de 500 €, par compagnie.

---

### **03. Comptez les pilotes par compagnie**

Listez les compagnies ayant **plus d’un pilote**, ainsi que leur **nombre de pilotes**.

---

### **04. Ajout d’une colonne & mise à jour**

Ajoutez une colonne `plane` de type `ENUM` dans la table `pilots` avec les valeurs possibles `A380`, `A320`, `A340`.  
Mettez à jour les données comme suit :  

| **Pilote** | **Avion** |
|------------|-----------|
| Alan, Sophie, Albert, Benoit | A380 |
| Tom, John, Yi                 | A320 |
| Yan, Pierre                   | A340 |

---

### **05. Groupement multi-critères**

Calculez le **nombre de pilotes** par compagnie **et par type d’avion**.

---

### **06. Affichage des noms selon le bonus**

1. Affichez les noms des pilotes par montant de **bonus**.  
2. Affichez les noms et compagnies des pilotes par montant de **bonus**.

---

### **07. Étendue des heures de vol**

Calculez l’**étendue** (différence entre les valeurs MAX et MIN) des heures de vol pour chaque compagnie.

---

### **08. Somme des jours de vol**

Affichez la **somme des jours de vol** par compagnie, uniquement pour celles où la somme dépasse 30 jours.

---

### **09. Moyenne filtrée par pays**

Calculez la **moyenne des heures de vol** des compagnies basées en **France**.

---
