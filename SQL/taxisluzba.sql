drop database if exists taxisluzba;
create database taxisluzba;
use taxisluzba;

CREATE TABLE vozilo(
	sifra INT PRIMARY KEY NOT NULL,
	marka VARCHAR(50),
	gorivo VARCHAR(6) DEFAULT 'dizel' CHECK(gorivo IN('dizel','benzin','struja')),
	snaga INT,
	ABS_ boolean,
	brojVozila INT NOT NULL
);

CREATE TABLE vozac(
	sifra INT PRIMARY KEY NOT NULL,
	ime VARCHAR(50) NOT NULL,
	prezime VARCHAR(50),
	OIB CHAR(11),
	spol CHAR(1) DEFAULT 'M' CHECK(spol IN('M','Z','T'))
);

CREATE TABLE putnik(
	sifra INT PRIMARY KEY NOT NULL,
	ime VARCHAR(50),
	prezime VARCHAR(50),
	brojMob VARCHAR(15) NOT NULL,
	vozac INT
);

CREATE TABLE voznja(
	sifra INT PRIMARY KEY NOT NULL,
	cijena DECIMAL(18,2),
	adresaPolazista VARCHAR(50) NOT NULL,
	adresaOdredista VARCHAR(50) NOT NULL,
	putnik INT
);

CREATE TABLE vozilo_vozac(
	vozilo INT,
	vozac INT
);

ALTER TABLE vozilo_vozac ADD FOREIGN KEY (vozac) REFERENCES vozac(sifra);
ALTER TABLE vozilo_vozac ADD FOREIGN KEY (vozilo) REFERENCES vozilo(sifra);
ALTER TABLE putnik ADD FOREIGN KEY (vozac) REFERENCES vozac(sifra);
ALTER TABLE voznja ADD FOREIGN KEY (putnik) REFERENCES putnik(sifra);
