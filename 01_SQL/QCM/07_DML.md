### QCM : Insertion des Données dans MySQL

#### **Question 1 : Quelle commande SQL permet d'insérer des données dans une table ?**  
- [ ] `INSERT`  
- [ ] `UPDATE`  
- [ ] `DELETE`  
- [ ] `SELECT`  

---

#### **Question 2 : Quelle est la syntaxe correcte pour insérer une ligne dans une table avec toutes les colonnes renseignées ?**  
- [ ] `INSERT ALL INTO table_name VALUES ('valeur1', 'valeur2');`  
- [ ] `INSERT INTO table_name VALUES ('valeur1', 'valeur2');`  
- [ ] `INSERT ROW table_name ('valeur1', 'valeur2');`  
- [ ] `INSERT INTO VALUES ('valeur1', 'valeur2') table_name;`  

---

#### **Question 3 : Pour insérer des données dans des colonnes spécifiques, laquelle de ces syntaxes est correcte ?**  
- [ ] `INSERT INTO table_name ONLY (colonne1, colonne2) VALUES ('valeur1', 'valeur2');`  
- [ ] `INSERT INTO table_name (colonne1, colonne2) VALUES ('valeur1', 'valeur2');`  
- [ ] `INSERT INTO (colonne1, colonne2) VALUES ('valeur1', 'valeur2') INTO table_name;`  
- [ ] `INSERT INTO table_name SPECIFIC colonne1, colonne2 VALUES ('valeur1', 'valeur2');`  

---

#### **Question 4 : Quelle commande SQL est utilisée pour insérer plusieurs lignes en une seule commande ?**  
- [ ] `INSERT ONE`  
- [ ] `INSERT INTO ... VALUES (...), (...), (...);`  
- [ ] `BULK INSERT`  
- [ ] `INSERT MULTIPLE ROWS`  

---

#### **Question 5 : En quoi la commande `TRUNCATE` diffère-t-elle de `DELETE` ?**  
- [ ] `TRUNCATE` supprime toutes les lignes d'une table sans condition, réinitialisant les clés auto-incrémentées.  
- [ ] `TRUNCATE` permet de supprimer certaines lignes en fonction d'une condition.  
- [ ] `DELETE` réinitialise les clés auto-incrémentées de la table.  
- [ ] `DELETE` supprime des lignes spécifiques selon une condition.  

---

#### **Question 6 : Comment ajouter une colonne avec une valeur par défaut dans une table existante ?**  
- [ ] `ALTER TABLE table_name ADD COLUMN column_name;`  
- [ ] `ALTER TABLE table_name ADD COLUMN column_name TIMESTAMP DEFAULT CURRENT_TIMESTAMP;`  
- [ ] `ADD COLUMN column_name DEFAULT table_name;`  
- [ ] `MODIFY table_name ADD column_name DEFAULT value;`  

---

#### **Question 7 : Quelle commande permet de mettre à jour des colonnes existantes dans une table ?**  
- [ ] `INSERT`  
- [ ] `UPDATE`  
- [ ] `ALTER`  
- [ ] `TRUNCATE`  

---

#### **Question 8 : Quelle est la syntaxe correcte pour supprimer toutes les données d'une table tout en réinitialisant ses clés auto-incrémentées ?**  
- [ ] `DELETE FROM table_name;`  
- [ ] `TRUNCATE TABLE table_name;`  
- [ ] `DROP TABLE table_name;`  
- [ ] `CLEAR TABLE table_name;`  

---

#### **Question 9 : Quelle commande SQL est nécessaire pour insérer les données suivantes dans la table `pilots` ?**

| Certificate | Num Flying | Company | Name    |
|-------------|------------|---------|---------|
| ct-1        | 90         | AUS     | Alan    |

- [ ] `INSERT INTO pilots VALUES ('ct-1', 90, 'AUS', 'Alan');`  
- [ ] `INSERT INTO pilots (certificate, num_flying, company, name) VALUES ('ct-1', 90, 'AUS', 'Alan');`  
- [ ] `INSERT INTO pilots ('certificate', 'num_flying', 'company', 'name') VALUES ('ct-1', 90, 'AUS', 'Alan');`  
- [ ] `INSERT INTO pilots ('ct-1', 90, 'AUS', 'Alan');`  

---

#### **Question 10 : Quelle requête met à jour les informations suivantes pour un pilote nommé 'Alan' ?**
- **Date de naissance** : `2001-03-04`  
- **Prochain vol** : `2020-04-04 07:50:52`  
- **Nombre de missions** : `30`  

- [ ]  
```sql
UPDATE pilots
SET 
  birth_date = '2001-03-04 00:00:00',
  next_flight = '2020-04-04 07:50:52',
  num_jobs = 30
WHERE name = 'Alan';
```
- [ ]  
```sql
ALTER pilots
SET 
  birth_date = '2001-03-04',
  next_flight = '2020-04-04',
  num_jobs = 30
WHERE name = 'Alan';
```
- [ ]  
```sql
MODIFY pilots
SET 
  birth_date = '2001-03-04',
  next_flight = '2020-04-04',
  num_jobs = 30;
```
- [ ]  
```sql
UPDATE pilots
SET 
  birth_date = '2001-03-04',
  next_flight = '2020-04-04',
  num_jobs = 30;
```  