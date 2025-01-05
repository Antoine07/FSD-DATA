# 📚 SQL : Structured Query Language

## 🌟 Introduction

Dans ce cours, vous utiliserez **VSCode** pour écrire des requêtes que nous exécuterons en ligne de commande. 🚀

---

## 🛠️ Installation : MAC & Windows

### 💻 Installation sur MAC

1. **Téléchargez MAMP pour MAC**  
   👉 [Lien de téléchargement](https://documentation.mamp.info/en/MAMP-Mac/index.html)

2. **Installez MAMP** dans le dossier Applications sur votre Mac.

3. **Vérifiez l’installation de MySQL avec MAMP**  
   - Assurez-vous que **MAMP** est fonctionnel.  
   - Notez le chemin du binaire MySQL :
     ```bash
     /Applications/MAMP/Library/bin/
     ```

4. **Ajoutez les binaires MySQL à `/usr/local/bin`**  
   - Ouvrez le **Terminal**.  
   - Créez des liens symboliques pour accéder plus facilement aux commandes MySQL :  
     ```bash
     sudo ln -s /Applications/MAMP/Library/bin/mysql /usr/local/bin/mysql
     sudo ln -s /Applications/MAMP/Library/bin/mysqldump /usr/local/bin/mysqldump
     sudo ln -s /Applications/MAMP/Library/bin/mysqladmin /usr/local/bin/mysqladmin
     ```

5. **Testez votre installation**  
   - Vérifiez que MySQL est installé :  
     ```bash
     mysql --version
     ```  
   - Connectez-vous à MySQL :  
     ```bash
     mysql -u root -p -P [PORT]
     ```  
     Remplacez `[PORT]` par le port MySQL utilisé par MAMP (par défaut : `3306` ou `8889`).

---

### 🖥️ Installation sur Windows

1. **Téléchargez MAMP pour Windows**  
   👉 [Lien de téléchargement](https://documentation.mamp.info/en/MAMP-Windows/index.html)

2. **Installez MAMP**  
   - Suivez les étapes d’installation.  
   - Par défaut, MySQL est installé ici :  
     ```text
     C:\MAMP\bin\mysql\bin
     ```

3. **Ajoutez MySQL à la variable PATH**  
   - Ouvrez **Paramètres système** (recherchez "Variables d’environnement").  
   - Ajoutez le chemin suivant à la variable `Path` :  
     ```text
     C:\MAMP\bin\mysql\bin
     ```

4. **Testez votre installation**  
   - Ouvrez une **Invite de commande** et tapez :  
     ```cmd
     mysql --version
     ```  
   - Connectez-vous à MySQL :  
     ```cmd
     mysql -u root -p -P [PORT]
     ```  
     Remplacez `[PORT]` par `3306` ou `8889`.

---

## 🧪 Commandes de Base MySQL

- **Afficher les bases de données disponibles**  
  ```sql
  SHOW DATABASES;
  ```

- **Créer une base de données**  
  ```sql
  CREATE DATABASE testdb;
  ```

- **Utiliser une base de données**  
  ```sql
  USE testdb;
  ```

- **Quitter MySQL**  
  ```sql
  exit;
  ```

---

## 📖 SQL : Historique et Concepts

- 📅 Développé initialement par **IBM** en **1974** et normalisé en **1987**.
- SQL est un langage pour exploiter des **bases de données relationnelles** (données organisées dans des tables).

Un **SGDB** (Système de Gestion de Bases de Données) est un logiciel permettant d’enregistrer, extraire, mettre à jour ou supprimer des données.

---

## 🔍 Groupes de Commandes SQL

1. **DDL : Data Definition Language**  
   👉 `CREATE`, `ALTER`, `DROP`, `RENAME`  
   *Pour créer ou modifier des tables.*

2. **DQL : Data Query Language**  
   👉 `SELECT`  
   *Pour extraire des données.*

3. **DML : Data Manipulation Language**  
   👉 `INSERT`, `DELETE`, `UPDATE`  
   *Pour manipuler les enregistrements.*

4. **DCL : Data Control Language**  
   👉 `GRANT`, `REVOKE`, `COMMIT`, `ROLLBACK`  
   *Pour gérer les droits et les transactions.*

---

## 💡 Pourquoi MySQL ?

- **Avantages** :  
  ✅ Multiplateforme  
  ✅ Performances élevées pour les requêtes de lecture (DQL).

- **Inconvénients** :  
  ❌ Moins adapté aux bases de données de très grande taille.

---

## 📊 Structure de Données

Une base de données est constituée de tables, elles-mêmes constituées de colonnes et lignes :  

```text
+----+----------------+---------------+
| id | name           | department    |
+----+----------------+---------------+
|  1 | Cousin         | Haute-Garonne |
|  2 | Sauvage        | Guadeloupe    |
|  3 | Guerin         | Mayenne       |
|  4 | Jacquet        | Val-de-Marne  |
+----+----------------+---------------+
```

- `id` : Type **INTEGER**  
- `name` : Type **VARCHAR**  
- `department` : Type **VARCHAR**

---

## 🌍 Jeu de Caractères & Collation

- **UTF8** : Utilisé pour représenter des caractères internationaux.  
  - Exemple : Le caractère `é` est codé sur **2 octets** en UTF8.  
  - Recommandé pour les projets Web.

- **Collation** : Définit comment sont triés et comparés les caractères.  
  - Nous utiliserons :  
    - `utf8_general_ci` : Insensible à la casse, rapide pour les recherches.  
    - `utf8mb4_unicode_ci` : Permet de gérer plus de caractères.  

---

## 🖼️ Illustrations

- **Schéma d’un SGDB :**  
  ![sgdb](../images/sgbd.png)

- **Connexion à un serveur de bases de données :**  
  ![sgdb](../images/connect.png)

---

### 🎯 Résumé

Avec **MySQL**, nous travaillerons avec des bases de données en encodage **UTF8** pour garantir la compatibilité internationale. La collation choisie permettra des recherches rapides et insensibles à la casse.

🚀 Vous êtes prêts à plonger dans le monde des bases de données ! 🌟