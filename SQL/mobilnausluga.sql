# d:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\GitHub\SQL\mobilnausluga.sql"

drop database if exists mobilnausluga;
create database mobilnausluga;
use mobilnausluga;

CREATE TABLE operater(
	predbroj INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	naziv VARCHAR(50) NOT NULL
);

CREATE TABLE korisnik(
	sifra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	OIB CHAR (11),
	ime VARCHAR(50) NOT NULL,
	prezime VARCHAR(50) NOT NULL,
	broj_tel CHAR(50) NOT NULL,
	operater INT,
	uredaj INT
);

CREATE TABLE uredaj(
	imei INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	marka VARCHAR(50) NOT NULL,
	model VARCHAR(50)
);

ALTER TABLE korisnik ADD FOREIGN KEY (operater) REFERENCES operater(predbroj);
ALTER TABLE korisnik ADD FOREIGN KEY (uredaj) REFERENCES uredaj(imei);

INSERT INTO operater
VALUES (91, 'VIP');

INSERT INTO operater
VALUES (98, 'T-COM');

INSERT INTO operater
VALUES (95, 'TELE2');

INSERT INTO uredaj(imei, marka)
VALUES (1, 'Huawei');

INSERT INTO uredaj(imei, marka)
VALUES(2, 'Samsung');

INSERT INTO uredaj(imei, marka)
VALUES(3, 'Samsung');

INSERT INTO uredaj(imei, marka)
VALUES(4, 'Iphone');

INSERT INTO uredaj(imei, marka)
VALUES(5, 'Samsung');

INSERT INTO korisnik (sifra, OIB, ime, prezime, broj_tel, operater, uredaj)
VALUES (1, 43706733560, 'Luka', 'Hlavati', '5-555-871', 91, 1);

INSERT INTO korisnik (sifra, OIB, ime, prezime, broj_tel, operater, uredaj)
VALUES (2, 123456789101, 'Ivan', 'Ivic', '5-553-694', 98, 2);

INSERT INTO korisnik (sifra, OIB, ime, prezime, broj_tel, operater, uredaj)
VALUES (3, 77442219023, 'Marko', 'Markic', '5-550-794', 91, 3);

INSERT INTO korisnik (sifra, OIB, ime, prezime, broj_tel, operater, uredaj)
VALUES (4, 25178954355, 'Matej', 'Matic', '5-556-050', 95, 4);

SELECT concat(K.ime,' ', K.prezime) AS korisnik, concat ('+385-',O.predbroj,K.broj_tel) AS broj_tel, O.naziv, U.marka, U.model
FROM operater AS O, korisnik AS K, uredaj AS U
WHERE O.predbroj = K.operater AND U.imei = K.uredaj AND U.marka = 'Samsung';

SELECT concat (a.ime,' ', a.prezime) AS korisnik, concat ('+385-',b.predbroj,a.broj_tel) AS broj_tel, b.naziv, c.marka, c.model
FROM korisnik a INNER JOIN operater b ON a.operater = b.predbroj
INNER JOIN uredaj c ON a.uredaj = c.imei
WHERE c.marka = 'Samsung';










