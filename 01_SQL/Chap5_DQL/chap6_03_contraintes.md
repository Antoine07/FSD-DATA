# Contraintes en MySQL

### **1. PRIMARY KEY**
La contrainte `PRIMARY KEY` garantit qu'une colonne (ou une combinaison de colonnes) contient des valeurs uniques et non nulles. 

#### Exemple :
```sql
CREATE TABLE employees (
  employee_id INT NOT NULL,
  name VARCHAR(100),
  PRIMARY KEY (employee_id)
);
```
- **Explication** : `employee_id` est unique et ne peut pas être `NULL`.

---

### **2. UNIQUE**
La contrainte `UNIQUE` garantit que toutes les valeurs d'une colonne (ou d'un groupe de colonnes) sont uniques, mais autorise une seule valeur `NULL`.

#### Exemple :
```sql
CREATE TABLE users (
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  UNIQUE (email)
);
```
- **Explication** : Chaque utilisateur doit avoir une adresse e-mail unique.

---

### **3. NOT NULL**
La contrainte `NOT NULL` garantit qu'une colonne ne peut pas contenir de valeurs `NULL`.

#### Exemple :
```sql
CREATE TABLE orders (
  order_id INT NOT NULL,
  product_name VARCHAR(100) NOT NULL
);
```
- **Explication** : Ni `order_id` ni `product_name` ne peuvent être laissés vides.

---

### **4. DEFAULT**
La contrainte `DEFAULT` définit une valeur par défaut pour une colonne si aucune valeur n'est spécifiée lors de l'insertion.

#### Exemple :
```sql
CREATE TABLE products (
  product_id INT NOT NULL,
  price DECIMAL(10,2) DEFAULT 0.00
);
```
- **Explication** : Si aucun prix n'est fourni, la valeur par défaut sera `0.00`.

---

### **5. FOREIGN KEY**
La contrainte `FOREIGN KEY` établit une relation entre une colonne et une clé primaire (ou unique) dans une autre table, garantissant l'intégrité référentielle.

#### Exemple :
```sql
CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  department_id INT,
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments (department_id)
);
```
- **Explication** : Chaque `department_id` dans la table `employees` doit exister dans la table `departments`.

---

### **6. CHECK**
La contrainte `CHECK` impose une condition qui doit être respectée par toutes les valeurs insérées dans une colonne.

#### Exemple :
```sql
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  age INT CHECK (age > 0 AND age < 120)
);
```
- **Explication** : L'âge d'un étudiant doit être compris entre 1 et 119.

---

### **7. AUTO_INCREMENT**
La contrainte `AUTO_INCREMENT` génère automatiquement des valeurs uniques pour une colonne numérique, généralement utilisée pour les clés primaires.

#### Exemple :
```sql
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
```
- **Explication** : `order_id` est automatiquement incrémenté pour chaque nouvelle commande.

---

### **8. UNIQUE sur plusieurs colonnes**
Une contrainte `UNIQUE` peut être appliquée à une combinaison de colonnes pour garantir l'unicité de cet ensemble.

#### Exemple :
```sql
CREATE TABLE schedules (
  doctor_id INT,
  appointment_date DATE,
  UNIQUE (doctor_id, appointment_date)
);
```
- **Explication** : Un médecin ne peut avoir qu'un seul rendez-vous par jour.

---

### **9. INDEX**
Une contrainte d'index n'est pas strictement une contrainte, mais elle peut être utilisée pour accélérer les recherches dans une colonne.

#### Exemple :
```sql
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  email VARCHAR(100),
  INDEX idx_email (email)
);
```
- **Explication** : Un index est créé pour accélérer les recherches sur la colonne `email`.

---

### **10. CASCADE avec FOREIGN KEY**
Une contrainte de clé étrangère peut être combinée avec `ON DELETE CASCADE` ou `ON UPDATE CASCADE` pour définir le comportement lors de la suppression ou de la mise à jour.

#### Exemple :
```sql
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers (customer_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);
```
- **Explication** : Si un client est supprimé, toutes ses commandes seront également supprimées automatiquement.

---

### **Résumé des contraintes courantes**

| **Type**         | **Description**                                        |
|-------------------|--------------------------------------------------------|
| PRIMARY KEY       | Identifie de manière unique une ligne dans une table. |
| UNIQUE            | Garantit l'unicité des valeurs dans une colonne.      |
| NOT NULL          | Interdit les valeurs NULL.                            |
| DEFAULT           | Définit une valeur par défaut.                        |
| FOREIGN KEY       | Garantit une relation avec une autre table.           |
| CHECK             | Impose une condition sur les valeurs.                |
| AUTO_INCREMENT    | Génère des valeurs automatiques.                      |
