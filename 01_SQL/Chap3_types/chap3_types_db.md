# 📚 Les types dans MySQL

MySQL est un système de gestion de base de données **typé**, ce qui signifie que chaque colonne dans une table doit avoir un type de données bien défini. Ce type détermine la nature et les limites des valeurs que la colonne peut stocker.

## 🧮 **Types numériques**

### 1. **INT** (Integer)
- **Taille** : 4 octets (1 octet = 8 bits, par ex. `10100011`)
- **Intervalle** : de **-2 147 483 648** à **2 147 483 647**
- **Comportement** : Si une valeur dépasse cet intervalle, MySQL enregistre automatiquement la valeur maximale ou minimale autorisée.


### 2. **BIGINT**
- **Taille** : 8 octets  
- **Intervalle** : de **-9 223 372 036 854 775 808** à **9 223 372 036 854 775 807**


### 3. **TINYINT**
- **Taille** : 1 octet  
- **Intervalle signé** : de **-128** à **127**  
- **Intervalle unsigned** : de **0** à **255**


ℹ️ **Note** : `UNSIGNED` peut être utilisé avec d'autres types numériques pour interdire les valeurs négatives.

---

### 4. **DECIMAL(n, v)**  
Permet de stocker des nombres précis, utiles pour les données financières ou des mesures précises.
- `n` : Nombre total de chiffres significatifs.
- `v` : Nombre de chiffres après la virgule.


---

## ✍️ **Types de texte**

### 1. **CHAR(x)** et **VARCHAR(x)**  
Ces types sont utilisés pour des textes courts.

| Type       | Taille maximale | Comportement                              |
|------------|-----------------|-------------------------------------------|
| **CHAR(x)**   | x caractères     | Réserve toujours x caractères, même si la valeur est plus courte. |
| **VARCHAR(x)**| x caractères     | Stocke dynamiquement jusqu’à x caractères. |


### 2. **TEXT**  
Utilisé pour stocker des textes longs, avec une taille maximale de **65 535 caractères (2¹⁶ octets)**.


---

## 🔗 **Types spéciaux**

### 1. **BLOB**  
Un type binaire utilisé pour stocker de gros objets binaires, comme des images ou des fichiers.  
ℹ️ **Note** : Les chaînes de caractères dans un `BLOB` sont sensibles à la casse.

### 2. **ENUM**  
Permet de définir un ensemble de valeurs prédéfinies. Utile pour les colonnes ayant des valeurs fixes.

---

## 📅 **Types pour les dates et les heures**

### 1. **DATE**  
Représente une date sous le format `AAAA-MM-JJ`.

### 2. **DATETIME**  
Représente une date et une heure, au format `AAAA-MM-JJ HH:MM:SS`.

---

### ⚠️ **Remarque sur TIMESTAMP**  
Bien que MySQL propose un type `TIMESTAMP`, il est souvent mal implémenté. En informatique, un **timestamp** est le nombre de secondes écoulées depuis le 1er janvier 1970, 0h0min0s (date de naissance d'UNIX). Il est préférable d'utiliser `DATETIME` pour plus de cohérence.

---


### 💡 **Résumé des bonnes pratiques**
- **Choisir le type approprié** : 
  - Utilisez `TINYINT` ou `INT` pour des entiers, selon la taille nécessaire.
  - Préférez `VARCHAR` aux `CHAR` pour des textes dont la taille varie.
- **Optimisez l’espace** : Utilisez `UNSIGNED` pour interdire les valeurs négatives et étendre les plages des valeurs positives.
- **Précision** : Employez `DECIMAL` pour les calculs financiers.

---

```sql
CREATE TABLE example (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,   -- Clé primaire
    int_value INT,                               -- Exemple de type INT
    bigint_value BIGINT,                         -- Exemple de type BIGINT
    tinyint_value TINYINT UNSIGNED,              -- Exemple de type TINYINT UNSIGNED
    decimal_value DECIMAL(10, 2),                -- Exemple de type DECIMAL
    char_value CHAR(10),                         -- Exemple de type CHAR
    varchar_value VARCHAR(50),                   -- Exemple de type VARCHAR
    text_value TEXT,                             -- Exemple de type TEXT
    blob_value BLOB,                             -- Exemple de type BLOB
    enum_value ENUM('active', 'inactive', 'pending'), -- Exemple de type ENUM
    date_value DATE,                             -- Exemple de type DATE
    datetime_value DATETIME,                     -- Exemple de type DATETIME
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Exemple de type TIMESTAMP
);
```