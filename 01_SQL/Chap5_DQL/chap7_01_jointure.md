# **Les Jointures SQL**

## **Introduction**

Les jointures permettent d'extraire des données issues de plusieurs tables dans une base de données relationnelle. Dans un modèle relationnel, les données sont généralement organisées en tables représentant des entités distinctes. Chaque table contient des informations spécifiques, et il devient nécessaire de combiner les données provenant de ces tables pour répondre à des besoins métier.

Par exemple, dans une base de données sur l'aviation :
- La table `companies` contient les informations sur les compagnies (nom, adresse, statut, etc.).
- La table `pilots` contient les informations sur les pilotes (nom, certificat, âge, nombre d'heures de vol, etc.).

Pour savoir à quelle compagnie appartient chaque pilote, une jointure entre ces deux tables est nécessaire.

---

## **Principe des jointures**

Une jointure relie deux tables en comparant des colonnes spécifiques, généralement :
- Une **clé étrangère (Foreign Key)** d'une table : une colonne qui fait référence à une autre table.
- Une **clé primaire (Primary Key)** dans l'autre table : une colonne unique identifiant chaque ligne.

Dans notre exemple, la clé primaire de la table `companies` est la colonne `comp`, et elle est référencée dans la table `pilots` via la clé étrangère `company`.

**Important** : Les clés primaires et étrangères sont souvent indexées, ce qui améliore les performances des jointures en rendant les recherches plus rapides.

---

## **Les différents types de jointures**

### **1. La jointure interne (INNER JOIN)**

#### **Description**
Une jointure interne extrait uniquement les lignes qui ont des correspondances dans les deux tables. Si une ligne n'a pas de correspondance dans l'une des tables, elle est ignorée dans le résultat.

#### **Caractéristiques**
- On utilise généralement une condition d'égalité (`=`) dans la clause de jointure.
- Utilisée pour récupérer les données communes entre deux tables.

#### **Exemple d'usage**
Supposons :
- Une table `companies` avec les colonnes `comp`, `name`, `status`.
- Une table `pilots` avec les colonnes `certificate`, `company`, `name`.

Pour obtenir la liste des pilotes et leurs compagnies :

```sql
SELECT p.name AS pilot_name, c.name AS company_name
FROM pilots AS p
INNER JOIN companies AS c
ON p.company = c.comp;
```

#### **Résultat**
| pilot_name       | company_name      |
|------------------|-------------------|
| Alice Martin     | Paris Air         |
| Pierre Dupont    | Paris Air         |
| Chlo Dubois      | Lyon Airways      |
| Hugo Lefevre     | Lyon Airways      |
...

---

### **2. La jointure externe (OUTER JOIN)**

#### **Description**
Une jointure externe permet d'inclure les lignes d'une table même si elles n'ont pas de correspondance dans l'autre table. Les données non correspondantes apparaissent avec des valeurs `NULL`.

Il existe plusieurs variantes :
- **LEFT OUTER JOIN** : Inclut toutes les lignes de la table gauche (dominante).
- **RIGHT OUTER JOIN** : Inclut toutes les lignes de la table droite (dominée).
- **FULL OUTER JOIN** : Inclut toutes les lignes des deux tables, qu'elles aient ou non des correspondances (non supporté par MySQL).

---

#### **a. LEFT OUTER JOIN**

Inclut toutes les lignes de la table gauche, même si aucune correspondance n'existe dans la table droite.

**Exemple** : Liste des pilotes et leurs compagnies, même si certains pilotes ne sont pas rattachés à une compagnie.

```sql
-- la table dominante est la table à gauche ici pilots
SELECT p.name AS pilot_name, c.name AS company_name
FROM pilots AS p
LEFT OUTER JOIN companies AS c
ON p.company = c.comp;

-- la table dominante est la table de droite ici companies

SELECT p.name AS pilot_name, c.name AS company_name
FROM pilots AS p
RIGHT OUTER JOIN companies AS c
ON p.company = c.comp;
```

Insérez dans la base de données des pilotes qui ne sont pas rattachés à une compagnie spécifique. 

#### **Résultat**

| pilot_name       | company_name      |
|------------------|-------------------|
| John Doe         | NULL              |
| Alice Martin     | Paris Air         |
| Pierre Dupont    | Paris Air         |
| Chlo Dubois      | Lyon Airways      |
...

---

#### **b. RIGHT OUTER JOIN**

Inclut toutes les lignes de la table droite, même si aucune correspondance n'existe dans la table gauche.

**Exemple** : Liste des compagnies et les pilotes qui y travaillent, même si certaines compagnies n'ont pas de pilotes.

```sql
SELECT c.name AS company_name, p.name AS pilot_name
FROM companies AS c
RIGHT OUTER JOIN pilots AS p
ON p.company = c.comp;
```

#### **Résultat**
| company_name | pilot_name        |
|--------------|-------------------|
| AirFly       | John Doe          |
| SkyHigh      | Jane Smith        |
| NULL         | Mike Brown        |

---

### **3. Autres types de jointures**

#### **Exclusion des correspondances**
Vous pouvez utiliser une jointure externe combinée avec une clause `WHERE` pour exclure les correspondances. Par exemple, afficher uniquement les pilotes sans compagnie.

```sql
SELECT p.name AS pilot_name
FROM pilots AS p
LEFT OUTER JOIN companies AS c
ON p.company = c.comp
WHERE c.comp IS NULL;
```

#### **FULL OUTER JOIN (non supporté par MySQL)**
Permet d'inclure toutes les lignes des deux tables, qu'il y ait correspondance ou non. 

Pour simuler un `FULL OUTER JOIN` dans MySQL, on peut utiliser une union :

```sql
SELECT p.name AS pilot_name, c.name AS company_name
FROM pilots AS p
LEFT OUTER JOIN companies AS c
ON p.company = c.comp
UNION
SELECT p.name AS pilot_name, c.name AS company_name
FROM pilots AS p
RIGHT OUTER JOIN companies AS c
ON p.company = c.comp;
```

---

## **Représentations visuelles**

Voici des représentations pour illustrer les différents types de jointures :

- **INNER JOIN** : Combinaison des pilotes et compagnies avec correspondance.
- **LEFT OUTER JOIN** : Tous les pilotes, même sans compagnie.
- **RIGHT OUTER JOIN** : Toutes les compagnies, même sans pilotes.
- **Exclusion** : Pilotes sans compagnie ou compagnies sans pilotes.

---

## **Conclusion**

Les jointures sont essentielles pour combiner des données dans un modèle relationnel. Le choix du type de jointure dépend du résultat attendu et de la relation entre les tables :
- **INNER JOIN** pour récupérer uniquement les données correspondantes.
- **LEFT/RIGHT OUTER JOIN** pour inclure les données non correspondantes d'une table.
- **FULL OUTER JOIN** pour inclure toutes les données des deux tables (si supporté).

**Note** : Utilisez des alias (`AS`) pour rendre vos requêtes plus lisibles, en particulier lorsqu'il y a des colonnes portant le même nom dans différentes tables.
