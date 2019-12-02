create table Firma
(
	FirmaID int,
	FirmaAd varchar(55),
	WebSite varchar(255),
	TelNo varchar(11),
	primary key(FirmaID)
);

create table AracTürü
(
	Açýklama varchar(90),
	TurID int ,
	primary key (TurID)
);
create table Görev
(
    GörevID int,
	Açýklama varchar(255),
	PRIMARY KEY (GörevID)
);

CREATE TABLE Il(
ilID int NOT NULL,
isim VARCHAR(50),
PRIMARY KEY (ilID),

);

CREATE TABLE Ilce(
ilceID int NOT NULL,
isim VARCHAR(50),
PRIMARY KEY (ilceID),
il_ID int FOREIGN KEY  REFERENCES Il(ilID) NOT NULL
);



CREATE TABLE Marka(
MarkaID int,
MarkaAdý varchar(20),
PRIMARY KEY (MarkaID)
);

CREATE TABLE Arac(
aracID int ,
yolcu_kapasitesi int ,
aracno int ,
PRIMARY KEY (aracID),
aracturID int FOREIGN KEY  REFERENCES AracTürü(TurID) NOT NULL , --turID ,Araç tablosunun foreign key'i.
marka_ID int FOREIGN KEY  REFERENCES Marka(MarkaID) NOT NULL,--markaID,Araç tablosunun foreign key.
firma_ID int FOREIGN KEY  REFERENCES Firma(FirmaID) NOT NULL,--FirmaID ,Araç tablosunun foreign key.

);



create table Model
(
 ModelID int ,
 ModelAdý varchar(255),
 PRIMARY KEY (ModelID),
 arac_ID int FOREIGN KEY REFERENCES Arac(aracID) NOT NULL --aracID , Modeli Foreign Key 
);

CREATE TABLE Terminal(
terminalID int NOT NULL,
primary key (terminalID),
ilce_ID int FOREIGN KEY  REFERENCES Ilce(ilceID) NOT NULL,
il_ID int FOREIGN KEY  REFERENCES Il(ilID) NOT NULL
);

CREATE TABLE Koltuk(
KoltukID int,
KoltukNo varchar(20),
PRIMARY KEY(KoltukID),
arac_ID int FOREIGN KEY REFERENCES Arac(aracID) NOT NULL--aracID , Koltuðun Foreign Key'i
 
);
CREATE TABLE Odeme(
OdemeID int,
OdemeTýpý varchar(10),
primary key (OdemeID) 
);

CREATE TABLE Yolcu(
Ad varchar(15),
Soyad varchar(15),
Tel varchar(15),
Tc varchar(15),
D_Tarihi Date,
yolcuID int,
Mail varchar(25),
Cinsiyet varchar (5),
primary key (yolcuID)
);

CREATE TABLE Sefer(
seferID int,
kalkisterminalID int,
varisterminalID int ,
peron_no int ,
kalkis_tarihi DATE  ,
kalkis_saati TIME ,
varis_tarihi DATE ,
varis_saati TIME ,
sefer_suresi int ,
enlem  varchar(50) ,
boylam varchar(50) ,
PRIMARY KEY(seferID),
arac_ID int FOREIGN KEY  REFERENCES Arac(aracID) NOT NULL ,
terminal_ID int FOREIGN KEY   REFERENCES Terminal(terminalID) NOT NULL
);

CREATE TABLE Guzergah(
GuzergahID int,
GirisTarih DATE  NOT NULL,
CikisTarih DATE NOT NULL,
PRIMARY KEY (GuzergahID),
sefer_ID int FOREIGN KEY  REFERENCES Sefer(seferID) NOT NULL,
terminal_ID int FOREIGN KEY  REFERENCES Terminal(terminalID) NOT NULL
);

create table Personel
(
	PerTc varchar(11),
	Adý varchar(15),
	Soyadý varchar (50),
	Mail varchar(50),
	Telno varchar(11),
	Adres varchar(250),
	personelID int,
	
	 PRIMARY KEY(personelID),
 firma_ID int FOREIGN KEY REFERENCES Firma(FirmaID) NOT NULL,
 gorev_ID int FOREIGN KEY REFERENCES Görev(GörevID) NOT NULL,
 sefer_ID int  FOREIGN KEY REFERENCES Sefer(seferID) NOT NULL
);

CREATE TABLE Bulunur(

bulID int,
PRIMARY KEY (bulID),
per_ID int FOREIGN KEY  REFERENCES Personel(personelID) NOT NULL,
sefer_ID int FOREIGN KEY   REFERENCES Sefer(seferID) NOT NULL
);


CREATE TABLE Bilet(
BiletID int,
BagajKG char(3),
Durum varchar(1),
Tarih Date,
Fiyat Varchar(500),
primary key (BiletID),
sefer_ID int FOREIGN KEY  REFERENCES Sefer(seferID) NOT NULL,
koltuk_ID int FOREIGN KEY  REFERENCES Koltuk(koltukID) NOT NULL,
odeme_ID int FOREIGN KEY  REFERENCES Odeme(OdemeID) NOT NULL,
yolcu_ID int FOREIGN KEY  REFERENCES Yolcu(yolcuID) NOT NULL
);


INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 20,'PAMUKKALE TURÝZM','05352237675','WWW.PAMUKKALETURÝZM.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 22,'METRO TURÝZM','05352237676','WWW.METROTURÝZM.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 24,'KAMÝLKOÇ TURÝZM','05352237677','WWW.KAMÝLKOC.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 26,'ÝSTANBUL SEYEHAT','05352237678','WWW.ÝSTANBULSEYEHAT.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 28,'BURSA SEYEHAT','05352237679','WWW.BURSASEYEHAT.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 30,'YALOVA SEYEHAT','05352237680','WWW.YALOVASEYEHAT.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 32,'TÜRK HAVA YOLLARI','05352237681','WWW.THYY.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 34,'PEGASUS ','05352237682','WWW.PEGASUS.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 36,'ATLAS JET','05352237684','WWW.ATLASJET.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 38,'ONUR AÝR','05352237685','WWW.ONURAÝR.COM';
INSERT INTO dbo.Firma(FirmaID, FirmaAd, TelNo, WebSite)
SELECT 40,'ÝZMÝR TURÝZM','05352237686','WWW.ÝZMÝRTURÝZM.COM';

INSERT INTO dbo.AracTürü(Açýklama,TurID)
SELECT 'OTOBÜS',1;
INSERT INTO dbo.AracTürü(Açýklama,TurID)
SELECT 'UÇAK',2;

INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 1,'Satýþ Danýþmaný';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 2,'Temizlik Görevlisi';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 3,'Muavin';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 4,'ÞOFÖR';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 5,'Güvenlik Görevlisi';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 6,' Patron';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 7,' Genel Müdür';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 8,'Ceo';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 9,'Danýþma';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 10,'Hostes';
INSERT INTO dbo.Görev(GörevID,Açýklama)
Select 11,'Pilot';



INSERT INTO Il(ilID,isim) VALUES
(01, 'Adana'),
(02, 'Adýyaman'),
(03, 'Afyonkarahisar'),
(04, 'Aðrý'),
(05, 'Amasya'),
(06, 'Ankara'),
(07, 'Antalya'),
(08, 'Artvin'),
(09, 'Aydýn'),
(10, 'Balýkesir'),
(11, 'Bilecik'),
(12, 'Bingöl'),
(13, 'Bitlis'),
(14, 'Bolu'),
(15, 'Burdur'),
(16, 'Bursa'),
(17, 'Çanakkale'),
(18, 'Çankýrý'),
(19, 'Çorum'),
(20, 'Denizli'),
(21, 'Diyarbakýr'),
(22, 'Edirne'),
(23, 'Elâzýð'),
(24, 'Erzincan'),
(25, 'Erzurum'),
(26, 'Eskiþehir'),
(27, 'Gaziantep'),
(28, 'Giresun'),
(29, 'Gümüþhane'),
(30, 'Hakkâri'),
(31, 'Hatay'),
(32, 'Isparta'),
(33, 'Mersin'),
(34, 'Ýstanbul'),
(35, 'Ýzmir');



INSERT INTO Ilce(ilceID,isim,il_ID) VALUES
(1,'Ceyhan',01),
(2,'Çukurova',01),
(3,'Kozan',01),
(4,'Aladað',01),
(5,'Besni',02),
(6,'Gölbaþý',02),
(7,'Kahta',02),
(8,'Samsat',02),
(9,'Çay',03),
(10,'Emirdað',03),
(11,'Baþmakçý',03),
(12,'Dinar',03),
(13,'Doðubayazýt',04),
(14,'Patnos',04),
(15,'Tutak',04),
(16,'Göynücek',05),
(17,'Merzifon',05),
(18,'Keçiören',06),
(19,'Sincan',06),
(20,'Aksu',07),
(21,'Finike',07),
(22,'Alanya',07),
(23,'Arhavi',08),
(24,'Hopa',08),
(25,'Karacasu',09),
(26,'Ayvalýk',10),
(27,'Bigadiç',10),
(28,'Bozüyük',11),
(29,'Genç',12),
(30,'Yayladere',12),
(31,'Ahlat',13),
(32,'Göynük',14),
(33,'Gerede',14),
(34,'Yeþilova',15),
(35,'Kemer',15),
(36,'Orhangazi',16),
(37,'Mudanya',16),
(38,'Mustafakemalpaþa',16),
(39,'Eceabat',17),
(40,'Lapseki',17),
(41,'Eldivan',18),
(42,'Osmancýk',19),
(43,'Mecitözü',19),
(44,'SarayKöy',20),
(45,'Çameli',20),
(46,'Þilvan',21),
(47,'Lice',21),
(48,'Enez',22),
(49,'Keþan',22),
(50,'Keban',23),
(51,'Merkez',23),
(52,'Kemah',24),
(53,'Yakutiye',25),
(54,'Otlu',25),
(55,'Hýnýs',25),
(56,'Mahmudiye',26),
(57,'Sivrihisar',26),
(58,'Ýnönü',26),
(59,'Nizip',27),
(60,'Nurdaðý',27),
(61,'Þebinkarahisar',28),
(62,'Piraziz',28),
(63,'Kelkit',29),
(64,'Merkez',29),
(65,'Çukurova',30),
(66,'Reyhanlý',31),
(67,'Keçiborlu',32),
(68,'Gönen',32),
(69,'Aydýncýk',33),
(70,'Mezitli',33),
(71,'Esenyurt',34),
(72,'Baþakþehir',34),
(73,'Ataþehir',34),
(74,'Tuzla',34),
(75,'Beykoz',34),
(76,'Dikili',35),
(77,'Foça',35),
(78,'Aliaða',35);


INSERT INTO Marka(MarkaID,MarkaAdý) VALUES
(1,'Autosan'),
(2,'BCI'),
(3,'Blue Bird'),
(4,'Dennis'),
(5,'Fiat'),
(6,'Airbus A340'),
(7,'Airbus A330'),
(8,'Boeing 737-800'),
(9,'Heuliez'),
(10,'BMW'),
(11,'Mercedes Benz'),
(12,'Boeing'),
(13,'Boeing 737-900 ER'),
(14,'King Long'),
(15,'Boeing 737-300 ER'),
(16,'Nissan'),
(17,'Boeing XX'),
(18,'Boeing XY '),
(19,'Otokar'),
(20,'Hyundai'),
(21,'Airbus 2632 ER'),
(22,'Jelcz'),
(23,'Airbus A330 ER'),
(24,'Alfa Romeo');


INSERT INTO Arac (aracID,aracno,yolcu_kapasitesi,aracturID,marka_ID,firma_ID)VALUES
(1,1,35,2,1,32),
(2,2,35,1,2,22),
(3,3,35,1,3,24),
(4,4,35,1,4,26),
(5,5,40,1,5,28),
(6,6,40,1,6,30),
(7,7,40,1,7,32),
(8,8,40,1,8,34),
(9,9,40,1,9,36),
(10,10,40,1,10,38),
(11,11,45,1,11,40),
(12,12,45,2,12,32),
(13,13,45,1,13,20),
(14,14,45,1,14,32),
(15,15,45,1,15,32),
(16,16,270,2,16,32),
(17,17,270,2,17,32),
(18,18,280,2,18,36),
(19,19,280,2,19,38),
(20,20,290,2,20,36),
(21,21,290,2,21,38),
(22,22,290,2,22,36),
(23,23,300,2,23,32),
(24,24,310,2,24,34),
(25,25,315,2,24,34),
(26,26,320,2,24,34),
(27,27,320,2,24,34),
(28,28,330,2,24,20),
(29,29,340,2,24,20),
(30,30,350,2,24,20);

INSERT INTO dbo.Model(ModelAdý,ModelID,arac_ID) VALUES 
('Tourismo 15 RHD',1,1),
('Tourismo 17 RHD',2,2),
('Tourismo 16 RHD',3,3),
('O403',4,4),
('Travego 15 SHD',5,5),
('Travego 17 SHD',6,6),
('Tourismo 19 RHD',7,7),
('S 417 HDH',8,8),
('S 415 HDH',9,9),
('S 431 DT',10,10),
('S 416 GT',11,11),
('S 516 HD',12,12),
('Tourliner L',13,13),
('Neoplan Starliner II',14,14),
('Neoplan',15,15),
('Airbus A330',16,16),
('Airbus A340',17,17),
('Boeing',18,18),
('Boeing 737-80',19,19),
('Boeing 737-700',20,20),
('Boeing 737-300 ER',21,21),
('Boeing 737-900 ER',22,22),
(' Lockheed L-1011 TriStar',23,23),
('McDonell Douglas MD-11',24,24),
('Iljuschin II-96M',25,25),
('Airbus A380',26,26),
('Boeing 747',27,27),
('Boeing 787 Dreamliner',28,28),
('Airbus A350',29,29),
('Boeing 737-800',30,30);

INSERT INTO Terminal (terminalID,ilce_ID,il_ID) VALUES 
(1,1,01),
(2,2,01),
(3,3,01),
(4,4,01),
(5,5,02),
(6,6,02),
(7,7,02),
(8,8,02),
(9,9,03),
(10,10,03),
(11,11,03),
(12,12,03),
(13,13,04),
(14,14,04),
(15,15,04),
(16,16,05),
(17,17,05),
(18,18,06),
(19,19,06),
(20,20,07),
(21,21,07),
(22,22,07),
(23,23,08),
(24,24,08),
(25,25,09),
(26,26,10),
(27,27,10),
(28,28,11),
(29,29,12),
(30,30,12),
(31,31,13),
(32,32,14),
(33,33,14),
(34,34,15),
(35,35,15),
(36,36,16),
(37,37,16),
(38,38,16),
(39,39,17),
(40,40,17),
(41,41,18),
(42,42,19),
(43,43,19),
(44,44,20),
(45,45,20),
(46,46,21),
(47,47,21),
(48,48,22),
(49,49,22),
(50,50,23),
(51,51,23),
(52,52,24),
(53,53,25),
(54,54,25),
(55,55,25),
(56,56,26),
(57,57,26),
(58,58,26),
(59,59,27),
(60,60,27),
(61,61,28),
(62,62,28),
(63,63,29),
(64,64,29),
(65,65,30),
(66,66,31),
(67,67,32),
(68,68,32),
(69,69,33),
(70,70,33),
(71,71,34),
(72,72,34),
(73,73,34),
(74,74,34),
(75,75,34),
(76,76,35),
(77,77,35),
(78,78,35);

INSERT INTO Koltuk(KoltukID,KoltukNo,arac_ID) VALUES
(1,'01',1),
(2,'02',2),
(3,'03',3),
(4,'04',4),
(5,'05',5),
(6,'06',6),
(7,'07',7),
(8,'08',8),
(9,'09',9),
(10,'10',10),
(11,'11',11),
(12,'12',12),
(13,'13',13),
(14,'14',14),
(15,'15',15),
(16,'C12 Y138',16),
(17,'C12CY138',17),
(18,'Y159',18),
(19,'Y159',19),
(20,'C12 Y128 ',20),
(21,'Y159',21),
(22,' C20 Y135 ',22),
(23,' C1 ',23),
(24,' C12 ',24),
(25,' C16 Y141 ',25),
(26,'C12 Y144 ',26),
(27,'  C16 Y153 ',27),
(28,' C12 ',28),
(29,'C1',29),
(30,'Y159',30);


INSERT INTO Odeme(OdemeID,OdemeTýpý) VALUES
(1,'Kredi'),
(2,'Kredi'),
(3,'Banka'),
(4,'Banka'),
(5,'Kredi'),
(6,'Kredi'),
(7,'Banka'),
(8,'Kredi'),
(9,'Banka'),
(10,'Kredi'),
(11,'Banka'),
(12,'Kredi');

INSERT INTO Yolcu (yolcuID,Ad,Soyad,Tel,Tc,D_Tarihi,Mail,Cinsiyet) VALUES
(1,'Özgür','Kaçak','05326989565','70351087165','1990-05-14','kacakozgur@gmail.com','ERKEK'),
(2,'Mehtap','Þimþek','02265489656','12454578965','1997-06-13','simsekmehtap@hotmail.com','KADIN'),
(3,'Selim','Aydýn','05369865698','23256987845','1975-12-12','aydinaydin@gmailcom','ERKEK'),
(4,'Hakan','Ak','02124589796','40639623232','1995-03-04','hakanak@gmail.com','ERKEK'),
(5,'Deniz','Göçek','05321457848','33623239878','1990-06-14','gokcekedniz@gmail.com','KADIN'),
(6,'Mustafa','Durmaz','05314587488','40352633696','1960-11-04','durmazmustafa@hotmail.com','ERKEK'),
(7,'Leyla','Þen','05562315487','70354897562','1992-01-01','senleyla@gmail.com','KADIN'),
(8,'Semra','Yýlmaz','02124715899','84796632301','1950-09-26','yilmazsemra@hotmail.com','KADIN'),
(9,'Semra','Elek','02167458995','40215547896','1963-12-27','eleksemra@gmail.com','KADIN'),
(10,'Ece','Þahbaz','05326512337','40739621547','1991-10-11','sahbazece@hotmail.com','KADIN'),
(11,'Özgür','Göçek','05321457848','33624157878','1975-06-21','gokcekozgur@gmail.com','ERKEK'),
(12,'Hüseyin','Bayan','05314587488','41230633696','1963-04-26','huseyinbayan@hotmail.com','ERKEK'),
(13,'Yakup','Çýnar','05321455487','40123266336','1997-05-12','cinarhuseyin@hotmail.com','ERKEK'),
(14,'Mýsra','Þen','05487887847','23124156232','1992-01-23','sen_misra@gmail.com','KADIN'),
(15,'Mustafa','Ak','02122125480','15456627432','1963-12-27','akmustafa@gmail.com','ERKEK'),
(16,'Selim','Durmaz','','12487459900','1999-02-23','','ERKEK'),
(17,'Reyhan','Karadeniz','05557855500','02264122158','1980-02-15','karadeniz@gmail.com','KADIN'),
(18,'Emre','Yýlmaz','05321457833','40352658796','2012-08-19','yilmazemre@hotmail.com','ERKEK'),
(19,'Yasemin','Yýlmaz','02123020030','12548879660','1985-03-25','','KADIN'),
(20,'Zeynep','Gonçe','02123020097','1247500001','2005-04-26','goncezeynep@gmail.com','KADIN'),
(21,'Tutku','Kaçak','','11236970012','2000-05-24','','KADIN'),
(22,'Leyla','Elek','','23123269789','1965-12-12','','KADIN'),
(23,'Deniz','Hak','05412147790','23210036547','2004-11-25','hakdeniz@gmail.com','ERKEK'),
(24,'Özgür','Parlak','02261237998','30316529974','1969-10-24','parlakozgur@gmail.com','ERKEK'),
(25,'Reyhan','Iþýk','05321478879','40562310017','2003-11-14','isikreyhan@hotmail.com','KADIN'),
(26,'Zehra','Gonçe','02264571203','11141232698','2000-12-14','goncezehra@gmail.com','KADIN'),
(27,'Hülya','Karadeniz','05316330215','14164876620','1971-07-19','hulyakaradeniz@gmail.com','KADIN'),
(28,'Ayse','Karadeniz','05318266698','14164876420','1975-04-19','aysekaradeniz@gmail.com','KADIN'),
(29,'Hakan','Asar','05262147790','23210036547','2004-11-25','asarhakan@gmail.com','ERKEK'),
(30,'Hakan','Yolcu','02261654998','27016529974','2001-10-24','yolcuhakan@gmail.com','ERKEK'),
(31,'Dilan','Sönmez','','22036970012','2000-05-24','','KADIN'),
(32,'Dilan','Durmaz','','47023269789','2004-12-12','','KADIN'),
(33,'Bedircan','Demir','05326989565','70351087165','1990-05-14','','ERKEK'),
(34,'Tugce','Demir','02265489656','12454578965','1997-06-13','','KADIN'),
(35,'Mýsra','Yurt','05485687847','23165656232','1996-01-23','yurtmisra@gmail.com','KADIN');


INSERT INTO Sefer(seferID,kalkisterminalID,varisterminalID,peron_no, kalkis_tarihi, kalkis_saati ,varis_tarihi,varis_saati,sefer_suresi,enlem,boylam,arac_ID,terminal_ID)  VALUES
( 1,05,34,10,'2019-05-01','13:00:00','2019-05-01','15:00:00',2,'30.190000','31.02552222',1,35),
( 2,35,34,12,'2019-05-01','15:00:00','2019-05-01','17:00:00',2,'32.62065460','31.02132122',12,10),
( 3,3,10,13,'2019-03-01','17:00:00','2019-03-01','19:00:00',2,'35.84598','37.2654222',23,15),
( 4,05,34,20,'2019-05-01','09:30:00','2019-05-01','14:30:00',5,'45.560950','39.0229842',13,20),
( 5,35,34,15,'2019-05-01','10:30:00','2019-05-01','15:30:00',5,'28.190650','31.895322',28,25),
( 6,5,4,16,'2019-06-01','11:30:00','2019-06-01','16:30:00',5,'33.26000','32.625222',6,30),
( 7,05,34,11,'2019-05-01','12:00:00','2019-05-01','18:00:00',6,'32.789500','31.022562',29,35),
( 8,35,34,18,'2019-08-01','13:00:00','2019-08-01','19:00:00',6,'30.132598','32.65465462',30,4),
( 9,8,1,19,'2019-09-01','14:00:00','2019-09-01','20:00:00',6,'22.956746','25.6516562',9,4),
( 10,7,10,10,'2019-01-02','07:30:00','2019-01-02','14:30:00',7,'26.6546540','27.1654684',30,5),
( 11,05,34,11,'2019-02-02','08:30:00','2019-02-02','15:30:00',7,'37.191610','37.022222',1,5),
( 12,3,6,13,'2019-03-02','09:30:00','2019-03-02','16:30:00',7,'29.654684','31.96542',7,6),
( 13,6,5,11,'2019-04-02','10:00:00','2019-04-02','18:00:00',8,'47.0656522','45.266841',18,32),
( 14,5,34,16,'2019-03-02','11:00:00','2019-03-02','19:00:00',8,'27.6486511','29.265464677',12,29),
( 15,5,34,14,'2019-06-02','12:00:00','2019-06-02','20:00:00',8,'26.846957644','27.698548',13,28),
( 16,4,9,14,'2019-07-02','20:00:00','2019-07-03','19:00:00',23,'65.2165112','63.126548',21,24),
( 17,5,34,12,'2019-05-02','19:00:00','2019-05-02','20:00:00',1,'39.6452488466','44.7822',28,14),
( 18,2,3,19,'2019-08-03','20:00:00','2019-08-03','21:00:00',1,'39.6452488466','40.022222',23,1),
( 19,10,9,20,'2019-08-04','22:00:00','2019-08-04','23:00:00',1,'28.7867466','29.4562222',24,30),
( 20,10,4,17,'2019-08-05','18:00:00','2019-08-05','19:00:00',1,'40.4545466','44.022222',25,15),
( 21,35,34,10,'2019-11-01','13:00:00','2019-11-01','15:00:00',2,'30.190000','31.02552222',29,30),
( 22,2,3,12,'2019-02-01','15:00:00','2019-02-01','17:00:00',2,'32.62065460','31.02132122',9,10),
( 23,3,10,13,'2019-03-01','17:00:00','2019-03-01','19:00:00',2,'35.84598','37.2654222',8,56),
( 24,35,34,20,'2019-04-01','09:30:00','2019-04-01','14:30:00',5,'45.560950','39.0229842',30,78),
( 25,35,634,15,'2019-05-01','10:30:00','2019-05-01','15:30:00',5,'28.190650','31.895322',1,78);

INSERT INTO Guzergah (GuzergahID,GirisTarih,CikisTarih,sefer_ID,terminal_ID)VALUES 
(1,'2019-01-01','2019-01-01',1,5),
(2,'2019-02-01','2019-02-03',2,10),
(3,'2019-03-01','2019-03-04',3,15),
(4,'2019-04-01','2019-04-05',4,20),
(5,'2019-05-01','2019-05-06',5,25),
(6,'2019-06-01','2019-06-07',6,30),
(7,'2019-07-01','2019-07-08',7,35),
(8,'2019-08-01','2019-08-09',8,4),
(9,'2019-09-01','2019-09-10',9,4),
(10,'2019-10-01','2019-10-11',10,5),
(11,'2019-11-01','2019-11-12',11,35),
(12,'2019-12-01','2019-12-13',12,10),

(13,'2020-01-01','2020-01-01',13,15),
(14,'2020-02-01','2020-02-01',14,7),
(15,'2020-03-01','2020-03-01',15,7),
(16,'2020-04-01','2020-04-01',16,18),
(17,'2020-05-01','2020-05-01',17,13),
(18,'2020-06-01','2020-06-01',18,12),
(19,'2020-07-01','2020-07-01',19,24),
(20,'2020-08-01','2020-08-01',20,26),
(21,'2020-09-01','2020-09-01',1,18),
(22,'2020-10-01','2020-10-01',2,10),
(23,'2020-11-01','2020-11-01',3,17),
(24,'2020-12-01','2020-12-01',4,32);
INSERT INTO dbo.Personel(personelID,Adý,Soyadý,PerTc,Mail,Telno,Adres,firma_ID,gorev_ID,sefer_ID) VALUES 
(1,'Ýnci', 'Günay','42659768342','incigunay@gmail.com','05486789087','zülal mah.gercek sok. deniz apt.14/21 bahçelievler/Ankara',20,1,19),
(2, 'Mert', 'Günay','70597683480','mertgunay@gmail.com','05486789088','zülal mah.gercek sok. deniz apt.14/21 bahçelievler/Ankara',22,6,20),
(3,'Ali', 'Soylu','22659768158','alisoylu@gmail.com','05486789087','zülal mah.gercek sok. deniz apt.18/21 bahçelievler/Ankara',24,4,13),
(4,'Veli', 'Demir','65799768356','velidemir@gmail.com','05486789027','zülal mah.gercek sok. deniz apt.16/21 bahçelievler/Ankara',26,4,4),
(5,'Fatma', 'Sancak','34579768359','fatmasancak@gmail.com','05486789017','zülal mah.gercek sok. deniz apt.15/21 bahçelievler/Ankara',28,5,6),
(6,'Ayþe', 'Aksu','11689768360','ayseaksu@gmail.com','05486789047','zülal mah.gercek sok. deniz apt.14/21 bahçelievler/Ankara',30,6,6),
(7,'Selin', 'Dermez','58959768362','selindermez@gmail.com','05486789067','zülal mah.gercek sok. deniz apt.14/21 bahçelievler/Ankara',32,7,19),
(8,'Fatma', 'Soylu','42652222364','fatmasoylu@gmail.com','05486789057','zülal mah.gercek sok. ak apt.14/21 bahçelievler/Ankara',34,8,18),
(9, 'Su', 'Açýk','99669768374','suaacýk@gmail.com','05486789077','zülal mah.gercek sok. ziya apt.14/21 bahçelievler/Ankara',36,9,9),
(10,'Mehmet', 'Kar','84729768373','mehmetkar@gmail.com','05486789099','ali mah.kar sok. soya apt.14/21 bahçelievler/Ankara',38,10,2),
(11,'Yakup', 'Demir','70359768384','yakupdemir@gmail.com','05486789089','sonkar mah.suya sok. deniz apt.14/31 bahçelievler/Ýstanbul',40,11,20),
(12,'Veli','Aksu','97456237741','aksuveli@hotmail.com','05412369603','yenice mah.sumak sok. yedinumara apt 14/54 avcýlar/Ýstanbul',24,10,19),
(13,'Ayþe','Mart','97450124341','martayse@hotmail.com','05262377603','sultaniye mah.zemzem sok. kimonoapt 14/31 esenyurt/Ýstanbul',26,10,1),
(14,'Fatma','Ekin','75486230131','ekinzeynep@hotmail.com','05416314603','namýk mah.yenigün sok.çalýþkan apt 11/56 niksar/Tokat',28,11,15),
(15,'Orhan','Ýpek','97009237104','orhan_ipek@hotmail.com','0502369603','parlak mah.zeytin sok. kimsesiz apt 27/27 aliaða/izmir',32,7,17),
(16,'Sabri','Aksu','97401279441','sabriaksu@gmail.com','03262361403','yenice mah.sumak sok. yedinumara apt 14/54 çeþme/Ýzmir ',24,11,13),
(17,'Turgut','Yalnýz','40400327741','yalnizturgut@hotmail.com','0570361113','yardým mah.ilkem sok. yýlmaz apt 01/34 avcýlar/Ýstanbul',34,2,2),
(18,'Poyraz','Soylu','40566237041','akinpoyraz@hotmail.com','05422229624','yurdum mah.ekþi sok. sakýzapt 11/63 esenyurt /avcýlar',38,6,6),
(19,'Gizem','Son','33104578921','martigizem@gmail.com','05326989871','marti mah. eþref sok. 12/32 didim/aydýn',36,11,3),
(20,'Ýnci', 'Yýldýz','42659768342','yildizgunay@gmail.com','05486126087','zülal mah.gercek sok. deniz apt.14/21 bahçelievler/Ankara',20,1,19),
(21, 'Mert', 'Isik','27097683480','mertisik@gmail.com','05486782988','zülal mah.gercek sok. deniz apt.14/21 bahçelievler/Ankara',22,6,20),
(22,'Ali', 'Sor','38659768158','alisor@gmail.com','05366789087','zülal mah.gercek sok. deniz apt.18/21 bahçelievler/Ankara',24,4,13),
(23,'Veli', 'Dag','12399768356','velidag@gmail.com','05486789027','zülal mah.gercek sok. deniz apt.16/21 bahçelievler/Rize',26,4,4),
(24,'Fatma', 'Sanar','23479768359','fatmasanar@gmail.com','05481234517','zülal mah.gercek sok. deniz apt.15/21 bahçelievler/Bursa',28,5,6);


INSERT INTO  Bulunur(bulID,per_ID,sefer_ID) VALUES 
(1,19,7),
(2,18,4),
(3,1,3),
(4,7,6),
(5,12,1),
(6,13,7),
(7,19,2),
(8,17,3),
(9,1,7),
(10,7,1),
(11,7,15),
(12,8,2),
(13,14,8),
(14,14,16),
(15,15,19),
(16,19,7),
(17,9,20),
(18,5,22),
(19,6,25),
(20,4,23),
(21,8,24),
(22,19,21),
(23,7,22),
(24,3,20),
(25,4,1),
(26,9,19),
(27,2,13),
(28,18,21),
(29,6,10),
(30,5,15),
(31,14,11),
(32,10,14),
(33,11,12),
(34,10,11),
(35,13,11),
(36,19,17),
(37,20,20),
(38,14,25),
(39,19,5),
(40,19,23),
(41,20,25),
(42,19,12),
(43,22,21),
(44,21,20),
(45,20,21),
(46,22,19),
(47,23,3),
(48,24,11),
(49,23,10),
(50,24,15);


INSERT INTO Bilet(BiletID,BagajKG,Durum,Tarih,Fiyat,sefer_ID,koltuk_ID,odeme_ID,yolcu_ID)
VALUES 
( 1,'150','0','2020-01-01','50',2,29,1,1), 
( 2,'80','1','2012-06-13','60',4,24,2,2),
( 3,'90','2','2019-01-01','70',6,26,3,3),
(4,'156','0','2019-12-25','80',8,18,4,4),
(5,'110','0','2015-12-12','90',10,30,5,5),
(6,'140','1','2018-05-07','100',7,30,6,6),
(7,'110','0','2020-11-24','150',9,14,7,7),
(8,'280','1','2019-04-25','200',10,29,8,8),
(9,'45','2','2020-11-24','230',11,18,9,9),
(10,'92','1','2013-11-18','270',11,18,10,10),
(11,'101','2','2001-09-23','280',11,22,11,11),
(12,'300','2','2015-07-19','300',14,24,12,12),
(13,'260','1','2022-01-15','400',15,11,12,13),
(14,'400','0','2022-12-16','250',16,9,4,14),
(15,'270','1','2022-03-24','170',16,12,8,15),
(16,'50','2','2020-10-26','60',18,11,8,16),
(17,'0','2','2019-09-30','40',19,18,9,17),
(18,'0','2','2025-07-31','40',15,5,10,18),
(19,'95','1','2021-05-15','100',20,13,6,19),
(20,'120','0','2008-06-18','100',13,29,11,20),
(21,'120','0','2008-01-13','1400',14,5,1,21),
(22,'76','1','2020-07-22','30',11,22,1,22),
(23,'13','0','2007-07-27','40',15,11,5,23),
(44,'178','2','2002-01-25','100',8,1,11,24),
(25,'430','2','2002-08-21','450',15,11,8,25),
(26,'260','0','2022-12-12','260',11,3,3,26),
(27,'260','0','2022-12-12','260',14,3,3,27),
(28,'280','1','2019-04-25','200',20,29,8,31),
(29,'45','2','2020-11-24','230',21,18,9,31),
(130,'92','1','2013-11-18','270',22,18,10,28),
(31,'101','2','2001-09-23','280',24,22,11,28),
(32,'300','2','2015-07-19','300',24,24,12,29),
(33,'260','1','2022-01-15','400',19,11,12,29),
(34,'400','0','2022-12-16','250',19,9,4,32),
(35,'270','1','2022-03-24','170',20,12,8,32),
(36,'50','2','2020-10-26','60',21,11,8,33),
(37,'0','2','2019-09-30','40',23,18,9,34),
(38,'0','2','2025-07-31','40',23,5,10,34),
(39,'95','1','2021-05-15','100',25,13,6,35),
(40,'120','0','2008-06-18','100',25,29,12,35);
















































