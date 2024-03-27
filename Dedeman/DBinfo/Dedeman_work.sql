USE Dedeman;


--DELETE FROM Magazine;

 INSERT INTO Producatori(nume,locatie)
 VALUES
 ('Action Place','Str. Gheorghe Şincai, nr. 4, Alba-Iulia, jud. Alba, România'),
 ('Agile Manufacturing','Str. Republicii, nr. 185, 600304, Bacău, jud. Bacău, România'),
 ('Central Construction','B-dul Ghencea, nr. 91C, Sector 6, Bucuresti'),
 ('Alliance Inc','Str. Sigmirului nr. 20, Bistrita, jud. Bistrita-Nasaud'),
 ('Engage Manufacturing','Str. Acţiunii, nr 2-4, Sector 4, Bucureşti, România');

 SELECT * 
 FROM Producatori;

 INSERT INTO Depozite(locatie,oras)
 VALUES
 (N'Str. Gheorghe Şincai, nr. 4, Alba-Iulia, jud. Alba, România',N'Alba Iulia'),
  (N'B-dul Nicolae Balcescu, Nr. 158, Pitesti, jud. Arges',N'Pitești'),
   (N'Calea Aurel Vlaicu, nr. 289C, Arad, România',N'Arad'),
   (N'Str. Republicii, nr. 185, 600304, Bacău, jud. Bacău, România',N'Bacău'),
   (N'Str. Abatorului, Nr. 7A, Bacau, jud. Bacau',N'Bacău'),
	  (N'Str. Acţiunii, nr 2-4, Sector 4, Bucureşti, România',N'București'),
	  (N'Valea Cascadelor, nr. 26, Sector 6, Bucureşti, România',N'București'),
	  (N'Şoseaua Colentina, nr.426, Sector 2, Bucureşti, România',N'București'),
	  (N'B-dul Theodor Pallady, Nr. 50, Sector 3, Bucuresti',N'București'),
	  (N'Calea Ion Zavoi, Nr. 2-4, Sector 1, Bucuresti',N'București'),
	  (N'Str. Gheorghe Şincai, nr. 4, Alba-Iulia, jud. Alba, România',N'Alba Iulia'),
  (N'B-dul Nicolae Balcescu, Nr. 158, Pitesti, jud. Arges',N'Pitești'),
   (N'Calea Aurel Vlaicu, nr. 289C, Arad, România',N'Arad'),
   (N'Str. Republicii, nr. 185, 600304, Bacău, jud. Bacău, România',N'Bacău');
-- Insert rows into table 'Customers'
INSERT INTO Magazine(adresa,oras)
 VALUES
  (N'Str. Gheorghe Şincai, nr. 4, Alba-Iulia, jud. Alba, România',N'Alba Iulia'),
  (N'B-dul Nicolae Balcescu, Nr. 158, Pitesti, jud. Arges',N'Pitești'),
   (N'Calea Aurel Vlaicu, nr. 289C, Arad, România',N'Arad'),
   (N'Str. Republicii, nr. 185, 600304, Bacău, jud. Bacău, România',N'Bacău'),
   (N'Str. Abatorului, Nr. 7A, Bacau, jud. Bacau',N'Bacău'),
	  (N'Str. Acţiunii, nr 2-4, Sector 4, Bucureşti, România',N'București'),
	  (N'Valea Cascadelor, nr. 26, Sector 6, Bucureşti, România',N'București'),
	  (N'Şoseaua Colentina, nr.426, Sector 2, Bucureşti, România',N'București'),
	  (N'B-dul Theodor Pallady, Nr. 50, Sector 3, Bucuresti',N'București'),
	  (N'Calea Ion Zavoi, Nr. 2-4, Sector 1, Bucuresti',N'București'),
	  (N'Soseaua Dudesti-Pantelimon , nr. 2-40, Sector 3, Bucuresti',N'București'),
	  (N'B-dul Ghencea, nr. 91C, Sector 6, Bucuresti',N'București'),
	  (N'Calea Aradului, nr. 87A, 410224, Oradea, jud. Bihor, România',N'Oradea'),
	  (N'Str. Sigmirului nr. 20, Bistrita, jud. Bistrita-Nasaud',N'Bistrița');


 SELECT *
 FROM Depozite;
  SELECT *
 FROM Producatori;
 SELECT * 
FROM Magazine

 INSERT INTO Marfa(cod_producator,nume_marfa,cantitate,descriere)
 VALUES
 (1,N'Birou cu dulap Rey',100,N'Biroul Rey este realizat intr-un stil modern, fiind caracterizat de un design simplu si elegant'),
 (1,N'Scaun birou ergonomic OFF 907',52,N'Scaunul de birou ergonomic OFF 907 este realizat cu o structura din metal cromat, sezut cu burete, tapitat cu mesh alb care asigura o buna circulatie a aerului'),
 (2,N'Canapea extensibila 2 locuri Mickey',50,N'Canapeaua Mickey imbina intr-un mod armonios latura estetica si cea practica, fiind realizata intr-un design modern'),
 (3,N'Saltea pat Adormo Essential',250,N'Salteaua Adormo Essential este recomandata tuturor celor care isi doresc o saltea ortopedica, ferma si foarte confortabila, avand o inaltime de 13.5 cm si dimensiunile 90x200 cm.'),
 (5,N'Oglinda decorativa Malkia Typ 3',25,N'Oglinda Malkia Typ 3 are un design modern datorita constructiei cu rama argintie. Forma este dreptunghiulara, fiind usor de integrat in ambient.');
 
 
 select * from marfa;
 INSERT INTO Distribuitori(cod_dis,cod_marfa,cod_depozit,cantitate, data_ora_transport)
 VALUES
 (1,1,7,300,'2023-09-14'),
 (1,2,7,500,'2023-09-14'),
 (1,3,7,200,'2023-09-14'),
 (1,4,7,100,'2023-09-14'),
 (1,5,7,500,'2023-09-14'),

 (2,1,14,1000,'2023-09-14'),
 (2,2,14,500,'2023-09-23'),
 (2,3,14,1000,'2023-09-15'),
 (2,4,14,1000,'2023-09-16'),
 (2,5,14,1000,'2023-09-16'),

 (3,1,9,200,'2023-08-14'),
 (3,2,9,50,'2023-09-01'),
 (3,3,9,200,'2023-09-02'),
 (3,4,9,100,'2023-09-12'),
 (3,5,9,100,'2023-09-12'),

 (4,1,11,500,'2023-09-10'),
 (4,2,11,200,'2023-09-11'),
 (4,3,11,200,'2023-09-11'),
 (4,4,11,100,'2023-09-06'),
 (4,5,11,50,'2023-09-25'),

 (5,1,3,50,'2023-09-25'),
 (5,2,3,50,'2023-09-16'),
 (5,3,3,50,'2023-09-15'),
 (5,4,3,50,'2023-09-28'),
 (5,5,3,50,'2023-09-28');

 
 
 Select * from Distribuitori;
SELECT * FROM Marfa M
select * from Depozite
 INSERT INTO Livrari(cod_livrare,cod_marfa,cod_depozit,cod_magazin,cantitate,data_ora_transport)
 VALUES
 (1,1,7,1,4,'2023-10-10'),
 (3,2,7,1,10,'2023-10-10'),
 (1,3,14,1,5,'2023-10-10'),
 (2,4,9,5,45,'2023-10-10'),
 (1,4,11,1,20,'2023-10-10'),
 (3,1,11,4,5,'2023-10-10');

 SELECT *
 FROM Magazine;

 INSERT INTO CATEGORII(NUME)
VALUES
('Electronice'),
('Toamna'),
('Mobila'),
('Grdina'),
('Acoperis');

 INSERT INTO Produse(nume, categorie,pret, cantitate,cod_magazin,descriere)
 VALUES 
 ('Lampa GBA','Electronice',57.99,  15, 5, 'Luminoasa'),
 ('Birou cu dulap Rey, pentru calculator, alb mat, 100 x 74.5 x 50 cm, 1C','Mobila',600.00,15,5,'Biroul Rey este realizat intr-un stil modern, fiind caracterizat de un design simplu si elegant.'),
 ('Comoda dormitor Etna 4F, cu 4 sertare, stejar gri + folie lucioasa alba, 93 x 90.5 x 35 cm, 2C','Mobila',532.99,15,5,'Comoda Etna 4F este construita cu un design unic si atractiv, asigurand functionalitate prin cele 4 sertare extrem de practice.'),
 ('Dulap metalic Eco I A177, metal, gri deschis, 2 usi, 90 x 40 x 180 cm','Mobila',1100.99,15,5,'Fisetul Eco I A177 are dimensiunile 900x400x1800 mm, prezinta 2 usi cu deschidere la 90 de grade, iar cele 4 polite din componenta sunt reglabile pe inaltime pentru depozitarea de obiecte de diferite marimi. '),
('Lopata pentru zapada, metal, cu coada lemn, 147 cm','Toamna',54.00,100,1, 'Lopata pentru zapada ofera performanta sporita,la nevoie,iar in restul timpului poate fi depozitata usor in cele mai restranse spatii.Este realizata din metal rezistent, cu durabilitatea in timp si este prevazuta cu coada confectionata din lemn.'
),
('Topor Grunman, lama otel + coada fibra, 800 g','Toamna',54.89,210,1,'Toporul Grunman este confectionat din otel forjat, cu greutate redusa de doar 800 gr, este destinat taierii si cioplirii lemnului.Toporul este prevazut cu coada confectionata din fibra de sticla.'
),
('Foarfeca de gradina, pentru taiat crengi pomi, Gardena Comfort 08906-20','Toamna',156.00,57,2,'Foarfeca gradina Gardena Comfort 08906-20 este o foarfeca exceptional de comoda si ergonomica cu un cap de taiere extra-ingust pentru a taia precis si curat vita de vie, flori, mladite tinere si lemn verde.'
),
('Pelerina ploaie Universal, PVC, rosu, marimea XL','Toamna',23.09,500,2,''),
('Borcan cu capac ermetic, Fido, sticla transparenta, 1 litru','Toamna',19.85,400,9,'Borcanul ermetic Fido este recomandat pentru depozitarea diverselor alimente de mici dimensiuni sau condimente.'
),
('Tigla metalica Bilman, maro lucios (RAL 8017), 2220 x 1200 x 0.4 mm','Acoperis',30.89,100,10,'Modelul de tigla metalica Bilman maro lucios (RAL 8017) poate fi alegerea ideala in cazul in care doriti sa va modificati acoperisul si sa evidentiati frumusetea unei cladiri.'
),
('Tigla metalica Bilman, rosie lucios (RAL 8017), 2220 x 1200 x 0.4 mm','Acoperis',30.89,100,10,'Modelul de tigla metalica Bilman rosu lucios (RAL 8017) poate fi alegerea ideala in cazul in care doriti sa va modificati acoperisul si sa evidentiati frumusetea unei cladiri.'
),
('Tigla zig-zag','Acoperis',30.89,100,10,'derapare usoara'
),
('Masa sufragerie','Mobila',30.89,100,10,'Model geometric'),
('Dulap stil biblioteca','Mobila',30.89,100,10,'Rearanjabil facut la comanda'),
('Masa sufragerie 1.0','Mobila',30.89,100,10,'Model geometric colorat');


 SELECT *
 FROM Produse;

 INSERT INTO Clienti(nume,data_nasterii,email,adresa)
 VALUES 
 (N'Pop Gigi','2002-10-03','gigi123@gmail.com','adresa1'),
 (N'Tămaș Denisa Maria','1998-10-25','deni.t23@gmail.com','adresa2'),
 (N'Pop Sonia Samanta','2002-10-03','sonipop1234@gmail.com','adresa3'),
 (N'Andrei Ghita Costel','2002-05-03','costel.andrei2002@yahoo.com','adresa4'),
 (N'Ștefănescu Daniel Alin','1979-12-03','bomba_day03@gmail.com','adresa5');

 INSERT INTO FirmeCurierat(nume,locatie)
 VALUES
 (N'Fan Courier',N'Str. Gheorghe Şincai, nr. 4, Alba-Iulia, jud. Alba, România'),
  (N'Same Day',N'B-dul Ghencea, nr. 91C, Sector 6, Bucuresti');

  INSERT INTO Curieri(cod_firma, nume,tel)
  values
  (1,N'Pop Dorian','0720994034'),
  (1,N'Filip Cristian','0723333303'),
  (1,N'Sima Dorel','0720997676'),
  (2,N'Stan Iosif','0745555480'),
  (2,N'Stol Kevin','0720994904'),
  (2,N'Suba Alin Sebastian','0720888034');

  select * from 
  curieri
  select * from 
  clienti;
  select * from curieri
  INSERT INTO Comenzi(data_plasare_comanda,cod_client,cod_curier,detalii,status_comanda)
  VALUES
  ('2023-11-05',1,1,'','plasat'),-- Gigi da comanda
  ('2023-11-01',2,1,'','preluat'),
  ('2023-11-05',2,2,'','plasat'),
  ('2023-11-05',1,4,'','plasat'),
  ('2023-11-05',4,4,'','plasat'),
  ('2023-11-01',2,1,'','preluat'),
  ('2023-11-05',2,2,'','plasat'),
  ('2023-11-05',1,4,'','plasat'),
  ('2023-11-05',4,4,'','plasat');
  select * from produse
  INSERT INTO ComenziProduse(cod_comanda,cod_produs,cantitate,pret)
  Values
  (1,4,2,57.99),
  (1,5,1,600.00),
  (2,6,1,532.99),
  (3,4,2,57.99),
  (4,7,1,1100.99),
  (5,6,1,532.99);

  INSERT INTO ComenziProduse(cod_comanda,cod_produs,cantitate,pret)
  Values
   (5,8,1,54),
   (5,9,1,54.89);


   select * from comenzi
   select * from produse
   select * from comenziproduse
   delete  from comenziproduse
INSERT INTO ComenziProduse(cod_comanda,cod_produs,cantitate,pret)
  Values
   (1,5,1,54),
   (1,7,1,156),
   (3,9,1,19.85),
   (3,6,1,54.89);


 INSERT INTO Returs(cod_comanda,cod_produs,motiv,data_plasare_retur,status_retur)
 VALUES 
 (4,4,'defect','2023-11-08','returnat'),
 (5,5,'defect','2023-11-08','returnat'),
 (5,7,'gresit','2023-11-08','returnat');-- produs gresit

 select * from Produse 
 update produse set pret=25 where cod_prod=28;