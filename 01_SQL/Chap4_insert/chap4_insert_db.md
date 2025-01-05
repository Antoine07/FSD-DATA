# **Insertion des Données dans MySQL**

Dans ce chapitre, nous allons explorer le **Langage de Manipulation des Données (LMD)** de MySQL. Nous allons nous concentrer sur trois principales commandes : 

- **INSERT** : pour ajouter des enregistrements.
- **UPDATE** : pour modifier des données existantes.
- **DELETE** et **TRUNCATE** : pour supprimer des enregistrements.

---

## **1. INSERT : Ajouter des données**

### **Syntaxe de base**

La commande `INSERT` permet d'insérer des données dans une table. Voici la syntaxe de base : 

```sql
INSERT INTO table_name
VALUES ('valeur1', 'valeur2', ...);
```

⚠ **Limitation** : Vous devez fournir une valeur pour **toutes les colonnes** de la table, sinon la commande échouera.

### **Syntaxe flexible**

Pour plus de souplesse, vous pouvez spécifier uniquement les colonnes à renseigner. Cependant, attention aux colonnes marquées comme `NOT NULL`, car elles exigent une valeur.

```sql
INSERT INTO table_name (colonne1, colonne2)
VALUES ('valeur1', 'valeur2');
```

### **Insertion multiple**

Vous pouvez insérer plusieurs lignes en une seule commande :

```sql
INSERT INTO table_name (colonne1, colonne2)
VALUES
  ('valeur1', 'valeur2'),
  ('valeur3', 'valeur4'),
  ('valeur5', 'valeur6');
```

---

## **2. Exemple pratique : Table `companies`**

Ajoutons les enregistrements suivants dans la table `companies` :

| comp  | street    | city       | name          | num_street | status |
|-------|-----------|------------|---------------|------------|--------|
| AUS   | sydney    | Australie  | AUSTRA Air    | 19         | draft  |
| CHI   | chi       | Chine      | CHINA Air     | NULL       | draft  |
| FRE1  | beaubourg | France     | Air France    | 17         | draft  |
| FRE2  | paris     | France     | Air Electric  | 22         | draft  |
| SIN   | pasir     | Singapour  | SIN A         | 15         | draft  |

### **Requête SQL :**

```sql
INSERT INTO companies (comp, street, city, name, num_street, status)
VALUES
  ('AUS', 'sydney', 'Australie', 'AUSTRA Air', 19, 'draft'),
  ('CHI', 'chi', 'Chine', 'CHINA Air', NULL, 'draft'),
  ('FRE1', 'beaubourg', 'France', 'Air France', 17, 'draft'),
  ('FRE2', 'paris', 'France', 'Air Electric', 22, 'draft'),
  ('SIN', 'pasir', 'Singapour', 'SIN A', 15, 'draft');
```

---

## **3. Ajouter une colonne avec une valeur par défaut**

Ajoutons une colonne `created` à la table `pilots`, initialisée automatiquement avec la date et l'heure de création de chaque nouvel enregistrement.

### **Requête SQL :**

```sql
ALTER TABLE pilots
ADD COLUMN created TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
```

---

## **4. Mise à jour des données**

Ajoutons des colonnes supplémentaires à la table `pilots` : 

- **`birth_date`** : Date de naissance.
- **`next_flight`** : Prochaine date de vol.
- **`num_jobs`** : Nombre de missions effectuées.

### **Requête SQL pour ajouter les colonnes :**

```sql
ALTER TABLE pilots
ADD COLUMN birth_date DATETIME,
ADD COLUMN next_flight DATETIME,
ADD COLUMN num_jobs INT;
```

### **Mise à jour des données :**

Voici un exemple pour mettre à jour les informations d'un pilote :

```sql
UPDATE pilots
SET 
  birth_date = '2001-03-04 00:00:00',
  next_flight = '2020-04-04 07:50:52',
  num_jobs = 30
WHERE name = 'Alan';
```

Appliquez une commande similaire pour chaque pilote.

---

## **5. Suppression des données : DELETE vs TRUNCATE**

### **1. DELETE : Suppression conditionnelle**

Supprime des lignes selon une condition.

```sql
DELETE FROM pilots WHERE name = 'Alan';
```

### **2. TRUNCATE : Suppression complète**

Vide la table **entièrement**, réinitialisant les valeurs auto-incrémentées.

```sql
TRUNCATE TABLE pilots;
```

### **Différences clés :**

| DELETE                               | TRUNCATE                             |
|--------------------------------------|--------------------------------------|
| Suppression selon des conditions.    | Supprime toutes les données.         |
| Peut être ralentie par des contraintes. | Plus rapide et libère l’espace.      |
| Les clés auto-incrémentées ne sont pas réinitialisées. | Les clés auto-incrémentées sont réinitialisées. |

---

## **6. Exercice : Sauvegarder avant suppression**

1. **Créer une copie de la table `pilots` :**

```sql
CREATE TABLE new_pilots AS SELECT * FROM pilots;
```

2. **Supprimer toutes les lignes de `pilots` :**

```sql
TRUNCATE TABLE pilots;
```

3. **Restaurer les données dans `pilots` depuis `new_pilots` :**

```sql
INSERT INTO pilots (certificate, num_flying, company, name, created, birth_date, next_flight, num_jobs)
SELECT * FROM new_pilots;
```

4. **Supprimer la table temporaire :**

```sql
DROP TABLE new_pilots;
```
