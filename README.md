# Modele_Relationnel_Checkpoint

## Conversion de Modèle ER en Modèle Relationnel - Système de Gestion Hôtelière

## Description du projet

Ce projet représente la conversion d'un modèle entité-relation (ER) en modèle relationnel pour un système de gestion hôtelière. L'objectif est de transformer le diagramme conceptuel en un schéma de base de données implémentable.

---

## Contexte

Après la construction de ses hôtels dans une zone touristique, un directeur souhaite préparer une base de données pour faciliter la gestion de ses données. Le modèle ER fourni représente les entités et les relations du système hôtelier.

### Modèle ER initial

Le modèle ER initial comprend les entités suivantes :

- Hotel
- Type
- Room
- Category
- Employee
  
### Avec les relations suivantes

- Un Hotel "is" (est de) un Type (relation 1:N)
Un Hotel "is composed" (est composé) de chambres (relation 1:N)
Une chambre "is of" (est de) une catégorie (relation 1:N)
Un employé "works" (travaille) dans un hôtel (relation 1:N)
Un employé "leads" (dirige) d'autres employés (relation 1:N, auto-référence)

---

## Modèle relationnel

La conversion a donné lieu aux tables suivantes :

### 1. TYPE

- Type_Id (PK)
- Type_Name

### 2. HOTEL

- Hotel_Id (PK)
- Hotel_name
- Type_Id (FK)

### 3. CATEGORY

- Category_Id (PK)
- Category_Name
- Price
- Beds_numbrers

### 4. ROOM

- Room_Id (PK)
- Floor
- Hotel_Id (FK)
- Category_Id (FK)

### 5. EMPLOYEE

- Employee_Id (PK)
- Employee_Name
- Employee_Speciality
- Hotel_Id (FK)
- Superior_Id (FK auto-reference)

---

## Méthode de travail

Pour réaliser cette conversion, j'ai suivi les étapes suivantes :

1. Analyse minutieuse du diagramme ER pour identifier les entités, leurs attributs et les relations entre elles
2. Création des tables pour chaque entité en conservant les clés primaires
3. Ajout des clés étrangères selon les cardinalités des relations :
      Pour les relations 1:N, la clé étrangère est placée du côté "N" (plusieurs)
4. Gestion de la relation réflexive (auto-référence) dans la table EMPLOYEE
5. Vérification de la cohérence du modèle relationnel obtenu

---

## Contenu du dépôt

**README.md:** Ce fichier explicatif
**schema.sql:** Script SQL de création des tables selon le modèle relationnel
**Modele_ER_initial.png:** Image du diagramme ER initial
**Modele_relationnel.md:** Description détaillée du modèle relationnel
**Modele_Relationnel_Diagram.png:** Image du diagramme du modele relationel

---

## Outils utilisés

**VS Code** pour l'édition des fichiers
**GitHub** pour le versionning
**Mermaid** pour la représentation du modèle relationnel
