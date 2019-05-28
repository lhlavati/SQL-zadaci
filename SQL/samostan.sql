﻿# d:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\GitHub\SQL\samostan.sql"

drop database if exists samostan;
create database samostan DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci;
use samostan;

CREATE TABLE svecenik(
	sifra INT PRIMARY KEY NOT NULL auto_increment,
	ime VARCHAR(50) NOT NULL,
	prezime VARCHAR(50),
	OIB CHAR(11),
	nadredeni INT NOT NULL
);

CREATE TABLE posao(
	sifra INT PRIMARY KEY NOT NULL auto_increment,
	naziv VARCHAR(100) NOT NULL
);

CREATE TABLE obavlja(
	svecenik INT,
	posao INT
);

ALTER TABLE svecenik ADD FOREIGN KEY (nadredeni) REFERENCES svecenik(sifra);
ALTER TABLE obavlja ADD FOREIGN KEY (svecenik) REFERENCES svecenik(sifra);
ALTER TABLE obavlja ADD FOREIGN KEY (posao) REFERENCES posao(sifra);

INSERT INTO posao
VALUES (1, 'Pranje poda');

INSERT INTO posao
VALUES (2, 'Priprema za svetu misu');

INSERT INTO posao
VALUES (3, 'Slaganje knjiga');

INSERT INTO svecenik (sifra, ime, nadredeni)
VALUES (1, 'Franjo', 1);

INSERT INTO svecenik (sifra, ime, nadredeni)
VALUES (2, 'Toni', 1);

INSERT INTO svecenik (sifra, ime, nadredeni)
VALUES (3, 'Ivan', 3);

INSERT INTO obavlja
VALUES (1, 3);

INSERT INTO obavlja
VALUES (2, 1);