### QCM : Création d'une base de données (SQL)

#### **1. Quel moteur MySQL supporte les transactions et les clés étrangères ?**
- [ ] MyISAM  
- [ ] InnoDB  
- [ ] Memory  

---

#### **2. Parmi les affirmations suivantes, lesquelles sont vraies concernant une clé primaire ?**
- [ ] Elle est toujours UNIQUE.  
- [ ] Elle est toujours NOT NULL.  
- [ ] Une table peut avoir plusieurs clés primaires.  
- [ ] Elle est automatiquement indexée.  

---

#### **3. Quelle commande est correcte pour créer une base de données avec un encodage UTF-8 compatible avec les emojis ?**
- [ ] `CREATE DATABASE db_test CHARACTER SET utf8 COLLATE utf8_general_ci;`  
- [ ] `CREATE DATABASE db_test CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`  
- [ ] `CREATE DATABASE db_test CHARACTER SET ascii;`  

---

#### **4. Que fait la commande suivante ?**
```sql
ALTER TABLE companies ADD COLUMN status ENUM('published', 'unpublished', 'draft') DEFAULT 'draft';
```
- [ ] Ajoute une colonne `status` avec des valeurs possibles (`published`, `unpublished`, `draft`).  
- [ ] Modifie une colonne existante appelée `status`.  
- [ ] Supprime la colonne `status`.  
- [ ] Définit `draft` comme valeur par défaut pour la colonne `status`.  

---

#### **5. Comment ajouter une clé étrangère à une table ?**
- [ ] `ALTER TABLE pilots ADD CONSTRAINT fk_pilots_company FOREIGN KEY (company) REFERENCES companies(comp);`  
- [ ] `CREATE FOREIGN KEY fk_pilots_company ON pilots(company) REFERENCES companies(comp);`  
- [ ] `ALTER TABLE pilots MODIFY FOREIGN KEY fk_pilots_company REFERENCES companies(comp);`  

---

#### **6. Quelle est la commande pour renommer une colonne dans une table MySQL ?**
- [ ] `RENAME COLUMN old_name TO new_name;`  
- [ ] `ALTER TABLE table_name RENAME COLUMN old_name TO new_name;`  
- [ ] `MODIFY COLUMN old_name new_name;`  

---

#### **7. Parmi les affirmations suivantes sur la commande `CREATE TABLE`, lesquelles sont vraies ?**
- [ ] Vous pouvez définir une clé primaire lors de la création de la table.  
- [ ] Vous ne pouvez pas utiliser d'alias pour une contrainte de clé primaire.  
- [ ] Vous pouvez spécifier un type de moteur de stockage comme InnoDB.   

---

#### **8. Quelle commande permet d'insérer des données dans la table `flights` avec des colonnes spécifiques ?**
- [ ] `INSERT INTO flights (departure, destination, flight_date) VALUES ('Paris', 'New York', '2025-03-15');`  
- [ ] `ADD ROW TO flights (departure, destination, flight_date) ('Paris', 'New York', '2025-03-15');`  
- [ ] `INSERT flights VALUES ('Paris', 'New York', '2025-03-15');`  

---

#### **9. Que retourne la commande suivante ?**
```sql
DESCRIBE companies;
```
- [ ] La structure de la table `companies`.  
- [ ] Les données contenues dans la table `companies`.  
- [ ] Les bases de données disponibles sur le serveur.  

---

#### **10. Comment supprimer une base de données appelée `db_boston` ?**
- [ ] `DROP DATABASE db_boston;`  
- [ ] `DELETE DATABASE db_boston;`  
- [ ] `REMOVE DATABASE db_boston;`  

