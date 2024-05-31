
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

ALTER TABLE achat_fk_client ADD CONSTRAINT achat_fk_client_pk PRIMARY KEY ( achat_id_achat,
                                                                            client_id_client );

CREATE TABLE achat_produit (
    achat_id_achat     NUMBER NOT NULL,
    produit_id_produit NUMBER NOT NULL
);

ALTER TABLE achat_produit ADD CONSTRAINT achat_produit_pk PRIMARY KEY ( achat_id_achat,
                                                                        produit_id_produit );

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

ALTER TABLE produit_fk_categorie ADD CONSTRAINT produit_fk_categorie_pk PRIMARY KEY ( produit_id_produit,
                                                                                      categorie_id_categorie );

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



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
