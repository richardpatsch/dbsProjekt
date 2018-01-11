CREATE TABLE Personen
(
	SVId varchar(10) PRIMARY KEY,
	Vorname VARCHAR(50) ,
	Nachname VARCHAR(50), 
	PLZ int(4),
	Ort VARCHAR(50),
	Strasse VARCHAR(50),
	HNr int(10),
	Telefonnummer_a int(15),
	Telefonnummer_b int(15),
    Passwort varchar(15) not null #pw for login
);

CREATE TABLE Kontaktperson_Raumfluggesellschaft
(
	SVId varchar(10) Primary Key,
	Kundennummer int (10) not null unique,
	Name varchar(50) not null unique,
    FOREIGN KEY(SVId) REFERENCES Personen(SVId)
);

CREATE TABLE Bank
(
	BLZ int(10),
    Bank varchar(30), 
    PRIMARY KEY(BLZ, Bank)
);

CREATE TABLE Angestellter_Gehaltskonto
(
	SVId varchar(10) PRIMARY KEY, 
    AngestelltenNummer varchar(10) not null unique,
    Kontonummer varchar(10) not null,
    BLZ int(10) not null,
    Kontostand double,
    FOREIGN KEY(SVId) REFERENCES Personen(SVId),
    FOREIGN KEY(BLZ) REFERENCES Bank(BLZ)
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
	Typennummer int(10) not null,
	Fertigungsjahr int (4) not null,
	Lichtjahr int (10),

	PRIMARY KEY (Inventarnummer, Typennummer) ,
    FOREIGN KEY(Typennummer) REFERENCES Raumschifftyp(Typennummer)
);

CREATE TABLE Schalterbediensteter 
(
	SVId varchar(10) PRIMARY KEY,
    SchalterNr int,
    Dienstalter int,
    wartet_auf varchar(10),
    
    FOREIGN KEY(SVId) REFERENCES Angestellter_Gehaltskonto(SVId),
    FOREIGN KEY(wartet_auf) REFERENCES Schalterbediensteter(SVId)
);

CREATE TABLE Terminal
(
	TerminalNummer int(10) PRIMARY KEY,
	notwendiges_personal int(10),
	Kapazitaet int(10)
);

CREATE TABLE Ladepersonal 
(
	SVId varchar(10) PRIMARY KEY,
    LizenzNr int not null unique,
    Überstunden int,
    arbeitete_bei int(10),
    
    FOREIGN KEY(SVId) REFERENCES Angestellter_Gehaltskonto(SVId),
    FOREIGN KEY(arbeitete_bei) REFERENCES Terminal(TerminalNummer)
);
	
	
CREATE TABLE Kontaktperson_Bucht_Terminal_Raumschifftypen
(
	SVId varchar(10),
    TypenNr int not null REFERENCES Raumschifftyp(TypenNr),
    TerminalNr int not null REFERENCES Terminal(TerminalNr),
    Buchungsnummer int unique not null,
    Buchungsdatum varchar(10) not null,
    Beginnzeit varchar(10) not null,
    
	PRIMARY KEY(Buchungsnummer, TerminalNr, TypenNr),
    FOREIGN KEY(SVId) REFERENCES Kontaktperson_Raumfluggesellschaft(SVId)
);

CREATE TABLE Anflugschneisen 
(
	Schneisennummer int PRIMARY KEY
);


CREATE TABLE Kontaktperson_Bucht_Anflugschneisen
(
	SVId varchar(10),
    Schneisennummer int,
    Buchungsnummer int,
    Buchungsdatum varchar(12) not null,
    Beginnzeit varchar(10),
    Endzeit varchar(10),
    PRIMARY KEY (Buchungsnummer, Schneisennummer),
    FOREIGN KEY(SVId) REFERENCES Kontaktperson_Raumfluggesellschaft(SVId),
    FOREIGN KEY(Schneisennummer) REFERENCES Anflugschneisen(Schneisennummer)
);

CREATE TABLE Ermaeßigungskarten 
(
	KartenNr int PRIMARY KEY
);

CREATE TABLE Ermaeßigungskarten_Entlehnungen 
(
	KartenNr int PRIMARY KEY,
    Schalterbeamte_SVId varchar(10) not null,
    Ladeperson_SVId varchar(10) not null,
    
    FOREIGN KEY(KartenNr) REFERENCES Ermaeßigungskarten(KartenNr),
    FOREIGN KEY(Ladeperson_SVId) REFERENCES Ladepersonal(SVId),
    FOREIGN KEY(Schalterbeamte_SVId) REFERENCES Schalterbediensteter(SVId)
);