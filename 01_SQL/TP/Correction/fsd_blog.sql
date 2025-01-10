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
(22, 'Créer une API REST avec Node.js', 'Une introduction à la création d\'API...', 1, '2025-01-22 09:00:00'),

-- Cybersécurité (3 articles)
(9, 'Configurer un VPN personnel', 'Protégez vos données avec un VPN adapté à vos besoins...', 2, '2025-01-09 10:00:00'),
(10, 'Les bases de la cryptographie', 'Comprenez les concepts fondamentaux pour sécuriser vos données...', 2, '2025-01-10 14:15:00'),
(11, 'Tester la sécurité de vos applications web', 'Découvrez les techniques d\'audit de sécurité...', 2, '2025-01-11 13:00:00'),

-- Intelligence Artificielle (2 articles)
(12, 'Les algorithmes d\'apprentissage supervisé', 'Une introduction aux algorithmes comme la régression et les arbres de décision...', 3, '2025-01-12 09:30:00'),
(13, 'Construire un modèle de classification d\'images', 'Utilisez TensorFlow pour créer un modèle simple...', 3, '2025-01-13 10:45:00'),

-- Développement Web (4 articles)
(15, 'Créer un design responsive avec CSS Grid', 'Utilisez CSS Grid pour concevoir des mises en page adaptatives...', 4, '2025-01-15 12:00:00'),
(16, 'Animer vos sites avec JavaScript', 'Apprenez à intégrer des animations interactives...', 4, '2025-01-16 14:00:00'),
(17, 'Optimiser les performances web', 'Les techniques pour accélérer le chargement de vos pages...', 4, '2025-01-17 16:00:00'),
(23, 'Les outils modernes pour le développement web', 'Boostez vos projets avec les dernières technologies...', 4, '2025-01-23 11:15:00'),

-- Cloud Computing (6 articles)
(18, 'Migrer vers le Cloud : Étapes et stratégies', 'Un guide pour planifier et exécuter une migration Cloud...', 5, '2025-01-18 09:00:00'),
(19, 'Comprendre les architectures Cloud hybrides', 'Les avantages d\'une approche hybride pour votre infrastructure...', 5, '2025-01-19 10:30:00'),
(20, 'Sécuriser vos applications dans le Cloud', 'Protégez vos données et vos services avec des pratiques de sécurité éprouvées...', 5, '2025-01-20 15:00:00'),
(24, 'Optimisation des coûts Cloud', 'Réduisez vos dépenses tout en conservant la performance...', 5, '2025-01-24 14:20:00'),
(25, 'Les solutions Serverless', 'Adoptez le Serverless pour simplifier la gestion...', 5, '2025-01-25 12:00:00'),
(26, 'Créer une infrastructure Cloud robuste', 'Découvrez comment concevoir des solutions résilientes...', 5, '2025-01-26 16:00:00');



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