# izvođenje
# Ova datoteka se nalazi na d:\
# d:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\SQL\taxisluzba.sql"

drop database if exists taxisluzba;
create database taxisluzba;
use taxisluzba;

CREATE TABLE vozilo(
	sifra INT PRIMARY KEY NOT NULL,
	marka VARCHAR(50),
	gorivo VARCHAR(6) DEFAULT 'diesel' CHECK(gorivo IN('diesel','benzin','struja')),
	snaga VARCHAR(8),
	ABS_ boolean,
	godiste CHAR(4),
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

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (1, 'Škoda', 'diesel', '77 kW', true, 2013, 1);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (2, 'Dacia', 'benzin', '66 kW', true, 2016, 2);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (3, 'Citroën', 'diesel', '66 kW', true, 2007, 3);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (4, 'Seat', 'diesel', '47 kW', false, 2003, 4);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (5, 'VW', 'struja', '100 kW', true, 2018, 5);
