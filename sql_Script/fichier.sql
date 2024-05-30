-- Création de la table client
CREATE TABLE client (
    id_client    NUMBER PRIMARY KEY,
    nom          VARCHAR2(100) NOT NULL,
    prenom       VARCHAR2(100) NOT NULL,
    courriel     VARCHAR2(100) NOT NULL,
    mot_de_passe VARCHAR2(255) NOT NULL
);

-- Création de la table categorie
CREATE TABLE categorie (
    id_categorie     NUMBER PRIMARY KEY,
    nom_categorie    VARCHAR2(100) NOT NULL,
    description      VARCHAR2(255)
);

-- Création de la table produit
CREATE TABLE produit (
    id_produit             NUMBER PRIMARY KEY,
    nom_produit            VARCHAR2(100) NOT NULL,
    prix                   NUMBER NOT NULL,
    prix_apres_reduction   NUMBER,
    id_categorie           NUMBER NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie)
);

-- Création de la table achat
CREATE TABLE achat (
    id_achat       NUMBER PRIMARY KEY,
    id_client      NUMBER NOT NULL,
    id_produit     NUMBER NOT NULL,
    id_achat       NUMBER NOT NULL,
    date_achat     DATE NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_produit) REFERENCES produit(id_produit)
);

