DROP DATABASE IF EXISTS vegesafe;
CREATE DATABASE vegesafe;
\c vegesafe

CREATE TABLE person (
	userID SERIAL PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(100)
);

CREATE TABLE postcode (
	postcodeID SERIAL PRIMARY KEY,
	postcode NUMERIC(4),
	suburb VARCHAR(50)
);

CREATE TABLE council (
	councilID SERIAL PRIMARY KEY,
	councilname VARCHAR(50)
);

CREATE TABLE postcode_council (
	postcodeID INTEGER REFERENCES postcode ON DELETE CASCADE,
	councilID INTEGER REFERENCES council ON DELETE CASCADE
);

CREATE TABLE address (
	addressID SERIAL PRIMARY KEY,
	unitno NUMERIC(10),
	streetno NUMERIC(10),
	streetname VARCHAR(50),
	postcodeID INTEGER REFERENCES postcode,
	councilID INTEGER REFERENCES council,
	primarymaterial TEXT,
	paintedwall BOOLEAN,
	propertyage NUMERIC(100)
);

CREATE TABLE person_address (
	userID INTEGER REFERENCES person ON DELETE CASCADE,
	addressID INTEGER REFERENCES address ON DELETE CASCADE
);

CREATE TABLE samplesite (
	samplesiteID SERIAL PRIMARY KEY,
	sitecode VARCHAR(1),
	description TEXT
);

CREATE TABLE address_samplesite (
	addressID INTEGER REFERENCES address ON DELETE CASCADE,
	samplesiteID INTEGER REFERENCES samplesite ON DELETE CASCADE
);

CREATE TABLE sample (
	sampleID SERIAL,
	userID INTEGER REFERENCES person,
	addressID INTEGER REFERENCES address,
	samplesiteID INTEGER REFERENCES samplesite,
	arseniccontent DECIMAL,
	cadmiumcontent DECIMAL,
	chromiumcontent DECIMAL,
	coppercontent DECIMAL,
	manganesecontent DECIMAL,
	nickelcontent DECIMAL,
	leadcontent DECIMAL,
	zinccontent DECIMAL,
	sampledate DATE,
	PRIMARY KEY (sampleID, userID, addressID, samplesiteID)
);

INSERT INTO person (firstname, lastname, email) VALUES ('Jane', 'Doe', 'janedoe@gmail.com');
INSERT INTO person (firstname, lastname, email) VALUES ('John', 'Smith', 'johnsmith@gmail.com');

INSERT INTO postcode (postcode, suburb) VALUES ('2019', 'Botany');
INSERT INTO postcode (postcode, suburb) VALUES ('2015', 'Alexandria');
INSERT INTO postcode (postcode, suburb) VALUES ('2020', 'Mascot');

INSERT INTO council (councilname) VALUES ('Sydney');
INSERT INTO council (councilname) VALUES ('Botany Bay');

INSERT INTO postcode_council (postcodeID, councilID) VALUES ('1', '2');
INSERT INTO postcode_council (postcodeID, councilID) VALUES ('2', '1');
INSERT INTO postcode_council (postcodeID, councilID) VALUES ('3', '2');

SELECT * 
FROM person;