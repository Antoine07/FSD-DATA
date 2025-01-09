# **Gestion des publications et des catégories**

### **Contexte :**
Vous travaillez avec deux tables principales qui sont liées entre elles par des clés étrangères. Vous devrez gérer les publications et leur affectation à des catégories spécifiques.

- **`posts`** : Contient les informations relatives aux publications (titre, contenu, etc.).
- **`categories`** : Contient les catégories auxquelles chaque publication peut appartenir (une seule catégorie par publication).

### **Structure des tables :**

#### Table `posts`
| Colonne        | Type                         | Description                                                      |
|----------------|------------------------------|------------------------------------------------------------------|
| id             | INT (clé primaire)           | Identifiant unique de chaque publication.                       |
| title          | VARCHAR(255)                 | Titre de la publication.                                        |
| content        | TEXT                         | Contenu détaillé de la publication.                              |
| category_id    | INT (clé étrangère vers `categories`) | Lien vers la catégorie de la publication.                       |
| created_at     | DATETIME                     | Date et heure de la publication.                                |

#### Table `categories`
| Colonne        | Type                         | Description                                                      |
|----------------|------------------------------|------------------------------------------------------------------|
| id             | INT (clé primaire)           | Identifiant unique de chaque catégorie.                         |
| name           | VARCHAR(100)                 | Nom de la catégorie (ex: Programmation, Cybersécurité, etc.).   |

### **Objectifs :**

1. **Définir les tables :**  
   Rédigez le code SQL permettant de créer les tables `posts` et `categories` selon la structure ci-dessus.

2. **Insertion des données :**  
   Ajoutez les données suivantes dans les tables.

### **Données à insérer :**

#### Table `categories`
| id  | name                       |
|-----|----------------------------|
| 1   | Programmation               |
| 2   | Cybersécurité               |
| 3   | Intelligence Artificielle   |
| 4   | Développement Web           |
| 5   | Cloud Computing             |

#### Table `posts`
| id  | title                                 | content                                                                | category_id | created_at          |
|-----|---------------------------------------|------------------------------------------------------------------------|-------------|---------------------|
| 1   | "Introduction à Python"               | "Apprenez les bases du langage Python..."                             | 1           | 2025-01-01 10:00:00 |
| 2   | "Sécuriser son réseau domestique"     | "Découvrez les bonnes pratiques pour sécuriser votre réseau Wi-Fi..."| 2           | 2025-01-02 14:00:00 |
| 3   | "Les applications de l'IA en entreprise" | "L'Intelligence Artificielle transforme les entreprises..."          | 3           | 2025-01-03 09:30:00 |
| 4   | "Les bases du HTML et CSS"            | "Apprenez à créer des pages web interactives..."                       | 4           | 2025-01-04 11:00:00 |
| 5   | "Comprendre le Cloud Computing"      | "Le Cloud Computing change la manière dont les entreprises stockent..."| 5           | 2025-01-05 16:45:00 |

---

### **Requêtes SQL**

#### **1. Agrégation**

##### **Question 1 : Compter le nombre de publications par catégorie**
Écrivez une requête SQL qui affiche le nombre total de publications pour chaque catégorie. Vous devrez utiliser une agrégation (fonction `COUNT()`) pour compter les publications et les grouper par catégorie.

##### **Question 2 : Afficher la date de la première publication dans chaque catégorie**
Écrivez une requête SQL pour afficher la date de la première publication (en termes de `created_at`) pour chaque catégorie. Cette question met en lumière l'utilisation de la fonction `MIN()` pour récupérer la première date.

##### **Question 3 : Afficher la catégorie avec le plus de publications**
Écrivez une requête SQL pour afficher la catégorie ayant le plus grand nombre de publications. Utilisez les fonctions d'agrégation et de tri (par exemple, `ORDER BY` et `LIMIT`) pour obtenir le bon résultat.

##### **Question 4 : Moyenne des publications par catégorie**
Écrivez une requête SQL qui calcule la moyenne du nombre de publications par catégorie. Pensez à utiliser la fonction `AVG()` et à bien structurer votre `GROUP BY`.

---

#### **2. Requêtes imbriquées**

##### **Question 5 : Trouver la catégorie avec le plus grand nombre de publications**
Écrivez une requête SQL utilisant une sous-requête pour afficher la catégorie ayant le plus grand nombre de publications. Pensez à utiliser `GROUP BY` dans la sous-requête et à trier les résultats pour obtenir la catégorie avec le plus de publications.

---

#### **3. Autres requêtes**

##### **Question 6 : Afficher les publications et leurs catégories**
Écrivez une requête SQL qui affiche le titre de chaque publication et son nom de catégorie associé. Cette question vous permet de travailler avec une jointure (`JOIN`) entre les tables `posts` et `categories`.

##### **Question 7 : Afficher les publications avec les catégories dont le nom contient "Cloud"**
Écrivez une requête SQL qui affiche les publications et leurs catégories, mais uniquement pour celles dont le nom de catégorie contient le mot "Cloud". Utilisez la clause `LIKE` pour effectuer une recherche sur le nom de la catégorie.

---

### **4. Création d'une table `comments` pour les publications**

Pensez à bien définir les relations entre la table `posts` et `comments` en utilisant les clés étrangères.

##### **Question 8 : Créer une table `comments` et lier les commentaires aux publications**
Ajoutez une nouvelle table `comments` permettant aux utilisateurs de commenter les publications. Chaque commentaire doit être lié à une publication spécifique. Cette question permet de travailler sur les relations un-à-plusieurs entre les publications et les commentaires.

1. Rédigez le code SQL pour créer la table `comments` avec les colonnes suivantes :
   - `id` (clé primaire)
   - `content` (le texte du commentaire)
   - `post_id` (clé étrangère liée à la table `posts`)

2. Ajoutez quelques commentaires d'exemple dans cette table.

#### Exemple de données à insérer dans la table `comments` :
| id  | content                             | post_id |
|-----|-------------------------------------|---------|
| 1   | "Ce guide Python est très utile !"  | 1       |
| 2   | "Très bon article sur la cybersécurité." | 2     |
| 3   | "L'IA va vraiment révolutionner le secteur." | 3   |

---

### **Structure de la table `comments` :**

| Colonne   | Type                         | Description                                                      |
|-----------|------------------------------|------------------------------------------------------------------|
| id        | INT (clé primaire)           | Identifiant unique de chaque commentaire.                       |
| content   | TEXT                         | Contenu du commentaire.                                         |
| post_id   | INT (clé étrangère vers `posts`) | Référence à l'identifiant de la publication à laquelle le commentaire appartient. |

---

### **5. Création d'une table `tags` pour les publications**

#### **Créer une table `tags`**
Les tags permettent de classer les publications sous différents critères. Chaque publication peut avoir plusieurs tags, et chaque tag peut être associé à plusieurs publications.

1. **Création de la table `tags`** : Cette table contiendra les informations relatives aux tags.

2. **Table de liaison `post_tags`** : Cette table va établir la relation many-to-many entre les publications et les tags. Elle contiendra deux colonnes de clés étrangères, une vers la table `posts` et l'autre vers la table `tags`.
   
#### **Données à insérer dans la table `tags` :**

| id  | name              |
|-----|-------------------|
| 1   | Python            |
| 2   | Sécurité          |
| 3   | Intelligence Artificielle |
| 4   | Web               |
| 5   | Cloud             |

#### **Données à insérer dans la table `post_tags`** : Ces données vont lier les publications avec les tags.

| post_id | tag_id |
|---------|--------|
| 1       | 1      |
| 2       | 2      |
| 3       | 3      |
| 4       | 4      |
| 5       | 5      |
| 1       | 4      |
| 2       | 1      |

---

### **6. Requêtes SQL liées aux tags**

#### **Question 1 : Afficher les tags associés à chaque publication**
Écrivez une requête SQL qui affiche le titre de chaque publication ainsi que les tags associés à cette publication.

#### **Question 2 : Afficher les publications ayant un certain tag**
Écrivez une requête SQL pour afficher toutes les publications qui ont le tag "Python".

#### **Question 3 : Afficher les tags associés à une publication donnée**
Écrivez une requête SQL pour afficher les tags associés à la publication dont l'ID est 1.

