drop database if exists djecjivrtic;
create database djecjivrtic;
use djecjivrtic;

CREATE TABLE odgojnaskupina(
	sifra INT PRIMARY KEY NOT NULL,
	naziv VARCHAR (50) NOT NULL
);

CREATE TABLE odgajateljica(
	sifra INT PRIMARY KEY NOT NULL,
	ime VARCHAR(50) NOT NULL,
	prezime VARCHAR(50) NOT NULL,
	OIB CHAR (11),
	strucna_sprema VARCHAR(50) NOT NULL
);

CREATE TABLE djeca(
	sifra INT PRIMARY KEY NOT NULL,
	ime VARCHAR(50) NOT NULL,
	prezime VARCHAR(50) NOT NULL,
	odgojnaskupina INT,
	odgajateljica INT
);

ALTER TABLE djeca ADD FOREIGN KEY (odgojnaskupina) REFERENCES odgojnaskupina(sifra);
ALTER TABLE djeca ADD FOREIGN KEY (odgajateljica) REFERENCES odgajateljica(sifra);