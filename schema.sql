-- Modèle relationnel pour le système de gestion hôtelière


-- Table TYPE
CREATE TABLE TYPE (
    Type_Id INT PRIMARY KEY,
    Type_Name VARCHAR(100) NOT NULL
);

-- Table HOTEL
CREATE TABLE HOTEL (
    Hotel_Id INT PRIMARY KEY,
    Hotel_name VARCHAR(100) NOT NULL,
    Type_Id INT NOT NULL,
    FOREIGN KEY (Type_Id) REFERENCES TYPE(Type_Id)
);

-- Table CATEGORY
CREATE TABLE CATEGORY (
    Category_Id INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Beds_numbers INT NOT NULL
);

-- Table ROOM
CREATE TABLE ROOM (
    Room_Id INT PRIMARY KEY,
    Hotel_Id INT NOT NULL,
    Floor INT NOT NULL,
    Category_Id INT NOT NULL,
    FOREIGN KEY (Hotel_Id) REFERENCES HOTEL(Hotel_Id),
    FOREIGN KEY (Category_Id) REFERENCES CATEGORY(Category_Id)
);

-- Table EMPLOYEE
CREATE TABLE EMPLOYEE (
    Employee_Id INT PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Employee_Speciality VARCHAR(100),
    Hotel_Id INT NOT NULL,
    Superior_Id INT,
    FOREIGN KEY (Hotel_Id) REFERENCES HOTEL(Hotel_Id),
    FOREIGN KEY (Superior_Id) REFERENCES EMPLOYEE(Employee_Id)
);