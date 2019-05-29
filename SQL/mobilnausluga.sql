# d:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\GitHub\SQL\mobilnausluga.sql"

drop database if exists mobilnausluga;
create database mobilnausluga;
use mobilnausluga;

CREATE TABLE operater(
	predbroj INT PRIMARY KEY NOT NULL,
	naziv VARCHAR(50) NOT NULL
);

CREATE TABLE korisnik(
	OIB INT PRIMARY KEY NOT NULL,
	ime VARCHAR(50) NOT NULL,
	prezime VARCHAR(50) NOT NULL,
	broj_tel INT NOT NULL,
	operater INT,
	uredaj INT
);

CREATE TABLE uredaj(
	imei INT PRIMARY KEY NOT NULL,
	marka VARCHAR(50) NOT NULL,
	model VARCHAR(50)
);

ALTER TABLE korisnik ADD FOREIGN KEY (operater) REFERENCES operater(predbroj);
ALTER TABLE korisnik ADD FOREIGN KEY (uredaj) REFERENCES uredaj(imei);