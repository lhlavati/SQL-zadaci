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

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (1, 'Bruna', 'Antunovic', 12345678987, 'Ž');

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (2, 'Joško', 'Miletic', 12345678986, default);

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (3, 'Luka', 'Hulak', 12345678985, default);

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (4, 'Luka', 'Hlavati', 12345678984, default);

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (5, 'Josipa', 'Josic', 12345678983, 'Ž');

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (1, 'Filip', 'Batori', +385991234567, 1);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (2, 'Alen', 'Klun', +385991234566, 5);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (3, 'Filip', 'Hulak', +385991234565, 3);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (4, 'Tomica', 'Miletic', +385991234564, 2);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (5, 'Nikola', 'Tokic', +385991234563, 4);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (6, 'Marija', 'Miletic', +385991234562, 5);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (7, 'Željka', 'Antunovic', +385991234561, 4);
