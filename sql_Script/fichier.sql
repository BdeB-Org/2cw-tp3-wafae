
-- Création de la table client
CREATE TABLE client (
    id_client   NUMBER NOT NULL,
    nom         VARCHAR2(100) NOT NULL,
    prenom      VARCHAR2(100) NOT NULL,
    courriel    VARCHAR2(100) NOT NULL,
    mot_de_passe VARCHAR2(100) NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (id_client)
);

-- Création de la table categorie
CREATE TABLE categorie (
    id_categorie   NUMBER NOT NULL,
    nom_categorie  VARCHAR2(100) NOT NULL,
    description    VARCHAR2(2000),
    CONSTRAINT categorie_pk PRIMARY KEY (id_categorie)
);

-- Création de la table produit
CREATE TABLE produit (
    id_produit             VARCHAR2(100) NOT NULL,
    nom_produit            VARCHAR2(100) NOT NULL,
    prix                   NUMBER NOT NULL,
    prix_apres_reduction   NUMBER,
    id_categorie           NUMBER NOT NULL,
    CONSTRAINT produit_pk PRIMARY KEY (id_produit),
    CONSTRAINT produit_fk_categorie FOREIGN KEY (id_categorie) REFERENCES categorie (id_categorie)
);

-- Création de la table achat
CREATE TABLE achat (
    id_achat    NUMBER NOT NULL,
    id_produit  VARCHAR2(100) NOT NULL,
    id_client   NUMBER NOT NULL,
    CONSTRAINT achat_pk PRIMARY KEY (id_achat),
    CONSTRAINT achat_fk_produit FOREIGN KEY (id_produit) REFERENCES produit (id_produit),
    CONSTRAINT achat_fk_client FOREIGN KEY (id_client) REFERENCES client (id_client)
);

-- Insérer des données dans la table client
INSERT INTO client (id_client, nom, prenom, courriel, mot_de_passe)
VALUES (1, 'Doe', 'John', 'john.doe@example.com', 'motdepasse123');

INSERT INTO client (id_client, nom, prenom, courriel, mot_de_passe)
VALUES (1, 'Lola', 'Meryam', 'Meryam004@gmail.com', 'abcd123//t');
INSERT INTO client (id_client, nom, prenom, courriel, mot_de_passe)
VALUES (2, 'Doha', 'Jana', 'Doh004@gmail.com', 'jjj3457//00');

-- Insérer des données dans la table categorie
INSERT INTO categorie (id_categorie, nom_categorie, description)
VALUES (1, 'CENDRILLON', 'Il était une fois un brave homme qui vivait dans un pays lointain. Il avait une belle maison et une belle fille: Cendrillon.Peu après, son père est mort et elle est devenue la servante de sa cruelle marraine et de ses demi-sœurs, Javotte et Anasthasie. Un beau jour, le roi du pays décide de marier son fils, le prince. Il organise un bal et invite tous les nobles du royaume.Alors, tandis que les deux jeunes filles et leur mère se rendent au château, la marraine fée de Cendrillon transforme une citrouille en un élégant carrosse et quatre souris en chevaux blancs. Elle habille la jeune fille avec une belle robe de princesse et lui donne la permission d'aller à la réception jusqu'à minuit. Le prince tombe immédiatement amoureux de la belle inconnue, mais Cendrillon, entendant les 12 coups de minuit, s'enfuit. Dans sa fuite, elle perd une chaussure. Le lendemain, le gentilhomme vient chez elle et fait essayer la chaussure à Cendrillon sans problème. Cendrillon pardonne sa marraine et ses demi-soeurs avant de partir à la cour pour épouser le prince. Plus tard, elle invite Anastasie et Javotte et les marie à deux grands seigneurs.');

INSERT INTO categorie (id_categorie, nom_categorie, description)
VALUES (2, 'AURORE', 'La Belle au bois Dormant est un conte qui raconte l'histoire d'une princesse née d'un roi et d'une reine d'une grande bonté. Le jour de son baptême, on organisa une grande fête et on invita 7 fées qui devaient toutes prononcer un vœu. La princesse serait la plus belle, la plus intelligente, la plus gracieuse, chanterait comme un rossignol et danserait parfaitement. C'est alors qu'une méchante fée, oubliée pénétra dans la salle. Vexée de ne pas avoir été invitée, elle maudit la princesse et la condamna à mourir le jour de ses 16 ans, piquée par un fuseau. La dernière fée qui s'était cachée, n'avait pas encore fait son vœu et elle demanda que la princesse ne meurt pas mais qu'elle soit plongée dans un profond sommeil jusqu'au jour où un prince lui déposa un baiser. Le roi et la reine ont fait ce qu'il pouvaient pour protéger la princesse de cette malédiction mais un jour, alors qu'ils étaient absents, la princesse visita le château et tomba sur une salle avec une vieille femme en train de filer. La princesse se piqua le doigt et tomba instantanément endormie. On installa la princesse sur un lit. Au même moment, le château se recouvra de ronces et de pièges pour éviter que quiconque, et surtout pas un prince, puisse rejoindre la belle endormie. C'est alors que les fées endormirent tour à tour chaque personne du château pour les plonger eux aussi dans un profond sommeil. Des centaines de princes ont essayé de rejoindre le château sans succès. Au bout de 100 ans, le château et sa princesse endormie étaient devenus une légende. Seul un prince curieux s'étonna de voir les tours du château. On lui raconta la légende et il décida d'aller voir par lui-même. Il trouva la princesse endormie et lui déposa un baiser. C'est ainsi qu'il l'a libérée de son sommeil et que le reste du château se réveilla. Le prince demande au roi la main de sa fille et ils vécurent tous très heureux.');



-- Insérer des données dans la table produit
INSERT INTO produit (id_produit, nom_produit, prix, prix_apres_reduction, id_categorie)
VALUES ('fxh23340910', 'TALONS HAUTS', 110, 90.30, 2);

INSERT INTO produit (id_produit, nom_produit, prix, prix_apres_reduction, id_categorie)
VALUES ('vxh51980210', 'ROBE AURORA', 180, 150, 2);

INSERT INTO produit (id_produit, nom_produit, prix, prix_apres_reduction, id_categorie)
VALUES ('thf2044475163' , 'JOLIE COLLIER', 1010, 250, 1);

INSERT INTO produit (id_produit, nom_produit, prix, prix_apres_reduction, id_categorie)
VALUES ('stfk1298010' , 'BELLE*CHAUSSURE CENDRILLON', 143, 42, 1);

-- Insérer des données dans la table achat
INSERT INTO achat (id_achat, id_produit, id_client)
VALUES (1,vxh51980210 , 2);



-- Confirmation des données insérées
SELECT * FROM client;
SELECT * FROM categorie;
SELECT * FROM produit;

-- Ceci va creer un URI sous le URL qui pourra etre utilise pour y activer les tables en mode REST
BEGIN
  ORDS.enable_schema(
    p_enabled             => TRUE,
    p_schema              => 'RESTSCOTT',
    p_url_mapping_type    => 'BASE_PATH',
    p_url_mapping_pattern => 'hr2',
    p_auto_rest_auth      => FALSE
  );
    
  COMMIT;
END;
/
-- Activation de la table client pour accès REST
BEGIN
  ORDS.enable_object (
    p_enabled      => TRUE,
    p_schema       => 'RESTSCOTT', 
    p_object       => 'CLIENT',
    p_object_type  => 'TABLE',
    p_object_alias => 'client'
  );
  COMMIT;
END;
/

-- Activation de la table produit pour accès REST
BEGIN
  ORDS.enable_object (
    p_enabled      => TRUE,
    p_schema       => 'RESTSCOTT',
    p_object       => 'PRODUIT',
    p_object_type  => 'TABLE',
    p_object_alias => 'produit'
  );
  COMMIT;
END;
/

-- Activation de la table categorie pour accès REST
BEGIN
  ORDS.enable_object (
    p_enabled      => TRUE,
    p_schema       => 'RESTSCOTT', 
    p_object       => 'CATEGORIE',
    p_object_type  => 'TABLE',
    p_object_alias => 'categorie'
  );
  COMMIT;
END;
/

-- Activation de la table achat pour accès REST
BEGIN
  ORDS.enable_object (
    p_enabled      => TRUE,
    p_schema       => 'RESTSCOTT', 
    p_object       => 'ACHAT',
    p_object_type  => 'TABLE',
    p_object_alias => 'achat'
  );
  COMMIT;
END;
/
