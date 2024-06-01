
CREATE TABLE achat (
    id_achat   NUMBER NOT NULL,
    id_client  NUMBER NOT NULL,
    id_produit NUMBER NOT NULL
);

ALTER TABLE achat ADD CONSTRAINT achat_pk PRIMARY KEY ( id_achat );

CREATE TABLE achat_fk_client (
    achat_id_achat   NUMBER NOT NULL,
    client_id_client NUMBER NOT NULL
);

ALTER TABLE achat_fk_client ADD CONSTRAINT achat_fk_client_pk
PRIMARY KEY ( achat_id_achat, client_id_client );

CREATE TABLE achat_produit (
    achat_id_achat     NUMBER NOT NULL,
    produit_id_produit NUMBER NOT NULL
);

ALTER TABLE achat_produit ADD CONSTRAINT achat_produit_pk
PRIMARY KEY ( achat_id_achat, produit_id_produit );

CREATE TABLE categorie (
    id_categorie  NUMBER NOT NULL,
    nom_categorie VARCHAR2(100) NOT NULL,
    description   VARCHAR2(2000)
);

ALTER TABLE categorie ADD CONSTRAINT categorie_pk PRIMARY KEY ( id_categorie );

CREATE TABLE client (
    id_client    NUMBER NOT NULL,
    nom          VARCHAR2(100) NOT NULL,
    prenom       VARCHAR2(100) NOT NULL,
    courriel     VARCHAR2(100) NOT NULL,
    mot_de_passe NVARCHAR2(100) NOT NULL
);

ALTER TABLE client ADD CONSTRAINT client_pk PRIMARY KEY ( id_client );

CREATE TABLE produit (
    id_produit           NUMBER NOT NULL,
    nom_produit          VARCHAR2(100) NOT NULL,
    prix                 NUMBER NOT NULL,
    prix_apres_reduction NUMBER,
    id_categorie         NUMBER NOT NULL
);

ALTER TABLE produit ADD CONSTRAINT produit_pk PRIMARY KEY ( id_produit );

CREATE TABLE produit_fk_categorie (
    produit_id_produit     NUMBER NOT NULL,
    categorie_id_categorie NUMBER NOT NULL
);

ALTER TABLE produit_fk_categorie ADD CONSTRAINT produit_fk_categorie_pk 
PRIMARY KEY ( produit_id_produit, categorie_id_categorie );

ALTER TABLE achat_fk_client
    ADD CONSTRAINT achat_fk_client_achat_fk FOREIGN KEY ( achat_id_achat )
        REFERENCES achat ( id_achat );

ALTER TABLE achat_fk_client
    ADD CONSTRAINT achat_fk_client_client_fk FOREIGN KEY ( client_id_client )
        REFERENCES client ( id_client );

ALTER TABLE achat_produit
    ADD CONSTRAINT achat_produit_achat_fk FOREIGN KEY ( achat_id_achat )
        REFERENCES achat ( id_achat );

ALTER TABLE achat_produit
    ADD CONSTRAINT achat_produit_produit_fk FOREIGN KEY ( produit_id_produit )
        REFERENCES produit ( id_produit );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE produit_fk_categorie
    ADD CONSTRAINT produit_fk_categorie_categorie_fk FOREIGN KEY ( categorie_id_categorie )
        REFERENCES categorie ( id_categorie );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE produit_fk_categorie
    ADD CONSTRAINT produit_fk_categorie_produit_fk FOREIGN KEY ( produit_id_produit )
        REFERENCES produit ( id_produit );


-- Ins�rer des nouveaux clients
INSERT INTO client (id_client, nom, prenom, courriel, mot_de_passe)
VALUES (1, 'Doe', 'John', 'john.doe@example.com', 'motdepasse123');
INSERT INTO client (id_client, nom, prenom, courriel, mot_de_passe)
VALUES (3, 'Doha', 'Jana', 'Doh004@gmail.com', 'jjj3457//00');
INSERT INTO client (id_client, nom, prenom, courriel, mot_de_passe)
VALUES (4, 'Marleine', 'Laura', 'Lau004@gmail.com', 'ddd3897//01');
INSERT INTO client (id_client, nom, prenom, courriel, mot_de_passe)
VALUES (5, 'Smith', 'Philip', 'Phil004@gmail.com', 'aaa357//06');
INSERT INTO client (id_client, nom, prenom, courriel, mot_de_passe)
VALUES (6, 'Alphonse', 'Tia', 'Tia004@gmail.com', 'eee7892//23');
SELECT *
from CLIENT;


-- Ins�rer des donn�es dans la table categorie
INSERT INTO categorie (id_categorie, nom_categorie, description)
VALUES (1, 'CENDRILLON', 'Il �tait une fois un brave homme qui vivait 
dans un pays lointain. Il avait une belle maison et une belle fille: 
Cendrillon.Peu apr�s, son p�re est mort et elle est devenue la servante de sa
cruelle marraine et de ses demi-s�urs, Javotte et Anasthasie. Un beau jour, le 
roi du pays d�cide de marier son fils, le prince.');

INSERT INTO categorie (id_categorie, nom_categorie, description)
VALUES (2, 'AURORE', 'La Belle au bois Dormant est un conte qui raconte 
l''histoire d''une princesse n�e d''un roi et d''une reine d''une grande bont�.
Le jour de son bapt�me, on organisa une grande f�te et on invita 7 f�es qui 
devaient toutes prononcer un v�u. La princesse serait la plus belle, la plus
intelligente, la plus gracieuse, chanterait comme un rossignol et danserait
parfaitement. C''est alors qu''une m�chante f�e, oubli�e p�n�tra dans la salle.
Vex�e de ne pas avoir �t� invit�e, elle maudit la princesse et la condamna � 
mourir le jour de ses 16 ans, piqu�e par un fuseau. La derni�re f�e qui s''�tait 
cach�e, n''avait pas encore fait son v�u et elle demanda que la princesse ne
meurt pas mais qu''elle soit plong�e dans un profond sommeil jusqu''au jour 
o� un prince lui d�posa un baiser. Le roi et la reine ont fait ce qu''il
pouvaient pour prot�ger la princesse de cette mal�diction mais un jour,
alors qu''ils �taient absents, la princesse visita le ch�teau et tomba sur
une salle avec une vieille femme en train de filer. La princesse se piqua
le doigt et tomba instantan�ment endormie. On installa la princesse sur un
lit. Au m�me moment, le ch�teau se recouvra de ronces et de pi�ges pour 
�viter que quiconque, et surtout pas un prince, puisse rejoindre la belle
endormie. C''est alors que les f�es endormirent tour � tour chaque personne
du ch�teau pour les plonger eux aussi dans un profond sommeil. Des centaines
de princes ont essay� de rejoindre le ch�teau sans succ�s. Au bout de 100 ans, 
le ch�teau et sa princesse endormie �taient devenus une l�gende. Seul un prince
curieux s''�tonna de voir les tours du ch�teau. On lui raconta la l�gende et
il d�cida d''aller voir par lui-m�me. Il trouva la princesse endormie et lui
d�posa un baiser. C''est ainsi qu''il l''a lib�r�e de son sommeil et que le reste
du ch�teau se r�veilla. Le prince demande au roi la main de sa fille et ils 
v�curent tous tr�s heureux.');



-- Ins�rer des donn�es dans la table produit
INSERT INTO produit (id_produit, nom_produit, prix, prix_apres_reduction, id_categorie)
VALUES (1, 'TALONS HAUTS', 110, 90, 2);
 
INSERT INTO produit (id_produit, nom_produit, prix, prix_apres_reduction, id_categorie)
VALUES (2, 'ROBE AURORA', 180, 150, 2);
 
INSERT INTO produit (id_produit, nom_produit, prix, prix_apres_reduction, id_categorie)
VALUES (3 , 'JOLIE COLLIER', 1010, 250, 1);
 
INSERT INTO produit (id_produit, nom_produit, prix, prix_apres_reduction, id_categorie)
VALUES (4 , 'BELLE CHAUSSURE CENDRILLON', 143, 42, 1);


-- Ins�rer des donn�es dans la table achat
INSERT INTO achat (id_achat, id_produit, id_client)
VALUES (1,1, 2);

 
