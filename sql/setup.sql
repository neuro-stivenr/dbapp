USE business;

CREATE TABLE owners (
    ownerid MEDIUMINT NOT NULL AUTO_INCREMENT,
    ss VARCHAR(10) NOT NULL,
    firstname VARCHAR(32) NOT NULL,
    lastname VARCHAR(32) NOT NULL,
    birthdate DATE NOT NULL,
    phone VARCHAR(10) NOT NULL, 
    email VARCHAR(64) NOT NULL,
    PRIMARY KEY (ownerid)
);

CREATE TABLE companies (
    companyid MEDIUMINT NOT NULL AUTO_INCREMENT,
    companyname VARCHAR(32) NOT NULL,
    companyowner MEDIUMINT,
    addr VARCHAR(128) NOT NULL,
    dotid VARCHAR(12),
    mcid VARCHAR(12),
    taxid VARCHAR(12),
    taxdoc MEDIUMBLOB,
    driverlic MEDIUMBLOB,
    PRIMARY KEY (companyid),
    FOREIGN KEY (companyowner) REFERENCES owners(ownerid)
);
