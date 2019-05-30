# izvođenje
# Ova datoteka se nalazi na d:\
# d:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\GitHub\SQL\taxisluzba.sql"

drop database if exists taxisluzba;
create database taxisluzba;
use taxisluzba;

CREATE TABLE vozilo(
	sifra INT PRIMARY KEY NOT NULL,
	marka VARCHAR(50),
	gorivo VARCHAR(6) DEFAULT 'diesel',
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
	spol CHAR(1) DEFAULT 'M'
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

CREATE TABLE vozi(
	vozilo INT,
	vozac INT
);

ALTER TABLE vozi ADD FOREIGN KEY (vozac) REFERENCES vozac(sifra);
ALTER TABLE vozi ADD FOREIGN KEY (vozilo) REFERENCES vozilo(sifra);
ALTER TABLE putnik ADD FOREIGN KEY (vozac) REFERENCES vozac(sifra);
ALTER TABLE voznja ADD FOREIGN KEY (putnik) REFERENCES putnik(sifra);

############################################# INSERT ##########################################

# VOZILA 

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (1, 'Skoda', default, '77 kW', true, 2013, 1);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (2, 'Dacia', 'benzin', '66 kW', true, 2016, 2);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (3, 'Citroen', 'diesel', '66 kW', true, 2007, 3);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (4, 'Seat', default, '47 kW', false, 2003, 4);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (5, 'Audi', 'diesel', '100 kW', true, 2018, 5);

# VOZACI

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (1, 'Bruna', 'Antunovic', 12345678987, 'Z');

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (2, 'Josko', 'Miletic', 12345678986, default);

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (3, 'Luka', 'Hulak', 12345678985, default);

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (4, 'Luka', 'Hlavati', 12345678984, default);

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (5, 'Josipa', 'Josic', 12345678983, 'Z');

# PUTNICI

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (1, 'Filip', 'Batori', '+385991234567', 1);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (2, 'Alen', 'Klun', '+385991234566', 5);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (3, 'Filip', 'Hulak', '+385991234565', 3);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (4, 'Tomica', 'Miletic', '+385991234564', 2);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (5, 'Nikola', 'Tokic', '+385991234563', 4);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (6, 'Marija', 'Miletic', '+385991234562', 5);

INSERT INTO putnik (sifra, ime, prezime, brojMob, vozac)
VALUES (7, 'Željka', 'Antunovic', '+385991234561', 4);

# VOŽNJE

INSERT INTO voznja (sifra, adresaPolazista, adresaOdredista, putnik)
VALUES (1, 'Vukovarska 90, Osijek', 'Kapucinska 30, Osijek', 1);

INSERT INTO voznja (sifra, adresaPolazista, adresaOdredista, putnik)
VALUES (2, 'Bosanska 35, Osijek', 'Josipa Kozarca 20, Višnjevac', 2);

INSERT INTO voznja (sifra, adresaPolazista, adresaOdredista, putnik)
VALUES (3, 'Vijenac Ivana Meštrovica 135, Osijek', 'J.J. Strossmayer 62, Osijek', 4);

INSERT INTO voznja (sifra, adresaPolazista, adresaOdredista)
VALUES (4,'Redak za', 'Brisanje');

# VOZILO VOZAC

INSERT INTO vozi(vozilo, vozac)
VALUES (1,1),(2,2),(3,3),(4,4),(5,5);

UPDATE vozilo SET snaga = '90 KS'
WHERE snaga = '66 kW';

UPDATE vozac SET OIB = 72322160060
WHERE sifra = 1;

UPDATE vozac SET OIB = 75151938406
WHERE sifra = 2;

UPDATE vozac SET OIB = 06576565655
WHERE sifra = 3;

UPDATE vozac SET OIB = 25852669185
WHERE sifra = 4;

UPDATE vozac SET OIB = 09366221636
WHERE sifra = 5;

UPDATE putnik SET ime = 'Ivana',prezime = 'Sigurnjak'
WHERE sifra = 7;

UPDATE voznja SET putnik = 5
WHERE sifra = 1;

DELETE FROM voznja
WHERE sifra = 4;

# Ispis adresa odredista i polazista te broj vozila i vozaca
SELECT * FROM voznja;
SELECT e.adresaOdredista, e.adresaPolazista, a.brojVozila AS Broj_vozila, c.ime AS Vozac 
FROM vozilo a LEFT JOIN vozi b ON a.sifra = b.vozilo
INNER JOIN vozac c ON b.vozac = c.sifra
INNER JOIN putnik d ON c.sifra = d.vozac
INNER JOIN voznja e ON e.putnik = d.sifra
