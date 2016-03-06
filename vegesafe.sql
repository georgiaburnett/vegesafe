DROP DATABASE IF EXISTS vegesafe;
CREATE DATABASE vegesafe;
\c vegesafe

CREATE TABLE person (
	userID SERIAL PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50),
	email VARCHAR(100)
);

CREATE TABLE address (
	addressID SERIAL PRIMARY KEY,
	unitno VARCHAR(10),
	streetno VARCHAR(10),
	streetname VARCHAR(50),
	postcode NUMERIC(4),
	suburb VARCHAR(50),
	councilname VARCHAR(50),
	primarymaterial TEXT,
	paintedwall BOOLEAN,
	propertyage NUMERIC(100),
	dateofentry TIMESTAMP WITH TIME ZONE
);

CREATE TABLE person_address (
	userID INTEGER REFERENCES person,
	addressID INTEGER REFERENCES address
);

CREATE TABLE samplesite (
	samplesiteID SERIAL PRIMARY KEY,
	sitecode VARCHAR(1),
	description TEXT
);

CREATE TABLE address_samplesite (
	addressID INTEGER REFERENCES address,
	samplesiteID INTEGER REFERENCES samplesite
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
