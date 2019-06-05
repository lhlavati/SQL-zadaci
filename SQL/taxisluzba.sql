# d:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\GitHub\SQL\taxisluzba.sql"

drop database if exists taxisluzba;
create database taxisluzba;
use taxisluzba;

CREATE TABLE vozilo(
	sifra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	marka VARCHAR(50),
	gorivo VARCHAR(6) DEFAULT 'diesel',
	snaga VARCHAR(8),
	ABS_ boolean,
	godiste CHAR(4),
	brojVozila INT NOT NULL
);

CREATE TABLE vozac(
	sifra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	ime VARCHAR(50) NOT NULL,
	prezime VARCHAR(50),
	OIB CHAR(11),
	spol CHAR(1) DEFAULT 'M'
);

CREATE TABLE voznja(
	sifra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	cijena DECIMAL(18,2),
	adresaPolazista VARCHAR(50) NOT NULL,
	adresaOdredista VARCHAR(50) NOT NULL,
	brojMob VARCHAR(15) NOT NULL,
	brojPutnika INT,
	vozi INT
);

CREATE TABLE vozi(
	sifra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	vrijemePocetka DATETIME DEFAULT NOW() NOT NULL,
	vrijemeKraja DATETIME DEFAULT NOW() NOT NULL,
	vozilo INT,
	vozac INT
);

ALTER TABLE vozi ADD FOREIGN KEY (vozac) REFERENCES vozac(sifra);
ALTER TABLE vozi ADD FOREIGN KEY (vozilo) REFERENCES vozilo(sifra);
ALTER TABLE voznja ADD FOREIGN KEY (vozi) REFERENCES vozi(sifra);
############################################# INSERT ##########################################

# VOZILA 

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (1, 'Skoda', DEFAULT, '77 kW', TRUE, 2013, 1);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (2, 'Dacia', 'benzin', '66 kW', TRUE, 2016, 2);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (3, 'Citroen', 'diesel', '66 kW', TRUE, 2007, 3);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (4, 'Seat', DEFAULT, '47 kW', FALSE, 2003, 4);

INSERT INTO vozilo (sifra, marka, gorivo, snaga, ABS_, godiste, brojVozila)
VALUES (5, 'Audi', 'diesel', '100 kW', TRUE, 2018, 5);

# VOZACI

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (1, 'Bruna', 'Antunovic', 77818759289, 'Z');

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (2, 'Josko', 'Miletic', 62237004595, DEFAULT);

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (3, 'Luka', 'Hulak', 41464720097, DEFAULT);

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (4, 'Luka', 'Hlavati', 08329612103, DEFAULT);

INSERT INTO vozac (sifra, ime, prezime, OIB, spol)
VALUES (5, 'Josipa', 'Josic', 28729436831, 'Z');

# VOZI

INSERT INTO vozi(sifra, vrijemePocetka, vrijemeKraja, vozilo, vozac)
VALUES (1, DEFAULT, DEFAULT, 1, 1);

INSERT INTO vozi(sifra, vrijemePocetka, vrijemeKraja, vozilo, vozac)
VALUES (2, DEFAULT, DEFAULT, 2, 2);

INSERT INTO vozi(sifra, vrijemePocetka, vrijemeKraja, vozilo, vozac)
VALUES (3, DEFAULT, DEFAULT, 3, 3);

INSERT INTO vozi(sifra, vrijemePocetka, vrijemeKraja, vozilo, vozac)
VALUES (4, '2019-06-05 13:05:16', '2019-06-05 13:15:00', 4, 4);

INSERT INTO vozi(sifra, vrijemePocetka, vrijemeKraja, vozilo, vozac)
VALUES (5, DEFAULT, DEFAULT, 5, 5);

INSERT INTO vozi(sifra, vrijemePocetka, vrijemeKraja, vozilo, vozac)
VALUES (6, '2019-06-05 13:36:36', '2019-06-06 13:50:10', 1, 4);

INSERT INTO vozi(sifra, vrijemePocetka, vrijemeKraja, vozilo, vozac)
VALUES (7, '2019-06-05 14:00:00', '2019-06-05 14:20:23', 3, 4);


# VOZNJE

INSERT INTO voznja (sifra, cijena, adresaPolazista, adresaOdredista, brojMob, brojPutnika, vozi)
VALUES (1, 20, 'Vukovarska 90, Osijek', 'Kapucinska 30, Osijek', '+385955551000', 4, 4);

INSERT INTO voznja (sifra, cijena, adresaPolazista, adresaOdredista, brojMob, brojPutnika, vozi)
VALUES (2, 35.50, 'Bosanska 35, Osijek', 'Josipa Kozarca 20, Visnjevac','+385975556341', 2, 7);

INSERT INTO voznja (sifra, cijena, adresaPolazista, adresaOdredista, brojMob, brojPutnika, vozi)
VALUES (3, 20, 'Reisnerova 10, Osijek', 'Zupanijska 62, Osijek','+385955557786', 3, 4);

INSERT INTO voznja (sifra, cijena, adresaPolazista, adresaOdredista, brojMob, brojPutnika, vozi)
VALUES (4, 23, 'Ivana Gundulica 139, Osijek', 'Ruzina 16, Osijek','+385915552830', 1, 6); 

INSERT INTO voznja (sifra, cijena, adresaPolazista, adresaOdredista, brojMob, brojPutnika, vozi)
VALUES (5, 20, 'Franje Krezme 11, Osijek', 'Vukovarska 5, Osijek','+385925555090', 1, 5);

INSERT INTO voznja (sifra, adresaPolazista, adresaOdredista)
VALUES (6,'Redak za', 'Brisanje');

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

UPDATE voznja SET brojPutnika = 2
WHERE sifra = 5;

DELETE FROM voznja
WHERE sifra = 6;

SELECT * FROM voznja;
SELECT * FROM vozi;
SELECT * FROM vozilo;
SELECT * FROM vozac;

# Ispisi sve iz voznje gdje je broj putnika 2 ili više

SELECT a.cijena, a.adresaPolazista, a.adresaOdredista, a.brojMob, a.brojPutnika, concat(c.ime,' ', c.prezime) AS Vozac, d.brojVozila
FROM voznja a INNER JOIN vozi b ON a.vozi = b.sifra
INNER JOIN vozac c ON c.sifra = b.vozac
INNER JOIN vozilo d ON d.sifra = b.vozilo
WHERE a.brojPutnika > 2;

# Koliko novaca je zaradio vozaè Luka Hlavati od 13 do 14 sati 5.6.2019

SELECT concat(c.ime,' ',c.prezime) AS Vozac, sum(a.cijena) AS Zarada
FROM voznja a INNER JOIN vozi b ON b.sifra = a.vozi 
INNER JOIN vozac c ON c.sifra = b.vozac
WHERE c.ime = 'Luka' AND c.prezime = 'Hlavati' AND (b.vrijemePocetka BETWEEN '2019-06-05 13:00:00' AND '2019-06-05 13:59:59');