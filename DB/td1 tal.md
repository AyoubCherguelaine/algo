# 1

create type TClient as object(
    NC number,
    nom varchar(25),
    prenom varchar(25),
    Tel varchar(10)
)

# 2

Alter type TClient add member PROCEDURE Afficher Cascade;

CREATE or replace TYPE BODY TClient AS
member PROCEDURE Afficher is

    BEGIN
        DBMS_OUTPUT.PUT_LINE('NC:'||self.NC);
        DBMS_OUTPUT.PUT_LINE('nom:'||self.nom);
        DBMS_OUTPUT.PUT_LINE('prenom:'||self.prenom);
        DBMS_OUTPUT.PUT_LINE('Tel:'||self.Tel);
    END;
END;

# 3

CREATE table Client of TClient;


insert into Client (NC,nom,prenom,Tel) value (123,'Merabti','Adem',0799345676)
insert into Client (NC,nom,prenom,Tel) value (124,'BOUNEDJAR','Faical',0759345676)

# 4

create type TCompte as object (
    code number,
    solde float,
    client ref TClient
)not final;

# 5 

Alter type TCompte add member PROCEDURE Crediter(somme in float) Cascade;

Alter type TCompte add member PROCEDURE Crediter(somme in float, client in out TCompte) Cascade;

Alter type TCompte add member PROCEDURE Debiter(somme in float) Cascade;

Alter type TCompte add member PROCEDURE Debiter(somme in float, client in out TCompte) Cascade;

Alter type TCompte add member PROCEDURE Afficher Cascade;


CREATE or replace TYPE BODY TCompte AS
    member PROCEDURE Crediter(somme in float) is
    lsolde float;
        BEGIN
            lsolde =self.solde
            self.solde = lsolde + somme
        END;

    member PROCEDURE Crediter(somme in float, Compte in out TCompte) is
    lsolde float;
        BEGIN
            lsolde =self.solde
            if Compte.sold>= somme THEN
                Compte.Debiter(somme)
                self.solde = lsolde + somme
            ELSE 
                DBMS_OUTPUT.PUT_LINE('Error : Solde < Somme');
            END IF;
        END;

    member PROCEDURE Debiter(somme in float) is
    lsolde float;
        BEGIN
            lsolde =self.solde
            if self.solde >= somme THEN
                self.solde = lsolde - somme
            ELSE
                 DBMS_OUTPUT.PUT_LINE('Error : Solde < Somme');
            END IF;
        END;
    
    member PROCEDURE Debiter(somme in float,  Compte in out TCompte) is
    lsolde float;
        BEGIN
            lsolde =self.solde
            if self.solde >= somme THEN
                self.solde = lsolde - somme
                Compte.Crediter(somme)
            ELSE
                 DBMS_OUTPUT.PUT_LINE('Error : Solde < Somme');
            END IF;
        END;

    member PROCEDURE Afficher is

    BEGIN
        DBMS_OUTPUT.PUT_LINE('Code:'||self.code);
        DBMS_OUTPUT.PUT_LINE('solde:'||self.solde);
        DBMS_OUTPUT.PUT_LINE('Client:');
        select DEREF(self.client) into c from dual;
        c.Afficher() ;
    END;
    
END;


