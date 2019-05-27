# d:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\GitHub\SQL\NHL.sql"

drop database if exists NHL;
create database NHL;
use NHL;

CREATE TABLE tim(
	sifra INT PRIMARY KEY NOT NULL auto_increment,
	ime VARCHAR(100) NOT NULL,
	grad VARCHAR(50),
	trener VARCHAR(50),
	kapetan INT
);

CREATE TABLE igrac(
	sifra INT PRIMARY KEY NOT NULL auto_increment,
	ime VARCHAR(50),
	prezime VARCHAR(50) NOT NULL,
	pozicija CHAR(2) NOT NULL,
	brojDresa INT NOT NULL,
	tim INT
);

CREATE TABLE utakmica(
	sifra INT PRIMARY KEY NOT NULL auto_increment,
	rezultatDomacin INT,    
	rezultatGost INT,    
	datumUtakmice DATETIME DEFAULT NOW() NOT NULL,
	domacin INT,
	gost INT
);

CREATE TABLE ozljeda(
	sifra INT PRIMARY KEY NOT NULL auto_increment,
	opisIncidenta VARCHAR (200),
	opisOzljede VARCHAR (200) NOT NULL,
	igrac INT
);

ALTER TABLE tim ADD FOREIGN KEY (kapetan) REFERENCES igrac(sifra);
ALTER TABLE igrac ADD FOREIGN KEY (tim) REFERENCES tim(sifra);
ALTER TABLE utakmica ADD FOREIGN KEY (domacin) REFERENCES tim(sifra);
ALTER TABLE utakmica ADD FOREIGN KEY (gost) REFERENCES tim(sifra);
ALTER TABLE ozljeda ADD FOREIGN KEY (igrac) REFERENCES igrac(sifra);

INSERT INTO tim (sifra, ime)
VALUES (1, 'New York Rangers');

INSERT INTO tim (sifra, ime)
VALUES (2, 'Vegas Golden Knights');

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (1, 'Andersson', 'C', 50, 1);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (2, 'Carrier', 'LW', 28, 2);

INSERT INTO utakmica (sifra, datumUtakmice, domacin, gost)
VALUES (1, default, 1, 2);

INSERT INTO utakmica (sifra, datumUtakmice, domacin, gost)
VALUES (2, '2019-05-28', 2, 1);

INSERT INTO ozljeda (sifra, opisOzljede, igrac)
VALUES (1, 'Uganuce gležnja', 1);

UPDATE tim SET trener = 'David Quinn'
WHERE NOT sifra = 2;

UPDATE tim SET trener = 'Gerard Gallant'
WHERE sifra > 1;