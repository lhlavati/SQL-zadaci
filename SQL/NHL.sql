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

INSERT INTO tim (sifra, ime, trener, kapetan)
VALUES (1, 'New York Rangers', 'David Quinn', 11);

INSERT INTO tim (sifra, ime, trener, kapetan)
VALUES (2, 'Vegas Golden Knights', 'Gerard Gallant', 22);

INSERT INTO tim (sifra, ime, trener, kapetan)
VALUES (3, 'Boston Bruins', 'Bruce Cassidy', 33);

# New York Rangers
INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (11, 'Andersson', 'C', 50, 1);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (12, 'Brickley', 'LW', 23, 1);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (13, 'Buchnevich', 'RW', 89, 1);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (14, 'Claesson', 'L', 33, 1);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (15, 'DeAngelo', 'R', 77, 1);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (16, 'Georgiev', 'GK', 40, 1);

# Vegas Golden Knights

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (21, 'Carpenter', 'C', 40, 2);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (22, 'Carrier', 'LW', 28, 2);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (23, 'Reaves', 'RW', 75, 2);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (24, 'Engelland', 'R', 5, 2);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (25, 'Holden', 'L', 22, 2);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (26, 'Fleury', 'GK', 29, 2);

# Boston Bruins

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (31, 'Acciari', 'C', 55, 3);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (32, 'Backes', 'RW', 42, 3);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (33, 'Blidh', 'LW', 81, 3);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (34, 'Carlo', 'R', 25, 3);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (35, 'Chara', 'L', 33, 3);

INSERT INTO igrac (sifra, prezime, pozicija, brojDresa, tim)
VALUES (36, 'Halak', 'GK', 29, 3);
SELECT * utakmica;
INSERT INTO utakmica (sifra, datumUtakmice, domacin, gost)
VALUES (1, default, 1, 2);

INSERT INTO utakmica (sifra, datumUtakmice, domacin, gost)
VALUES (2, '2019-05-28', 2, 1);

INSERT INTO ozljeda (sifra, opisOzljede, igrac)
VALUES (1, 'Uganuce gleznja', 11);