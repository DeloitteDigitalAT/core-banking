CREATE TABLE CLIENT
(
clientId VARCHAR (20) CONSTRAINT PK_CLIENT_ID PRIMARY KEY,
firstName VARCHAR (20),
lastName VARCHAR (20),
socialSecurityNumber BIGINT,
sex varchar(1),
dateOfBirth date,
createdDate date,
modifiedDate date

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




INSERT INTO CLIENT(clientId, firstName, lastName, socialSecurityNumber, sex, dateOfBirth, createdDate)
VALUES
( 'B12456'	,'Brandi'	    ,'Savage'   ,'7854' ,'F','1995-11-18',CURRENT_DATE   ),
( 'C22466'	,'Christopher'	,'Arnold'   ,'3049' ,'M','1978-11-18',CURRENT_DATE   ),
( 'J12578'  ,'Jerry'        ,'Miranda'  , '4164','F','1970-11-18',CURRENT_DATE  ),
( 'D90606'  ,'Dustin'       ,'Castillo' , '5084','M','1987-11-18',CURRENT_DATE    ),
( 'J23334'  ,'Jack'         ,'Jones'    ,'5903' ,'M','1993-11-18',CURRENT_DATE   ),
( 'E14559'	,'Emily'        ,'Young'    ,'2060' ,'F','1965-11-18',CURRENT_DATE    ),
( 'L34355'  ,'Linda'        ,'Andrews'  ,'8742'	,'F','1968-11-18',CURRENT_DATE    ),
( 'W40699'	,'Wayne'        ,'Montoya'  ,'1936'  ,'M','1992-11-18',CURRENT_DATE   ),
( 'B58493'  ,'Brian'        ,'Howe'     ,'9693'	 ,'M','1975-11-18',CURRENT_DATE    ),
( 'M97368'	,'Mark'         ,'Morgan'   , '779'  ,'M','1985-11-18',CURRENT_DATE  );

INSERT INTO ACCOUNT(clientId, ACCOUNT_ID, accountDate, frequency, createdDate)
VALUES
( 'B12456'	,'12286356'	    ,'2001-11-18'  ,'Monthly',CURRENT_DATE ),
( 'C22466'	,'00000356'	    ,'2015-07-08'  ,'Weekly',CURRENT_DATE  ),
( 'D90606'  ,'00286356'     ,'1996-01-19'  ,'Per transaction',CURRENT_DATE  ),
( 'J23334'  ,'00638932'     ,'1996-02-10'  ,'Monthly',CURRENT_DATE  ),
( 'L34355'  ,'02286356'     ,'2019-08-01'  ,'Weekly',CURRENT_DATE  ),
( 'W40699'	,'00000635'     ,'2008-03-27'  ,'Per transaction',CURRENT_DATE  ),
( 'M97368'	,'22286356'     ,'2013-03-27'  ,'Per transaction',CURRENT_DATE  );


