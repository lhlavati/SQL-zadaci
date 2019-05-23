# d:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < "D:\GitHub\SQL\NHL.sql"

drop database if exists NHL;
create database NHL;
use NHL;

CREATE TABLE tim(
	sifra INT PRIMARY KEY NOT NULL,
	ime VARCHAR(100) NOT NULL,
	grad VARCHAR(50),
	trener VARCHAR(50),
	kapetan INT
);

CREATE TABLE igrac(
	sifra INT PRIMARY KEY NOT NULL,
	ime VARCHAR(50),
	prezime VARCHAR(50) NOT NULL,
	pozicija CHAR(2) NOT NULL,
	brojDresa INT NOT NULL,
	tim INT
);

CREATE TABLE utakmica(
	sifra INT PRIMARY KEY NOT NULL,
	rezultatDomacin INT,    
	rezultatGost INT,    
	datumUtakmice DATETIME NOT NULL,
	domacin INT,
	gost INT
);

CREATE TABLE ozljeda(
	sifra INT PRIMARY KEY NOT NULL,
	opisIncidenta VARCHAR (200),
	opisOzljede VARCHAR (200) NOT NULL,
	igrac INT
);

CREATE TABLE kapetan(
	sifra INT PRIMARY KEY NOT NULL,
	igrac INT
);

ALTER TABLE kapetan ADD FOREIGN KEY (igrac) REFERENCES igrac(sifra);
ALTER TABLE tim ADD FOREIGN KEY (kapetan) REFERENCES kapetan(sifra);
ALTER TABLE igrac ADD FOREIGN KEY (tim) REFERENCES tim(sifra);
ALTER TABLE utakmica ADD FOREIGN KEY (domacin) REFERENCES tim(sifra);
ALTER TABLE utakmica ADD FOREIGN KEY (gost) REFERENCES tim(sifra);
ALTER TABLE ozljeda ADD FOREIGN KEY (igrac) REFERENCES igrac(sifra);