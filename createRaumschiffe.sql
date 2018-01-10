CREATE TABLE Personen
(
	SVId int(10) PRIMARY KEY,
	Vorname VARCHAR(50) ,
	Nachname VARCHAR(50), 
	PLZ int(4),
	Ort VARCHAR(50),
	Strasse VARCHAR(50),
	HNr int(10),
	Telefonnummer_a int(15),
	Telefonnummer_b int(15)
);

CREATE TABLE Kontaktperson_Raumfluggesellschaft
(
	SVId int(10) Primary Key REFERENCES Personen(SVId),
	Kundennummer int (10) not null unique,
	Name varchar(50) not null unique
);

CREATE TABLE Bank
(
	BLZ int(10),
    Bank varchar(30), 
    PRIMARY KEY(BLZ, Bank)
);

CREATE TABLE Angestellter_Gehaltskonto
(
	SVId varchar(10) PRIMARY KEY REFERENCES Personen(SVId), 
    AngestelltenNummer varchar(10) not null unique,
    Kontonummer varchar(10) not null,
    BLZ int(10) not null REFERENCES Bank(BLZ),
    Kontostand double
);
	
CREATE TABLE Raumschifftyp 
(
	Typennummer int(10) PRIMARY KEY,
	Sitzanzahl int(5),
	Flugbegleiter VARCHAR(10),
	Typenbezeichnung VARCHAR (10)
);
	
CREATE TABLE Raumschiff
(
	Inventarnummer int(20),
	Typennummer int(10) not null REFERENCES Raumschifftyp(Typennummer),
	Fertigungsjahr int (4) not null,
	Lichtjahr int (10),

	PRIMARY KEY (Inventarnummer, Typennummer) 
);

CREATE TABLE Schalterbediensteter 
(
	SVId varchar(10) PRIMARY KEY REFERENCES Angestellter_Gehaltskonto(SVId),
    SchalterNr int,
    Dienstalter int,
    wartet_auf varchar(10) REFERENCES Schalterbediensteter(SVId)
);

CREATE TABLE Terminal
(
	TerminalNummer int(10),
	notwendiges_personal int(10),
	Kapazitaet int(10)
);

CREATE TABLE Ladepersonal 
(
	SVId varchar(10) PRIMARY KEY REFERENCES Angestellter_Gehaltskonto(SVId),
    LizenzNr int not null unique,
    Überstunden int,
    arbeitete_bei int(10) REFERENCES Terminal(TerminalNummer)
);
	
	
CREATE TABLE Kontaktperson_Bucht_Terminal_Raumschifftypen
(
	SVId int(10) REFERENCES Kontaktperson_Raumfluggesellschaft(SVId),
    TypenNr int not null REFERENCES Raumschifftyp(TypenNr),
    TerminalNr int not null REFERENCES Terminal(TerminalNr),
    Buchungsnummer int unique not null,
    Buchungsdatum varchar(10) not null,
    Beginnzeit varchar(10) not null,
	PRIMARY KEY(Buchungsnummer, TerminalNr, TypenNr)
);

CREATE TABLE Anflugschneisen 
(
	Schneisennummer int PRIMARY KEY
);


CREATE TABLE Kontaktperson_Bucht_Anflugschneisen
(
	SVId varchar(10) REFERENCES Kontaktperson_Raumfluggesellschaft(SVId),
    Schneisennummer int REFERENCES Anflugschneisen(Schneisennummer),
    Buchungsnummer int,
    Buchungsdatum varchar(12) not null,
    Beginnzeit varchar(10),
    Endzeit varchar(10),
    PRIMARY KEY (Buchungsnummer, Schneisennummer)
);

CREATE TABLE Ermaeßigungskarten 
(
	KartenNr int PRIMARY KEY
);

CREATE TABLE Ermaeßigungskarten_Entlehnungen 
(
	KarntenNr int PRIMARY KEY REFERENCES Ermaeßigungskarten(KartenNr),
    Schalterbeamte_SVId varchar(10) not null REFERENCES Schalterbediensteter(SVId),
    Ladeperson_SVId varchar(10) not null REFERENCES Ladepersonal(SVId)
);