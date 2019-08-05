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

INSERT INTO tim (sifra, ime, grad, trener)
VALUES (1, 'New York Rangers', 'New York City', 'David Quinn');

INSERT INTO tim (sifra, ime, grad, trener)
VALUES (2, 'Vegas Golden Knights', 'Las Vegas', 'Gerard Gallant');

INSERT INTO tim (sifra, ime, grad, trener)
VALUES (3, 'Boston Bruins', 'Boston', 'Bruce Cassidy');

# New York Rangers
INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (11, 'Lias', 'Andersson', 'C', 50, 1);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (12, 'Connor', 'Brickley', 'LW', 23, 1);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (13, 'Pavel', 'Buchnevich', 'RW', 89, 1);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (14, 'Fredrik', 'Claesson', 'L', 33, 1);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (15, 'Tony', 'DeAngelo', 'R', 77, 1);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (16, 'Alexander', 'Georgiev', 'GK', 40, 1);

# Vegas Golden Knights

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (21, 'Ryan', 'Carpenter', 'C', 40, 2);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (22, 'William', 'Carrier', 'LW', 28, 2);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (23, 'Ryan', 'Reaves', 'RW', 75, 2);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (24, 'Deryk', 'Engelland', 'R', 5, 2);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (25, 'Nick', 'Holden', 'L', 22, 2);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (26, 'Marc-Andre', 'Fleury', 'GK', 29, 2);

# Boston Bruins

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (31, 'Noel', 'Acciari', 'C', 55, 3);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (32, 'David', 'Backes', 'RW', 42, 3);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (33, 'Anton', 'Blidh', 'LW', 81, 3);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (34, 'Brandon', 'Carlo', 'R', 25, 3);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (35, 'Zdeno', 'Chara', 'L', 33, 3);

INSERT INTO igrac (sifra, ime, prezime, pozicija, brojDresa, tim)
VALUES (36, 'Jaroslav', 'Halak', 'GK', 29, 3);

INSERT INTO utakmica (sifra, rezultatDomacin, rezultatGost, datumUtakmice, domacin, gost)
VALUES (1, 2, 4, default, 1, 2);

INSERT INTO utakmica (sifra, rezultatDomacin, rezultatGost, datumUtakmice, domacin, gost)
VALUES (2, 5, 7, '2019-05-28', 2, 3);

INSERT INTO utakmica (sifra, rezultatDomacin, rezultatGost, datumUtakmice, domacin, gost)
VALUES (3, 0, 3, '2019-06-15', 3, 1);

INSERT INTO ozljeda (sifra, opisIncidenta, opisOzljede, igrac)
VALUES (1, 'Uganuo glezanj tijekom utakmice', 'Uganuce gleznja', 11);

INSERT INTO ozljeda (sifra, opisIncidenta, opisOzljede, igrac)
VALUES (2, 'Ne zgodno pao na led', 'Napuknuce kosti', 23);

INSERT INTO ozljeda (sifra, opisIncidenta, opisOzljede, igrac)
VALUES (3, 'Iscasio zglob na treningu', 'Iscasenje zgloba', 13);

INSERT INTO ozljeda (sifra, opisIncidenta, opisOzljede, igrac)
VALUES (4, 'Protivnicki igrac stao na nogu nakon sudara', 'Otekla noga', 35);

UPDATE tim SET kapetan = 11 WHERE sifra = 1;
UPDATE tim SET kapetan = 23 WHERE sifra = 2;
UPDATE tim SET kapetan = 35 WHERE sifra = 3;

SELECT * FROM igrac;
SELECT * FROM ozljeda;
SELECT * FROM tim;
SELECT * FROM utakmica;

# Ispisati sva prezimena igraèa koji su ozljeðeni
SELECT b.prezime AS Igrac, a.opisOzljede AS Ozljeda
FROM ozljeda a INNER JOIN igrac b ON a.igrac = b.sifra;

# Ispisati sva prezimena igraèa, broj dresa i imena timova kojima pripadaju igraèi
# poredani od najmanjeg prema najveæem broju dresa
SELECT a.prezime AS Igrac, concat('#',a.brojDresa) AS brojDresa, b.ime AS Tim
FROM igrac a INNER JOIN tim b ON b.sifra = a.tim
ORDER BY a.brojDresa ASC;