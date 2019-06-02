
# d:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\GitHub\SQL\djecjivrtic.sql"

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

INSERT INTO odgojnaskupina
VALUES (1, "Zvoncic");

INSERT INTO odgojnaskupina
VALUES (2, "Jabuka");

INSERT INTO odgojnaskupina
VALUES (3, "Jež");

INSERT INTO odgajateljica (sifra, ime, prezime)
VALUES (1, "Ivana", "Sigurnjak");

INSERT INTO odgajateljica (sifra, ime, prezime)
VALUES (2, "Ines", "Škrnjug");

INSERT INTO djeca
VALUES (1, "Luka", "Hlavati", 2, 1);

INSERT INTO djeca
VALUES (2, "Luka", "Hulak", 3, 2);

INSERT INTO djeca
VALUES (3, "Josip", "Josic", 1, 2);

INSERT INTO djeca (sifra, ime, prezime)
VALUES (4, "Red za", "brisanje.");

DELETE FROM djeca
WHERE sifra = 4;

UPDATE odgojnaskupina SET naziv = "Breskva"
WHERE naziv = "Jež";

UPDATE odgajateljica SET ime = "Ivana", prezime = "Ivic"
WHERE sifra = 1;

UPDATE djeca SET ime = "Lux"
WHERE ime = "Luka";

SELECT * FROM djeca;

# Ispiši svu djecu, nazive njihovih skupina i imena odgajateljica

SELECT concat(a.ime,' ', a.prezime) AS Dijete, concat(b.ime,' ', b.prezime) AS Odgajateljica, c.naziv AS Skupina
FROM djeca a INNER JOIN odgajateljica b ON a.odgajateljica = b.sifra
INNER JOIN odgojnaskupina c ON a.odgojnaskupina = c.sifra;

# Ispiši ime i prezime djece i naziv skupine kojima je odgajateljica 'Ines Škrnjug'

SELECT concat(a.ime,' ', a.prezime) AS Dijete, c.naziv
FROM djeca a INNER JOIN odgajateljica b ON a.odgajateljica = b.sifra
INNER JOIN odgojnaskupina c ON a.odgojnaskupina = c.sifra
WHERE b.ime = 'Ines' AND b.prezime = 'Škrnjug';