DROP DATABASE IF EXISTS vegesafe;
CREATE DATABASE vegesafe;
\c vegesafe

CREATE TABLE person (
	userID SERIAL PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL
);

CREATE TABLE address (
	addressID SERIAL PRIMARY KEY,
	userID INTEGER REFERENCES person,
	unitno VARCHAR(10),
	streetno VARCHAR(50),
	streetname VARCHAR(50) NOT NULL,
	postcode NUMERIC(4) NOT NULL,
	suburb VARCHAR(50) NOT NULL,
	councilname VARCHAR(50), 
	primarymaterial TEXT, 
	paintedwall BOOLEAN, 
	propertyage NUMERIC(4), 
	dateofentry TIMESTAMP WITH TIME ZONE
);

CREATE TABLE samplesite (
	samplesiteID SERIAL PRIMARY KEY,
	addressID INTEGER REFERENCES address,
	sitecode VARCHAR(1) NOT NULL,
	description TEXT
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

