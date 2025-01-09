### **QCM : Fonctions SQL**

#### **1. Fonctions de chaînes**

1. Quelle fonction permet de convertir une chaîne de caractères en majuscules ?  
   - [ ] `LOWER`  
   - [ ] `UPPER`  
   - [ ] `CONCAT`  
   - [ ] `SUBSTRING`

2. Quelle fonction permet d’extraire une partie d'une chaîne de caractères ?  
   - [ ] `REPLACE`  
   - [ ] `CONCAT_WS`  
   - [ ] `SUBSTRING`  
   - [ ] `LENGTH`

3. Quelle fonction permet de concaténer plusieurs chaînes avec un séparateur ?  
   - [ ] `UPPER`  
   - [ ] `REPLACE`  
   - [ ] `CONCAT_WS`  
   - [ ] `SUBSTRING`

4. Que retourne la fonction `LENGTH` appliquée sur une chaîne de caractères ?  
   - [ ] La longueur de la chaîne  
   - [ ] La première lettre de la chaîne  
   - [ ] Les caractères en majuscules  
   - [ ] Une chaîne inversée

---

#### **2. Fonctions de nombres**

5. Quelle fonction arrondit un nombre à l'entier supérieur ?  
   - [ ] `FLOOR`  
   - [ ] `CEILING`  
   - [ ] `ROUND`  
   - [ ] `ABS`

6. Quel résultat renvoie la commande suivante ?  
   ```sql
   SELECT ROUND(12.3456, 2);
   ```  
   - [ ] `12`  
   - [ ] `12.3`  
   - [ ] `12.35`  
   - [ ] `12.345`

7. Quelle fonction est utilisée pour arrondir à un nombre entier inférieur ?  
   - [ ] `FLOOR`  
   - [ ] `CEILING`  
   - [ ] `ROUND`  
   - [ ] `ABS`

---

#### **3. Fonctions de dates**

8. Quelle fonction renvoie la date actuelle ?  
   - [ ] `CURRENT_TIMESTAMP`  
   - [ ] `YEAR`  
   - [ ] `CURDATE`  
   - [ ] `DATEDIFF`

9. Que fait la fonction `DATEDIFF` ?  
   - [ ] Ajoute un intervalle de temps à une date  
   - [ ] Formate une date dans un format spécifique  
   - [ ] Retourne l’année d’une date donnée  
   - [ ] Calcule la différence entre deux dates

10. Que fait cette requête ?  
    ```sql
    SELECT DATE_ADD('2025-01-01', INTERVAL 1 MONTH);
    ```  
    - [ ] Ajoute un jour à la date  
    - [ ] Ajoute une année à la date  
    - [ ] Ajoute un mois à la date  
    - [ ] Ajoute une heure à la date

---