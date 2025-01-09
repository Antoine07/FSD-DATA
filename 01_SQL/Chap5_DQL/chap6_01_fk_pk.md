## **Clés primaires et étrangères avec les tables `pilots` et `companies`**

### **Introduction**

Les bases de données relationnelles s’appuient sur les **clés primaires** et les **clés étrangères** pour assurer l’intégrité des données et établir des relations solides entre les tables. Dans ce cours, nous illustrerons ces concepts en utilisant deux tables : `pilots` (pilotes) et `companies` (entreprises aériennes). Vous découvrirez comment les clés primaires et étrangères interagissent pour maintenir la cohérence des données et quelles options peuvent être configurées pour gérer les contraintes de clés étrangères.

---

### **1. La clé primaire (PRIMARY KEY)**

La **clé primaire** est une contrainte essentielle qui identifie de manière unique chaque ligne d’une table. Elle garantit qu’aucune donnée dupliquée ou incomplète ne puisse exister dans la colonne ou combinaison de colonnes qui en fait partie.

#### **Caractéristiques principales d’une clé primaire :**
- **Unicité** : Chaque valeur doit être unique.
- **Non-nullité** : Une clé primaire ne peut pas contenir de valeurs `NULL`.
- **Index** : le champ est indexé.

Dans notre exemple, la table `pilots` utilise la colonne `certificate` comme clé primaire. Cela signifie que chaque pilote doit posséder un certificat unique pour être identifié.

#### **Exemple dans la table `pilots` :**
```sql
CREATE TABLE `pilots` (
  `certificate` CHAR(20),
  -- Autres colonnes...
  PRIMARY KEY (`certificate`)
) ENGINE=InnoDB;

-- Ou avec une contrainte nommée
CREATE TABLE `pilots` (
  `certificate` CHAR(20),   
  -- Autres colonnes...
  CONSTRAINT `pk_pilots` PRIMARY KEY (`certificate`) 
) ENGINE=InnoDB;
```

💡 **Pourquoi une clé primaire ?**  
Elle permet de retrouver rapidement un enregistrement spécifique dans la table, sans ambiguïté. Par exemple, `certificate = 'ABC123'` correspondra toujours à un seul pilote.

---

### **2. La clé étrangère (FOREIGN KEY)**

La **clé étrangère** relie une table à une autre en associant une colonne (ou plusieurs) à une clé primaire dans la table référencée. Elle garantit l’intégrité des données en imposant que les valeurs de cette colonne correspondent uniquement à des valeurs valides dans la table cible.

Dans notre exemple, la table `pilots` est liée à la table `companies` par la colonne `company`. Cela signifie que chaque pilote doit appartenir à une entreprise existante.

#### **Exemple :**
```sql
CREATE TABLE `companies` (
    `comp` CHAR(10),
    -- Autres colonnes...
    CONSTRAINT `pk_companies_comp` PRIMARY KEY (`comp`) 
);

CREATE TABLE `pilots` (
  `certificate` CHAR(20),
  `company` CHAR(10),
  -- Autres colonnes...
  CONSTRAINT `pilots_companies_company` FOREIGN KEY (`company`) REFERENCES `companies` (`comp`)
);
```

💡 **Avantages de la clé étrangère :**  
- Garantir qu’une entreprise listée dans `pilots` existe réellement dans `companies`.
- Faciliter la suppression ou la mise à jour des données de manière cohérente.

#### **Définir les relations après la création des tables :**
```sql
-- Création des tables sans clé étrangère
CREATE TABLE `pilots` (
  `certificate` CHAR(20),
  `company` CHAR(10),
  -- Autres colonnes...
  PRIMARY KEY (`certificate`)
);

CREATE TABLE `companies` (
    `comp` CHAR(10),
    -- Autres colonnes...
    PRIMARY KEY (`comp`) 
);

-- Ajout de la contrainte de clé étrangère
ALTER TABLE `pilots`
ADD CONSTRAINT `fk_pilots_company` FOREIGN KEY (`company`) REFERENCES `companies` (`comp`);
```

---

### **3. Contraintes des clés étrangères**

Les contraintes associées aux clés étrangères permettent de maintenir l’intégrité des données en empêchant des opérations invalides.

#### **Cas typiques de contraintes :**
1. **Insertion ou mise à jour dans `pilots` :**  
   - Impossible d’ajouter un pilote avec une entreprise inexistante dans `companies`.
2. **Suppression ou modification dans `companies` :**  
   - Impossible de supprimer ou de modifier une entreprise si des pilotes y sont associés, sauf si une action spécifique est définie (ex. : `CASCADE`, `SET NULL`).

---

### **4. Options des clés étrangères**

Lorsqu’une clé étrangère est définie, vous pouvez configurer le comportement en cas de suppression ou modification des données référencées dans la table liée. Ces options se configurent avec `ON DELETE` et `ON UPDATE`.

#### **A. ON DELETE**  
1. **RESTRICT / NO ACTION (par défaut) :**  
   - Empêche la suppression de l’enregistrement dans `companies` si des pilotes y sont associés.

2. **SET NULL :**  
   - Remplace la valeur dans la colonne `company` de `pilots` par `NULL` si l’entreprise correspondante est supprimée.

3. **CASCADE :**  
   - Supprime automatiquement les pilotes associés lorsque l’entreprise est supprimée.

#### **Exemple avec `ON DELETE CASCADE` :**
```sql
CREATE TABLE `pilots` (
  `certificate` CHAR(20) NOT NULL,
  `company` CHAR(10) NOT NULL,
  -- Autres colonnes...
  CONSTRAINT `pilots_companies_company` FOREIGN KEY (`company`) 
    REFERENCES `companies` (`comp`)
    ON DELETE CASCADE
);
```

#### **B. ON UPDATE**  
1. **RESTRICT / NO ACTION :**  
   - Interdit la modification si elle viole une contrainte de clé étrangère.
2. **SET NULL :**  
   - Remplace la valeur dans la table liée par `NULL`.
3. **CASCADE :**  
   - Propage automatiquement les modifications dans les tables liées.

---

### **5. Exemple complet avec `pilots` et `companies`**

Voici un exemple combiné mettant en œuvre toutes les bonnes pratiques avec des options de gestion des suppressions et mises à jour.

```sql
CREATE TABLE `companies` (
  `comp` CHAR(10) NOT NULL,
  `name` VARCHAR(255) NOT NULL UNIQUE,
  -- Autres colonnes...
  PRIMARY KEY (`comp`)
) ENGINE=InnoDB;

CREATE TABLE `pilots` (
  `certificate` CHAR(20) NOT NULL,
  `company` CHAR(10) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  -- Autres colonnes...
  PRIMARY KEY (`certificate`),
  CONSTRAINT `fk_pilots_company` FOREIGN KEY (`company`) 
    REFERENCES `companies` (`comp`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE=InnoDB;
```

---

### **6. Conclusion**

Les clés primaires et étrangères sont des piliers de l’intégrité des bases de données relationnelles. Elles permettent de définir des relations solides entre les tables et d’automatiser les comportements en cas de modifications ou suppressions. 

Dans cet exemple avec `pilots` et `companies`, vous avez vu comment les contraintes et options telles que `ON DELETE` et `ON UPDATE` peuvent être utilisées pour garantir la cohérence des données tout en offrant une gestion flexible des relations.

💡 **Astuce :** Prenez toujours en compte les cas d’usage de vos données avant de définir les contraintes, afin d’éviter des blocages ou suppressions accidentelles.
