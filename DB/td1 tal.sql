-- 1
CREATE TYPE TClient AS OBJECT(
    NC NUMBER,
    nom VARCHAR(25),
    prenom VARCHAR(25),
    Tel VARCHAR(10)
);

-- 2
ALTER TYPE TClient ADD MEMBER PROCEDURE Afficher CASCADE;

CREATE OR REPLACE TYPE BODY TClient AS
    MEMBER PROCEDURE Afficher IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('NC:' || self.NC);
        DBMS_OUTPUT.PUT_LINE('nom:' || self.nom);
        DBMS_OUTPUT.PUT_LINE('prenom:' || self.prenom);
        DBMS_OUTPUT.PUT_LINE('Tel:' || self.Tel);
    END;
END;

-- 3
CREATE TABLE Client OF TClient;

INSERT INTO Client (NC, nom, prenom, Tel) VALUES (123, 'Merabti', 'Adem', '0799345676');
INSERT INTO Client (NC, nom, prenom, Tel) VALUES (124, 'BOUNEDJAR', 'Faical', '0759345676');

-- 4
CREATE TYPE TCompte AS OBJECT (
    code NUMBER,
    solde FLOAT,
    client REF TClient
) NOT FINAL;

-- 5
ALTER TYPE TCompte ADD MEMBER PROCEDURE Crediter(somme IN FLOAT) CASCADE;

ALTER TYPE TCompte ADD MEMBER PROCEDURE Crediter(somme IN FLOAT, client IN OUT TCompte) CASCADE;

ALTER TYPE TCompte ADD MEMBER PROCEDURE Debiter(somme IN FLOAT) CASCADE;

ALTER TYPE TCompte ADD MEMBER PROCEDURE Debiter(somme IN FLOAT, client IN OUT TCompte) CASCADE;

ALTER TYPE TCompte ADD MEMBER PROCEDURE Afficher CASCADE;

CREATE OR REPLACE TYPE BODY TCompte AS
    MEMBER PROCEDURE Crediter(somme IN FLOAT) IS
    BEGIN
        self.solde := self.solde + somme;
    END;

    MEMBER PROCEDURE Crediter(somme IN FLOAT, Compte IN OUT TCompte) IS
    BEGIN
        IF Compte.solde >= somme THEN
            Compte.Debiter(somme);
            self.solde := self.solde + somme;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Error : Solde < Somme');
        END IF;
    END;

    MEMBER PROCEDURE Debiter(somme IN FLOAT) IS
    BEGIN
        IF self.solde >= somme THEN
            self.solde := self.solde - somme;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Error : Solde < Somme');
        END IF;
    END;

    MEMBER PROCEDURE Debiter(somme IN FLOAT, Compte IN OUT TCompte) IS
    BEGIN
        IF self.solde >= somme THEN
            self.solde := self.solde - somme;
            Compte.Crediter(somme);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Error : Solde < Somme');
        END IF;
    END;

    MEMBER PROCEDURE Afficher IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Code:' || self.code);
        DBMS_OUTPUT.PUT_LINE('solde:' || self.solde);
        DBMS_OUTPUT.PUT_LINE('Client:');
        self.client.Afficher();
    END;
END;
