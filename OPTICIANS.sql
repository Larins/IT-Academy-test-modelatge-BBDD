DROP DATABASE IF EXISTS opticians;
CREATE DATABASE opticians CHARACTER SET utf8mb4;
USE opticians;

CREATE TABLE Customer(
	idCustomer INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(45) NOT NULL,
	Lastname1 VARCHAR(45) NOT NULL,
	Lastname2 VARCHAR(45) NOT NULL,
	Address VARCHAR(45) NOT NULL,
	City VARCHAR(45) NOT NULL,
	PostalCode VARCHAR(45) NOT NULL,
	RegisterDate DATE NOT NULL,
	PRIMARY KEY (idCustomer)
);

CREATE TABLE Provider(
	idProvider INT NOT NULL AUTO_INCREMENT,
	CompanyName VARCHAR(45) NOT NULL,
	Address VARCHAR(45) NOT NULL,
	City VARCHAR(45) NOT NULL,
	Country VARCHAR(45) NOT NULL,
	PostalCode VARCHAR(45) NOT NULL,
	Phone VARCHAR(45) NOT NULL,
	Fax VARCHAR(45) NOT NULL,
	NIF VARCHAR(45) NOT NULL,
	PRIMARY KEY (idProvider)
);

CREATE TABLE Employee(
	idEmployee INT NOT NULL AUTO_INCREMENT,
	Name VARCHAR(45) NOT NULL,
	Lastname1 VARCHAR(45) NOT NULL,
	Lastname2 VARCHAR(45) NOT NULL,
	PRIMARY KEY (idEmployee)
);

CREATE TABLE Brand(
	idBrand INT NOT NULL AUTO_INCREMENT,
	id_Provider INT NOT NULL,
	BrandName VARCHAR(45) NOT NULL,
	PRIMARY KEY (idBrand),
	FOREIGN KEY (id_Provider) REFERENCES Provider(idProvider)
);

CREATE TABLE Catalog(
	idCatalog INT NOT NULL AUTO_INCREMENT,
	id_Brand INT NOT NULL,
	id_Provider INT NOT NULL,
	CatalogName VARCHAR(45) NOT NULL,
	PRIMARY KEY (idCatalog), 
	FOREIGN KEY (id_Brand) REFERENCES Brand(idBrand),
	FOREIGN KEY (id_Provider) REFERENCES Provider(idProvider)
);

CREATE TABLE Personalization(
	idPersonalization INT NOT NULL AUTO_INCREMENT,
	id_Customer INT NOT NULL,
	id_Catalog INT NOT NULL,
	PrescriptionRight VARCHAR(45) NOT NULL,
	PrescriptionLeft VARCHAR(45)NOT NULL,
	Frame VARCHAR(45) NOT NULL,
	FrameColour VARCHAR(45) NOT NULL,
	GlassColourRight VARCHAR(45) NOT NULL,
	GlassColourLeft VARCHAR(45) NOT NULL,
	Price DECIMAL NOT NULL,
	PersonalizationDate DATE NOT NULL,
	PRIMARY KEY (idPersonalization),
	FOREIGN KEY (id_Customer) REFERENCES Customer(idCustomer),
	FOREIGN KEY (id_Catalog) REFERENCES Catalog(idCatalog)
);

CREATE TABLE Invoice(
	idInvoice INT NOT NULL AUTO_INCREMENT,
	id_Personalization INT NOT NULL,
	id_Customer INT NOT NULL,
	id_Employee INT NOT NULL,
	InvoiceHash VARCHAR(45) NOT NULL,
	PurchaseDate VARCHAR(45) NOT NULL,
	PRIMARY KEY (idInvoice),
	FOREIGN KEY (id_Personalization) REFERENCES Personalization(idPersonalization),
	FOREIGN KEY (id_Customer) REFERENCES Customer(idCustomer),
	FOREIGN KEY (id_Employee) REFERENCES Employee(idEmployee)
);

CREATE TABLE Recommendation(
	idRecommendation INT NOT NULL AUTO_INCREMENT,
	id_Recommended INT NOT NULL,
	id_Recommender INT NOT NULL,
	PRIMARY KEY (idRecommendation),
	FOREIGN KEY (id_Recommended) REFERENCES Customer(idCustomer),
	FOREIGN KEY (id_Recommender) REFERENCES Customer(idCustomer)
);

INSERT INTO Customer VALUES(1,"Ana","Álvarez","Campos","Osca 12 2o 2a","Barcelona","CP 08014","2020-01-02");
INSERT INTO Customer VALUES(2,"Juan","Jódar","Molinera","Gran Via 134 5o A","Barcelona","CP 08015","2020-01-03");
INSERT INTO Customer VALUES(3,"Pepa","Carpintero","Ibarruri","Osca 1 bajos 2a","Barcelona","CP 08016","2020-02-09");
INSERT INTO Customer VALUES(4,"Alba","Moreno","González","Osca 7 1o 1a","Barcelona","CP 08017","2020-02-15");
INSERT INTO Customer VALUES(5,"Alex","Iglesias","Sánchez","Salou 1 2o 2a","Barcelona","CP 08018","2020-02-17");
INSERT INTO Customer VALUES(6,"Rosa","Rubio","Sans","Masnou 30 3o 3a","Barcelona","CP 08019","2020-03-31");
INSERT INTO Customer VALUES(7,"Eva","Molina","Moldes","Salou 2 4o 1a","Barcelona","CP 08020","2020-04-07");
INSERT INTO Customer VALUES(8,"Paula","Aldea","Moya","Premià 30 2o 1a","Barcelona","CP 08021","2020-05-09");
INSERT INTO Customer VALUES(9,"Francina","de Rivendel","Martínez","Salou 30 1o 1a","Barcelona","CP 08022","2020-05-15");
INSERT INTO Customer VALUES(10,"Paola","Gásquez","Ruiz","Premià 32 bajos 2a","Barcelona","CP 08023","2020-06-18");
INSERT INTO Customer VALUES(11,"Marta","Gómez","Clavero","Autonomia 16 1o 1a","Barcelona","CP 08024","2020-06-28");
INSERT INTO Customer VALUES(12,"Joaquín","García","Clavel","Autonomia 14 bajos 2a","Barcelona","CP 08025","2020-07-29");
INSERT INTO Customer VALUES(13,"Julio","Von Paulus","Alemán","Masnou 13 bajos 1a","Barcelona","CP 08026","2020-08-09");

INSERT INTO Provider VALUES(1,"Federópticos","La red 12","Alcalá de Guadaira","España",41500,"955 63 48 48","955 63 21 27","F41565227");
INSERT INTO Provider VALUES(2,"Afflelou Internationale","Cours de Verdun Perrache 30","Lyon","Francia",69002,"(33) 4 25 11 13 13","(33) 4 25 11 13 13","78456-54LL");
INSERT INTO Provider VALUES(3,"Gafas y Lentes Martínez","Avenida Valladolid 84","Soria","España",42005,"900 500 600","900 500 600","1122334455V");

INSERT INTO Employee VALUES(1,"Juan","Martínez","Pérez");
INSERT INTO Employee VALUES(2,"Emma","Gòsol","Sans");
INSERT INTO Employee VALUES(3,"Mar","Ter","Clos");

INSERT INTO Brand VALUES(1,1,"Federbasics");
INSERT INTO Brand VALUES(2,1,"Federpremium");
INSERT INTO Brand VALUES(3,2,"Afflelou Tchin Tchin");
INSERT INTO Brand VALUES(4,2,"Afflelou Supreme");
INSERT INTO Brand VALUES(5,3,"Carolina Herrera");
INSERT INTO Brand VALUES(6,3,"Ray Ban");

INSERT INTO Catalog VALUES(1,1,1,"Federbasics Infantil");
INSERT INTO Catalog VALUES(2,1,1,"Federbasics Adulto");
INSERT INTO Catalog VALUES(3,2,1,"Federpremium Especial Conducción");
INSERT INTO Catalog VALUES(4,2,1,"Federpremium Especial Pantallas");
INSERT INTO Catalog VALUES(5,3,2,"Tchin Tchin baby");
INSERT INTO Catalog VALUES(6,3,2,"Tchin Tchin adult");
INSERT INTO Catalog VALUES(7,4,2,"Afflelou Supreme All Ambiences");
INSERT INTO Catalog VALUES(8,4,2,"Afflelou Supreme Blue Light Safe");
INSERT INTO Catalog VALUES(9,4,2,"Afflelou Supreme Sun");
INSERT INTO Catalog VALUES(10,5,3,"CH Daily & Office");
INSERT INTO Catalog VALUES(11,5,3,"CH Night & Cocktail");
INSERT INTO Catalog VALUES(12,6,3,"Ray Ban Aviator");
INSERT INTO Catalog VALUES(13,6,3,"Ray Ban Police");

INSERT INTO Personalization VALUES(1,1,7,"Myopia 0,25","Myopia 0,50","Plastic Paste","Black","Light Purple","Light Purple","161,54","2020-01-02");
INSERT INTO Personalization VALUES(2,2,3,"Astigmatism 1,5","None","Plastic Paste","Black","Uncoloured","Uncoloured","102,41","2020-01-03");
INSERT INTO Personalization VALUES(3,3,13,"Presbyopia 2,00","Presbyopia 2,50","Metallic","Grey Steel","Brown Sun Filter","Brown Sun Filter","255,65","2020-02-09");
INSERT INTO Personalization VALUES(4,4,10,"Myopia 0,50","Myopia 0,25","Unframed","Grey Steel","Light Blue","Light Blue","223,54","2020-02-15");
INSERT INTO Personalization VALUES(5,5,4,"None","Presbyopia 2,50","Plastic Paste","Green","Uncoloured","Uncoloured","90,86","2020-02-17");
INSERT INTO Personalization VALUES(6,6,1,"Myopia 0,50","Myopia 0,50","Plastic Paste","Blue","Uncoloured","Uncoloured","98,12","2020-03-31");
INSERT INTO Personalization VALUES(7,7,6,"Astigmatism 1,50","Astigmatism 2,00","Unframed","Grey Steel","Light orange","Light orange","114,13","2020-04-07");
INSERT INTO Personalization VALUES(8,8,2,"Astigmatism 3,00","Astigmatism 1,5","Unframed","Grey Steel","Light yellow","Light yellow","101,25","2020-05-09");
INSERT INTO Personalization VALUES(9,9,12,"Presbyopia 2,50","None","Metallic","Grey Steel","Black Sun Filter","Black Sun Filter","264,58","2020-05-15");
INSERT INTO Personalization VALUES(10,10,13,"None","Presbyopia 2,50","Metallic","Grey Steel","Blue Sun Filter","Blue Sun Filter","284,44","2020-06-18");
INSERT INTO Personalization VALUES(11,11,1,"Presbyopia 5,00","Presbyopia 5,50","Plastic Paste","Blue","Uncoloured","Uncoloured","87,45","2020-06-28");
INSERT INTO Personalization VALUES(12,12,6,"Astigmatism 2,00","None","Metallic","Grey Steel","Light orange","Light orange","158,89","2020-07-29");
INSERT INTO Personalization VALUES(13,13,8,"Myopia 3,25","Myopia 4,00","Plastic Paste","Red","Uncoloured","Uncoloured","198,54","2020-08-09");

INSERT INTO Invoice VALUES(1,1,1,1,"2020-0001","2020-01-12");
INSERT INTO Invoice VALUES(2,2,2,1,"2020-0002","2020-01-23");
INSERT INTO Invoice VALUES(3,3,3,3,"2020-0003","2020-02-19");
INSERT INTO Invoice VALUES(4,4,4,3,"2020-0004","2020-02-28");
INSERT INTO Invoice VALUES(5,5,5,2,"2020-0005","2020-03-05");
INSERT INTO Invoice VALUES(6,6,6,3,"2020-0006","2020-04-15");
INSERT INTO Invoice VALUES(7,7,7,1,"2020-0007","2020-04-28");
INSERT INTO Invoice VALUES(8,8,8,2,"2020-0008","2020-05-29");
INSERT INTO Invoice VALUES(9,9,9,3,"2020-0009","2020-06-01");
INSERT INTO Invoice VALUES(10,10,10,3,"2020-0010","2020-06-30");
INSERT INTO Invoice VALUES(11,11,11,1,"2020-0011","2020-07-08");
INSERT INTO Invoice VALUES(12,12,12,2,"2020-0012","2020-08-09");
INSERT INTO Invoice VALUES(13,13,13,3,"2020-0013","2020-08-21");

INSERT INTO Recommendation VALUES(1,2,1);
INSERT INTO Recommendation VALUES(2,5,2);
INSERT INTO Recommendation VALUES(3,7,6);
INSERT INTO Recommendation VALUES(4,9,2);
INSERT INTO Recommendation VALUES(5,10,2);
INSERT INTO Recommendation VALUES(6,13,8);
