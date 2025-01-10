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

```sql
CREATE DATABASE IF NOT EXISTS `db_blog`
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `db_blog`;

DROP TABLE IF EXISTS `posts`, `categories`;

CREATE TABLE `posts` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `content` TEXT,
    `created_at` DATETIME,
    CONSTRAINT `pk_posts_id` PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categories` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    CONSTRAINT `pk_categories_id` PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `posts` 
ADD COLUMN `category_id` INT AFTER id,
ADD CONSTRAINT `fk_posts_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL;
```

2. **Insertion des données :**  
   Ajoutez les données suivantes dans les tables.

```sql
INSERT INTO categories (id, name) VALUES
(1, 'Programmation'),
(2, 'Cybersécurité'),
(3, 'Intelligence Artificielle'),
(4, 'Développement Web'),
(5, 'Cloud Computing');

INSERT INTO posts (id, title, content, category_id, created_at) VALUES
-- Programmation (5 articles)
(6, 'Les meilleures pratiques en programmation', 'Apprenez les techniques pour écrire du code propre et maintenable...', 1, '2025-01-06 09:00:00'),
(7, 'Déboguer efficacement son code', 'Des outils et méthodes pour identifier et corriger les erreurs...', 1, '2025-01-07 11:30:00'),
(8, 'Introduction aux scripts Bash', 'Automatisez vos tâches avec des scripts shell...', 1, '2025-01-08 08:45:00'),
(21, 'Les frameworks populaires en programmation', 'Découvrez les frameworks les plus utilisés...', 1, '2025-01-21 10:00:00'),
(22, "Créer une API REST avec Node.js', 'Une introduction à la création d'API...", 1, '2025-01-22 09:00:00'),

-- Cybersécurité (3 articles)
(9, 'Configurer un VPN personnel', 'Protégez vos données avec un VPN adapté à vos besoins...', 2, '2025-01-09 10:00:00'),
(10, 'Les bases de la cryptographie', 'Comprenez les concepts fondamentaux pour sécuriser vos données...', 2, '2025-01-10 14:15:00'),
(11, 'Tester la sécurité de vos applications web', 'Découvrez les techniques d audit de sécurité...', 2, '2025-01-11 13:00:00'),

-- Intelligence Artificielle (2 articles)
(12, 'Les algorithmes d apprentissage supervisé', 'Une introduction aux algorithmes comme la régression et les arbres de décision...', 3, '2025-01-12 09:30:00'),
(13, 'Construire un modèle de classification d images', 'Utilisez TensorFlow pour créer un modèle simple...', 3, '2025-01-13 10:45:00'),

-- Développement Web (4 articles)
(15, 'Créer un design responsive avec CSS Grid', 'Utilisez CSS Grid pour concevoir des mises en page adaptatives...', 4, '2025-01-15 12:00:00'),
(16, 'Animer vos sites avec JavaScript', 'Apprenez à intégrer des animations interactives...', 4, '2025-01-16 14:00:00'),
(17, 'Optimiser les performances web', 'Les techniques pour accélérer le chargement de vos pages...', 4, '2025-01-17 16:00:00'),
(23, 'Les outils modernes pour le développement web', 'Boostez vos projets avec les dernières technologies...', 4, '2025-01-23 11:15:00'),

-- Cloud Computing (6 articles)
(18, 'Migrer vers le Cloud : Étapes et stratégies', 'Un guide pour planifier et exécuter une migration Cloud...', 5, '2025-01-18 09:00:00'),
(19, 'Comprendre les architectures Cloud hybrides', 'Les avantages d une approche hybride pour votre infrastructure...', 5, '2025-01-19 10:30:00'),
(20, 'Sécuriser vos applications dans le Cloud', 'Protégez vos données et vos services avec des pratiques de sécurité éprouvées...', 5, '2025-01-20 15:00:00'),
(24, 'Optimisation des coûts Cloud', 'Réduisez vos dépenses tout en conservant la performance...', 5, '2025-01-24 14:20:00'),
(25, 'Les solutions Serverless', 'Adoptez le Serverless pour simplifier la gestion...', 5, '2025-01-25 12:00:00'),
(26, 'Créer une infrastructure Cloud robuste', 'Découvrez comment concevoir des solutions résilientes...', 5, '2025-01-26 16:00:00');
```

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

```sql
SELECT 
   c.name AS category_name, 
   COUNT(p.id) AS post_count
FROM categories c
LEFT JOIN posts p ON c.id = p.category_id
GROUP BY c.id;
```

##### **Question 2 : Afficher la date de la première publication dans chaque catégorie**
Écrivez une requête SQL pour afficher la date de la première publication (en termes de `created_at`) pour chaque catégorie. Cette question met en lumière l'utilisation de la fonction `MIN()` pour récupérer la première date.

```sql
SELECT 
   c.name AS category_name, 
   MIN(p.created_at) AS first_publication_date
FROM categories c
LEFT JOIN posts p ON c.id = p.category_id
GROUP BY c.name;
```

##### **Question 3 : Afficher la catégorie avec le plus de publications**
Écrivez une requête SQL pour afficher la catégorie ayant le plus grand nombre de publications. Utilisez les fonctions d'agrégation et de tri (par exemple, `ORDER BY` et `LIMIT`) pour obtenir le bon résultat.

```sql
SELECT 
   c.name AS category_name, 
   COUNT(p.id) AS post_count
FROM categories c
LEFT JOIN posts p ON c.id = p.category_id
GROUP BY c.id, c.name
ORDER BY post_count DESC
LIMIT 1;
```

##### **Question 4 : Moyenne des publications par catégorie**
Écrivez une requête SQL qui calcule la moyenne du nombre de publications par catégorie. Pensez à utiliser la fonction `AVG()` et à bien structurer votre `GROUP BY`.

```sql
SELECT 
    ROUND(publication_count/(SELECT COUNT(*) FROM posts WHERE category_id IS NOT NULL), 2) as average_post, 
    ca.name
FROM (
  SELECT COUNT(p.id) AS publication_count, c.id
  FROM categories c
  LEFT JOIN posts p ON c.id = p.category_id
  GROUP BY c.id 
) AS pc
JOIN categories ca
ON ca.id = pc.id;
```

---

#### **2. Requêtes imbriquées**

##### **Question 5 : Trouver la catégorie avec le plus grand nombre de publications**
Écrivez une requête SQL utilisant une sous-requête pour afficher la catégorie ayant le plus grand nombre de publications. Pensez à utiliser `GROUP BY` dans la sous-requête et à trier les résultats pour obtenir la catégorie avec le plus de publications.

```sql
SELECT name
FROM categories
WHERE id = (
  SELECT category_id
  FROM posts
  GROUP BY category_id
  ORDER BY COUNT(id) DESC
  LIMIT 1
);
```

---

#### **3. Autres requêtes**

##### **Question 6 : Afficher les publications et leurs catégories**
Écrivez une requête SQL qui affiche le titre de chaque publication et son nom de catégorie associé. Cette question vous permet de travailler avec une jointure (`JOIN`) entre les tables `posts` et `categories`.

```sql
SELECT 
   p.title AS post_title, 
   c.name AS category_name
FROM posts p
JOIN categories c ON p.category_id = c.id;
```

##### **Question 7 : Afficher les publications avec les catégories dont le nom contient "Cloud"**
Écrivez une requête SQL qui affiche les publications et leurs catégories, mais uniquement pour celles dont le nom de catégorie contient le mot "Cloud". Utilisez la clause `LIKE` pour effectuer une recherche sur le nom de la catégorie.

```sql
SELECT 
   p.title AS post_title, 
   c.name AS category_name
FROM posts p
JOIN categories c ON p.category_id = c.id
WHERE c.name LIKE '%Cloud%';
```

---

### **4. Création d'une table `comments` pour les publications**

Pensez à bien définir les relations entre la table `posts` et `comments` en utilisant les clés étrangères.

```sql
CREATE TABLE `comments` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `content` TEXT NOT NULL
);

ALTER TABLE `comments` 
ADD COLUMN `post_id` INT AFTER id,
ADD CONSTRAINT `fk_comments_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
```

##### **Question 8 : Créer une table `comments` et lier les commentaires aux publications**
Ajoutez une nouvelle table `comments` permettant aux utilisateurs de commenter les publications. Chaque commentaire doit être lié à une publication spécifique. Cette question permet de travailler sur les relations un-à-plusieurs entre les publications et les commentaires.

1. Rédigez le code SQL pour créer la table `comments` avec les colonnes suivantes :
   - `id` (clé primaire)
   - `content` (le texte du commentaire)
   - `post_id` (clé étrangère liée à la table `posts`)

2. Ajoutez quelques commentaires d exemple dans cette table.

#### Exemple de données à insérer dans la table `comments` :
| id  | content                             | post_id |
|-----|-------------------------------------|---------|
| 1   | "Ce guide Python est très utile !"  | 1       |
| 2   | "Très bon article sur la cybersécurité." | 2     |
| 3   | "L'IA va vraiment révolutionner le secteur." | 3   |

```sql
INSERT INTO comments (id, content, post_id) VALUES
(1, 'Ce guide Python est très utile !', 1),
(2, 'Très bon article sur la cybersécurité.', 2),
(3, 'L IA va vraiment révolutionner le secteur.', 3);

```

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

```sql
CREATE TABLE tags (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL
);
```

2. **Table de liaison `post_tag`** : Cette table va établir la relation many-to-many entre les publications et les tags. Elle contiendra deux colonnes de clés étrangères, une vers la table `posts` et l'autre vers la table `tags`.

```sql
CREATE TABLE `post_tag` (
    `post_id` INT,
    `tag_id` INT,
    FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (`post_id`, `tag_id`)
);
```
   
#### **Données à insérer dans la table `tags` :**

| id  | name              |
|-----|-------------------|
| 1   | Python            |
| 2   | Sécurité          |
| 3   | Intelligence Artificielle |
| 4   | Web               |
| 5   | Cloud             |

```sql
INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'Python'),
(2, 'Sécurité'),
(3, 'Intelligence Artificielle'),
(4, 'Web'),
(5, 'Cloud');
```

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

```sql
INSERT INTO `post_tags` (`post_id`, `tag_id`) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (1, 4), (2, 1);
```

### **6. Requêtes SQL liées aux tags**

#### **Question 1 : Afficher les tags associés à chaque publication**
Écrivez une requête SQL qui affiche le titre de chaque publication ainsi que les tags associés à cette publication.

```sql
SELECT 
   p.title AS post_title, t.name AS tag_name
FROM posts p
JOIN post_tags pt ON p.id = pt.post_id
JOIN tags t ON pt.tag_id = t.id;
```

#### **Question 2 : Afficher les publications ayant un certain tag**
Écrivez une requête SQL pour afficher toutes les publications qui ont le tag "Python".

```sql
SELECT 
   p.title AS post_title
FROM posts p
JOIN post_tags pt ON p.id = pt.post_id
JOIN tags t ON pt.tag_id = t.id
WHERE t.name = 'Python';
```

#### **Question 3 : Afficher les tags associés à une publication donnée**
Écrivez une requête SQL pour afficher les tags associés à la publication dont l'ID est 1.

```sql
SELECT 
   t.name AS tag_name
FROM tags t
JOIN post_tags pt ON t.id = pt.tag_id
WHERE pt.post_id = 1;
```