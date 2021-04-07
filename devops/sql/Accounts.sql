CREATE TABLE CLIENT
(
clientId VARCHAR (20) CONSTRAINT PK_CLIENT_ID PRIMARY KEY,
firstName VARCHAR (20),
lastName VARCHAR (20),
socialSecurityNumber BIGINT,
sex varchar(1),
dateOfBirth date,
createdDate date,
modifiedDate date,
citizenship varchar(50),
flagged_customer boolean

);

CREATE TABLE ACCOUNT
(
clientId VARCHAR (20) ,
ACCOUNT_ID VARCHAR (20) CONSTRAINT PK_ACCOUNT_ID PRIMARY KEY,
accountDate date,
frequency varchar(20),
createdDate date,
modifiedDate date,

CONSTRAINT FK_CLIENT_ID_ACCOUNT
      FOREIGN KEY(clientId)
	  REFERENCES CLIENT(clientId)
);



CREATE TABLE CLIENT_CONTACT_DETAILS
(
contactId BIGSERIAL CONSTRAINT PK_CONTACT_ID PRIMARY KEY,
clientId VARCHAR(20),
phoneNumber VARCHAR(20),
emailId VARCHAR(20),
additionalEmailId VARCHAR(20) ,
createdDate DATE,
modifiedDate DATE,

CONSTRAINT FK_CLIENT_ID_CCD
      FOREIGN KEY(clientId)
	  REFERENCES CLIENT(clientId)
);

CREATE TABLE CLIENT_INDICATORS
(
indicatorId BIGSERIAL CONSTRAINT PK_INDICATOR_ID PRIMARY KEY,
clientId VARCHAR(20),
empStatus VARCHAR(20),
incomeGroup VARCHAR(20),
isRiskGroup BOOLEAN,
isPep BOOLEAN,
marital_Status VARCHAR(20) ,
createdDate DATE,
modifiedDate DATE,

CONSTRAINT FK_CLIENT_ID_INDICATORS
      FOREIGN KEY(clientId)
	  REFERENCES CLIENT(clientId)
);


CREATE TABLE ADDRESS_DETAILS
(
addressId BIGSERIAL CONSTRAINT PK_ADDRESS_ID PRIMARY KEY,
clientId VARCHAR(20),
houseNo VARCHAR(10),
streetName VARCHAR(50),
city VARCHAR(50),
pincode BIGINT,
createdDate DATE,
modifiedDate DATE,

CONSTRAINT FK_CLIENT_ADDRESS
      FOREIGN KEY(clientId)
	  REFERENCES CLIENT(clientId)
);



INSERT INTO CLIENT(clientId, firstName, lastName, socialSecurityNumber, sex, dateOfBirth, createdDate,citizenship,flagged_customer)
VALUES
( 'B12456'	,'Brandi'	    ,'Savage'   ,'7854' ,'F','1995-11-18',CURRENT_DATE ,'Austria' ,false ),
( 'C22466'	,'Christopher'	,'Arnold'   ,'3049' ,'M','1978-11-18',CURRENT_DATE ,'Nambia'  ,false ),
( 'J12578'  ,'Jerry'        ,'Miranda'  , '4164','F','1970-11-18',CURRENT_DATE ,'Austria' ,false ),
( 'D90606'  ,'Dustin'       ,'Castillo' , '5084','M','1987-11-18',CURRENT_DATE ,'Suriname'   ,false ),
( 'J23334'  ,'Jack'         ,'Jones'    ,'5903' ,'M','1993-11-18',CURRENT_DATE ,'Austria'  ,true),
( 'E14559'	,'Emily'        ,'Young'    ,'2060' ,'F','1965-11-18',CURRENT_DATE ,'Japan'   ,false ),
( 'L34355'  ,'Linda'        ,'Andrews'  ,'8742'	,'F','1968-11-18',CURRENT_DATE  ,'Austria'  ,false ),
( 'W40699'	,'Wayne'        ,'Montoya'  ,'1936'  ,'M','1992-11-18',CURRENT_DATE ,'Cuba'  ,true),
( 'B58493'  ,'Brian'        ,'Howe'     ,'9693'	 ,'M','1975-11-18',CURRENT_DATE ,'Austria'   ,true ),
( 'M97368'	,'Mark'         ,'Morgan'   , '779'  ,'M','1985-11-18',CURRENT_DATE ,'Austria' ,false );

INSERT INTO ACCOUNT(clientId, ACCOUNT_ID, accountDate, frequency, createdDate)
VALUES
( 'B12456'	,'12286356'	    ,'2001-11-18'  ,'Monthly',CURRENT_DATE ),
( 'C22466'	,'00000356'	    ,'2015-07-08'  ,'Weekly',CURRENT_DATE  ),
( 'D90606'  ,'00286356'     ,'1996-01-19'  ,'Per transaction',CURRENT_DATE  ),
( 'J23334'  ,'00638932'     ,'1996-02-10'  ,'Monthly',CURRENT_DATE  ),
( 'L34355'  ,'02286356'     ,'2019-08-01'  ,'Weekly',CURRENT_DATE  ),
( 'W40699'	,'00000635'     ,'2008-03-27'  ,'Per transaction',CURRENT_DATE  ),
( 'M97368'	,'22286356'     ,'2013-03-27'  ,'Per transaction',CURRENT_DATE  );


INSERT  INTO CLIENT_INDICATORS( CLIENTID, EMPSTATUS, INCOMEGROUP, ISRISKGROUP, ISPEP, MARITAL_STATUS, CREATEDDATE)
VALUES
('B12456','Employeed','50000',false ,false,'Single',CURRENT_DATE );


