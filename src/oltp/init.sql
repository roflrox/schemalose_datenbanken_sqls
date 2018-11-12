CREATE TYPE GESCHLECHT as ENUM ('männlich','weiblich','divers');
CREATE TYPE ROLLE as ENUM ('User','Admin');


CREATE TABLE IF NOT EXISTS Mitglied(
  ID_Mit SERIAL PRIMARY KEY,
  Name VARCHAR(100),
  Rolle ROLLE,
  GebDatum DATE,
  Geschlecht GESCHLECHT

);


CREATE TABLE IF NOT EXISTS Beitraege(
  ID_Bei SERIAL PRIMARY KEY,
  ID_Mit SERIAL REFERENCES Mitglied(ID_Mit),
  Beitrag varchar(4000)

);

CREATE TABLE IF NOT EXISTS Kommentare(
  NR SERIAL,
  ID_Mit SERIAL REFERENCES Mitglied(ID_Mit),
  ID_Bei SERIAL REFERENCES Beitraege(ID_Bei),
  Kommentar varchar(4000),
  PRIMARY KEY (NR,ID_Mit,ID_Bei)


);

INSERT INTO Mitglied (Name,Rolle,GebDatum,Geschlecht)
VALUES ('Klaus','Admin',	to_date('19.9.1999', 'DD.MM.YYYY'),'männlich');


INSERT INTO Beitraege (ID_Mit,Beitrag)
VALUES (1,'Kaesebrot ist ein gutes Brot');

INSERT INTO Kommentare (ID_Mit,ID_Bei,Kommentar)
VALUES (1,1,'Kaesebrot ist ein gutes Brot');