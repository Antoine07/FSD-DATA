# 📚 Création d'une base de données

Nous allons travailler avec **MySQL** ou **MariaDB**, et surtout avec le moteur **InnoDB**.

Il existe plusieurs moteurs de bases de données. Pour MySQL, vous avez :  
- **MyISAM** : ❌ Pas de transactions, pas de Foreign Key, mais fonctionnalités de recherche de texte.  
- **InnoDB** : ✅ Supporte les transactions et les clés étrangères (le moteur le plus utilisé).  
- **Memory** : ⚡ Stockage dans la mémoire vive (utile pour les systèmes de cache).  

---

## 🔑 Modèle de données

### **🗂️ Table**

Le modèle relationnel repose sur l'algèbre relationnelle. Une **table relationnelle** contient :  
- Des **lignes (rows)** représentant les enregistrements.  
- Des **colonnes (columns)** décrivant les attributs.

---

### **🔐 Les clés**

- **Clé primaire (Primary Key)** : Identifie **de manière unique** chaque enregistrement.  
  ➡️ Astuce : Si aucune clé candidate naturelle n'existe, utilisez un identifiant numérique auto-incrémenté, souvent nommé **id**.  

- Une clé primaire est toujours :  
  - **NOT NULL**  
  - **UNIQUE**  
  - Un **INDEX** (structure ordonnée dans la base).  

> **💡 Note importante :**  
> Une table ne peut contenir **qu'une seule clé primaire**.

---

### **🌐 Clé étrangère (Foreign Key)**

Une **clé étrangère** référence une clé primaire d'une autre table pour établir une relation.  
- **Exemple de relation clé étrangère - clé primaire :**  
  ![table fk](../images/relation_fk_pk.png)

> **💡 Note importante :**  
> Une clé étrangère doit avoir **exactement le même type** que la clé primaire qu'elle référence.  

---

## 🏛️ Base de données

Une **base de données** regroupe plusieurs objets comme les tables, index, vues, procédures, etc., et est stockée sur un disque dur.

Pour accéder à une base de données MySQL, il faut :  
1. Une adresse (ou **host**) de la machine hébergeant le SGDB.  
2. Un login et un mot de passe.

---

## ⚙️ Commandes utiles

### **Se connecter au serveur MySQL :**
```bash
# Connexion en tant que root
mysql -u root -p

# Connexion à une base spécifique (exemple : book)
mysql> use book;
```

### **Commande rapide :**
```bash
mysql -u root -p --database myDataBase
```

### **Quitter MySQL :**
```bash
mysql> quit;
```

### **Afficher l'aide :**
```bash
mysql> ?
```

---

## 🛠️ DDL (Data Definition Language) 

> **💡 Conseil :**  
> Évitez les **caractères spéciaux** et les **espaces** dans les noms des bases et tables. Préférez des noms au **pluriel** pour les tables.

---

### **🛑 Commandes : CREATE, ALTER, DROP**

- **Créer une base de données :**
```sql
CREATE DATABASE IF NOT EXISTS `db_boston`;
```

- **Supprimer une base :**
```sql
DROP DATABASE `db_boston`;
```

> **💡 Note importante :**  
> Utilisez les accents graves (\`) pour échapper les noms (ex. : `db_name`) et éviter les conflits avec les mots-clés SQL.

---

### **📝 Préciser l'encodage lors de la création**

Depuis MySQL 8, utilisez **utf8mb4** (compatible avec plus de caractères) :  
```sql
CREATE DATABASE IF NOT EXISTS `db_aviation`
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

---

## 🛠️ Création d'une table

Exemple de table dans la base `db_aviation` :  
```sql
USE db_aviation;

CREATE TABLE `companies` (
    `comp` CHAR(4),   -- fixe c'est 4 caractères 
    `street` VARCHAR(20), -- variable de 0 à 20 caractère(s) plus opti pour la mémoire 
    `city` VARCHAR(20) NULL,
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT `pk_company` PRIMARY KEY (`comp`) -- plus souple si l'on veut supprimer la contrainte c'est un alias ou contrainte nommée
) ENGINE=InnoDB;

-- lister les tables de la base de données
SHOW TABLES ;
```

> **💡 Note :**  
> Utilisez la commande `describe` pour voir la structure d'une table :  
```bash
mysql> DESCRIBE companies;
```

---

## 🔧 Modifier une table (ALTER, RENAME)

### **Exemples courants :**
- **Changer le type d'une colonne :**
```sql
ALTER TABLE nom_table MODIFY nom_colonne type_de_données;
```

- **Renommer une colonne :**
```sql
ALTER TABLE nom_table RENAME COLUMN colonne_ancien_nom TO colonne_nouveau_nom;
```

> **⚠️ Attention :**  
> La commande `RENAME` peut ne pas fonctionner sur certains SGDB.

---

## 📝 Exercice : Modifier la table `companies`

1. Ajoutez un champ `status` de type **ENUM** avec les valeurs :  
   - `published`  
   - `unpublished`  
   - `draft` (valeur par défaut).  

2. Ajoutez une colonne `num_street`.

3. Supprimez la colonne `num_street`, puis recréez-la après la colonne `name` en utilisant **AFTER**.

---

## ✍️ Exercice : Créer la table `pilots`

Créez une table `pilots` avec la structure suivante :  
```text
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| certificate  | varchar(6)   | NO   | PRI | NULL    |       |
| num_flying   | decimal(7,1) | YES  |     | NULL    |       |
| company      | char(4)      | YES  | MUL | NULL    |       |
| name         | varchar(20)  | NO   | UNI | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
```

- Définissez une contrainte **UNIQUE** sur le champ `name` :  
```sql
ALTER TABLE pilots ADD CONSTRAINT uq_pilots_name UNIQUE(`name`);
```

- Ajoutez une clé étrangère `pilots.company` qui référence `companies.comp` :  
```sql
ALTER TABLE pilots ADD CONSTRAINT fk_pilots_company FOREIGN KEY (`company`) REFERENCES companies(`comp`);
```

## ✍️ **Exercice : Gestion des vols**  

Créez une table `flights` avec la structure suivante :  
```text
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| id           | INT           | NO   | PRI | NULL    | AI    |
| departure    | VARCHAR(30)   | NO   |     | NULL    |       |
| destination  | VARCHAR(30)   | NO   |     | NULL    |       |
| flight_date  | DATE          | NO   |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
```

### **Instructions :**  
1. Définissez `id` comme clé primaire.  
2. Insérez les données suivantes dans la table :  
   ```sql
   INSERT INTO flights (departure, destination, flight_date)
   VALUES 
   ('Paris', 'New York', '2025-03-15'),
   ('London', 'Tokyo', '2025-04-01'),
   ('Berlin', 'Madrid', '2025-04-10');
   ```
