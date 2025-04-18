# Modèle Relationnel pour le Système de Gestion Hôtelière

Ce document présente le modèle relationnel obtenu après conversion du diagramme entité-relation (ER) du système de gestion hôtelière.

---

## Tables et attributs

### TYPE

**- Type_Id :** Identifiant unique du type (Clé primaire) /n
**- Type_Name :** Nom du type d'hôtel

### HOTEL

**- Hotel_Id :** Identifiant unique de l'hôtel (Clé primaire)
**- Hotel_name :** Nom de l'hôtel
**- Type_Id :** Référence au type d'hôtel (Clé étrangère vers TYPE)

### CATEGORY

**- Category_Id :** Identifiant unique de la catégorie (Clé primaire)
**- Category_Name :** Nom de la catégorie
**- Price :** Prix de la chambre dans cette catégorie
**- Beds_numbers :** Nombre de lits disponibles

### ROOM

**- Room_Id :** Identifiant unique de la chambre (Clé primaire)
**- Hotel_Id :** Référence à l'hôtel auquel appartient la chambre (Clé étrangère vers HOTEL)
**- Floor :** Étage où se trouve la chambre
**- Category_Id :** Référence à la catégorie de la chambre (Clé étrangère vers CATEGORY)

### EMPLOYEE

**- Employee_Id :** Identifiant unique de l'employé (Clé primaire)
**- Employee_Name :** Nom de l'employé
**- Employee_Speciality :** Spécialité ou fonction de l'employé
**- Hotel_Id :** Référence à l'hôtel où travaille l'employé (Clé étrangère vers HOTEL)
**- Superior_Id :** Référence au supérieur hiérarchique (Clé étrangère auto-référencée vers EMPLOYEE)

---

## Contraintes d'intégrité référentielle

1. Un hôtel doit être associé à un type existant.
2. Une chambre doit appartenir à un hôtel existant.
3. Une chambre doit être associée à une catégorie existante.
4. Un employé doit travailler dans un hôtel existant.
5. Un employé peut avoir un supérieur hiérarchique qui doit être un employé existant.

---

## Représentation des relations

**is :** Relation entre TYPE et HOTEL (1:N)

- Un type peut être associé à plusieurs hôtels
- Un hôtel correspond à exactement un type

**is composed :** Relation entre HOTEL et ROOM (1:N)

- Un hôtel peut avoir plusieurs chambres
- Une chambre appartient à exactement un hôtel

**is of :** Relation entre CATEGORY et ROOM (1:N)

- Une catégorie peut concerner plusieurs chambres
- Une chambre appartient à exactement une catégorie

**works :** Relation entre HOTEL et EMPLOYEE (1:N)

- Un hôtel peut employer plusieurs employés
- Un employé travaille dans exactement un hôtel

**leads :** Relation entre EMPLOYEE et EMPLOYEE (1:N, auto-référence)

- Un employé peut diriger plusieurs autres employés
- Un employé est dirigé par au plus un autre employé

---

## Règles de gestion

1. Chaque hôtel a un type spécifique.
2. Chaque chambre est située dans un hôtel spécifique et appartient à une catégorie spécifique.
3. Chaque employé travaille dans un hôtel spécifique.
4. La hiérarchie des employés est représentée par la relation "leads".
5. Le prix et le nombre de lits sont définis au niveau de la catégorie de chambre.

---

## ER Diagram avec Mermaid

### erDiagram

    TYPE {
        int Type_Id PK
        string Type_Name
    }
    
    HOTEL {
        int Hotel_Id PK
        string Hotel_name
        int Type_Id FK
    }
    
    CATEGORY {
        int Category_Id PK
        string Category_Name
        decimal Price
        int Beds_numbers
    }
    
    ROOM {
        int Room_Id PK
        int Hotel_Id FK
        int Floor
        int Category_Id FK
    }
    
    EMPLOYEE {
        int Employee_Id PK
        string Employee_Name
        string Employee_Speciality
        int Hotel_Id FK
        int Superior_Id FK
    }
    
    TYPE ||--o{ HOTEL : "is"
    HOTEL ||--o{ ROOM : "is composed"
    CATEGORY ||--o{ ROOM : "is of"
    HOTEL ||--o{ EMPLOYEE : "works"
    EMPLOYEE ||--o{ EMPLOYEE : "leads"
