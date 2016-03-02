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
	postcodeID SERIAL REFERENCES postcode,
	councilID SERIAL REFERENCES council
);

CREATE TABLE address (
	addressID SERIAL PRIMARY KEY,
	unitno NUMERIC(10),
	streetno NUMERIC(10),
	streetname VARCHAR(50),
	postcodeID SERIAL REFERENCES postcode,
	councilID SERIAL REFERENCES council,
	primarymaterial TEXT,
	paintedwall BOOLEAN,
	propertyage NUMERIC(100)
);

CREATE TABLE samplesite (
	samplesiteID SERIAL PRIMARY KEY,
	sitecode VARCHAR(1),
	description TEXT
);

CREATE TABLE address_samplesite (
	addressID SERIAL REFERENCES address,
	samplesiteID SERIAL REFERENCES samplesite
);

CREATE TABLE sample (
	sampleID SERIAL,
	userID SERIAL REFERENCES person,
	addressID SERIAL REFERENCES address,
	samplesiteID SERIAL REFERENCES samplesite,
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