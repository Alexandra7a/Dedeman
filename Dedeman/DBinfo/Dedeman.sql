CREATE DATABASE Dedeman;
Use Dedeman;


CREATE TABLE Producatori
(
cod_p INT PRIMARY KEY IDENTITY,
nume NVARCHAR(50) NOT NULL,
locatie NVARCHAR(100)
);
CREATE TABLE Depozite
(
cod_d INT PRIMARY KEY IDENTITY,
locatie NVARCHAR(100),
oras NVARCHAR(100)
);

CREATE TABLE Marfa
(
cod_m INT PRIMARY KEY IDENTITY,
nume_marfa NVARCHAR(70) UNIQUE, --ca sa nu se repete marca ci doar se creste cantitatea
cantitate INT NOT NULL,
descriere NVARCHAR(250),
cod_producator INT FOREIGN KEY REFERENCES Producatori(cod_p) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE Distribuitori
(
cod_dis INT,--IDENTITY(1,1),
cod_marfa INT FOREIGN KEY REFERENCES Marfa(cod_m) ON UPDATE CASCADE ON DELETE CASCADE,
cod_depozit int FOREIGN KEY REFERENCES Depozite(cod_d) ON UPDATE CASCADE ON DELETE CASCADE,
cantitate INT NOT NULL,
data_ora_transport DATETIME
CONSTRAINT pk_dis PRIMARY KEY(cod_dis,cod_marfa)-- pentru a avea mai multe marfuri intr-un transport 
);
ALTER TABLE Distribuitori
ALTER COLUMN data_ora_transport DATE;
CREATE TABLE Magazine
(
cod_mag INT PRIMARY KEY IDENTITY,
adresa nvarchar(70),
oras NVARCHAR(20)
);
CREATE TABLE Livrari
(
cod_livrare INT,
cod_marfa INT FOREIGN KEY REFERENCES Marfa(cod_m) ON UPDATE CASCADE ON DELETE CASCADE,
cod_depozit INT FOREIGN KEY REFERENCES Depozite(cod_d) ON UPDATE CASCADE ON DELETE CASCADE,
cod_magazin INT FOREIGN KEY REFERENCES MAGAZINE(cod_mag) ON UPDATE CASCADE ON DELETE CASCADE,
cantitate INT NOT NULL,
data_ora_transport DATETIME
CONSTRAINT pk_livrari PRIMARY KEY (cod_livrare, cod_marfa)
);

CREATE TABLE FirmeCurierat
(
cod_firma INT PRIMARY KEY IDENTITY,
nume nvarchar(70),
locatie NVARCHAR(70)
);
CREATE TABLE Curieri
(cod_curier INT PRIMARY KEY IDENTITY,
cod_firma INT FOREIGN KEY REFERENCES FirmeCurierat(cod_firma) ON UPDATE CASCADE ON DELETE CASCADE,
nume NVARCHAR(50),
tel VARCHAR(15)
);

cREATE TABLE Categorii
( 
nume VARCHAR(200) PRIMARY KEY
);

CREATE TABLE Produse
(
cod_prod INT PRIMARY KEY IDENTITY,
nume NVARCHAR(250),
categorie  varchar(200) FOREIGN KEY REFERENCES Categorii(nume) ON UPDATE CASCADE ON DELETE CASCADE,
pret FLOAT(2),
cantitate INT NOT NULL,
descriere  VARCHAR(300),
cod_magazin INT FOREIGN KEY REFERENCES MAGAZINE(cod_mag) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Clienti
(
cod_c INT PRIMARY KEY IDENTITY,
nume NVARCHAR(50),
data_nasterii DATE,
email VARCHAR(60),
adresa NVARCHAR(70)
);
CREATE TABLE Comenzi
(
cod_comanda INT PRIMARY KEY IDENTITY,
data_plasare_comanda DATETIME,
cod_client INT FOREIGN KEY REFERENCES Clienti(cod_c) ON UPDATE CASCADE ON DELETE CASCADE,
cod_curier INT FOREIGN KEY REFERENCES Curieri(cod_curier) ON UPDATE CASCADE ON DELETE CASCADE,
detalii NVARCHAR(50),
status_comanda NVARCHAR(30)
);
CREATE TABLE ComenziProduse
(
cod_comanda INT FOREIGN KEY REFERENCES Comenzi(cod_comanda)ON UPDATE CASCADE ON DELETE CASCADE,
cod_produs INT FOREIGN KEY REFERENCES Produse(cod_prod)ON UPDATE CASCADE ON DELETE CASCADE,
cantitate INT NOT NULL,
pret FLOAT,
CONSTRAINT pk_com PRIMARY KEY(cod_comanda,cod_produs)
);
CREATE TABLE Returs
(
cod_retur INT PRIMARY KEY IDENTITY,
cod_comanda INT FOREIGN KEY REFERENCES Comenzi(cod_comanda)ON UPDATE CASCADE ON DELETE CASCADE,
cod_produs INT FOREIGN KEY REFERENCES Produse(cod_prod)ON UPDATE CASCADE ON DELETE CASCADE,
motiv NVARCHAR(100),
data_plasare_retur DATETIME,
status_retur NVARCHAR(30)
);